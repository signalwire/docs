/**
 * Shared configuration for the changelog pipeline.
 *
 * Path filtering lives here rather than in prose so that "what counts as a docs
 * change" is one editable list. See .github/scripts/changelog-criteria.cjs for
 * the tiering rubric, which is the other half of the noise controls.
 */

import { execFileSync } from 'node:child_process';
import { existsSync, readdirSync } from 'node:fs';
import { createRequire } from 'node:module';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';

const require = createRequire(import.meta.url);
const __dirname = dirname(fileURLToPath(import.meta.url));

export const REPO_ROOT = dirname(dirname(__dirname));

/**
 * Where the published changelog lives — the single source for the whole
 * pipeline, including the draft workflow, which reads it via `node -e`.
 *
 * Fern requires the folder itself to be named exactly `changelog`. Three places
 * cannot read this file and must be kept in sync by hand when things move: the
 * nav entry in the owning product's yml (`- changelog: ./changelog`), the navbar
 * link in fern/docs.yml, and the state-dir ignore rules in .gitignore.
 */
export const CHANGELOG_DIR_REL = 'fern/products/platform/changelog';

/** Public URL path of the changelog page, appended to the site's /docs base. */
export const CHANGELOG_URL_PATH = '/platform/changelog';

export const CHANGELOG_DIR = join(REPO_ROOT, CHANGELOG_DIR_REL);
/**
 * Pipeline state and non-public outputs.
 *
 * Named `changelog-state`, not `changelog`: Fern requires the published content
 * folder to be named exactly `changelog`, so an identically named directory here
 * would be one glance away from looking like customer-facing content. Nothing
 * under this directory is published. See its README.md.
 */
export const STATE_DIR = join(REPO_ROOT, '.github', 'changelog-state');

/** Everything about one batch lives in one folder, so the date appears once. */
export function batchDir(date) {
  return join(STATE_DIR, 'batches', date);
}

/** Most recent batch on disk, for tools that default to "the one I just ran". */
export function newestBatchDate() {
  const batchesDir = join(STATE_DIR, 'batches');
  if (!existsSync(batchesDir)) return null;
  const dates = readdirSync(batchesDir)
    .filter((d) => /^\d{4}-\d{2}-\d{2}$/.test(d))
    .sort();
  return dates.length ? dates[dates.length - 1] : null;
}

/**
 * The idempotency ledger: which PRs have already been reported, and in which batch.
 *
 * PR number, not date, is the durable identity of a change. Deriving the next
 * window from published entry dates fails whenever a batch produces no public
 * entry — a week of only corrections leaves the watermark unmoved and re-reports
 * those corrections to Support forever. The ledger is committed by the same PR
 * that publishes, so the watermark advances atomically with publication and an
 * abandoned draft correctly leaves its PRs unreported.
 */
export const LEDGER_PATH = join(STATE_DIR, 'reported-prs.json');

/** Paths that can produce a changelog entry. */
const INCLUDE = [
  /^fern\/products\/[^/]+\/pages\/.+\.mdx$/,
  /^fern\/snippets\/.+\.mdx$/,
  /^specs\/.+\.tsp$/,
  /^fern\/products\/[^/]+\/[^/]+\.yml$/,
  /^fern\/docs\.yml$/,
];

/**
 * Paths that never produce an entry, checked BEFORE INCLUDE so that generated
 * output nested under an included prefix is still excluded.
 *
 * Drafts need no rule here: the convention is `<name>.mdx.draft`, and every
 * INCLUDE pattern is anchored to a real extension, so a draft never matches one.
 */
const EXCLUDE = [
  /^specs\/.*\/tsp-output\//,
  /^fern\/apis\/.*\/openapi\.ya?ml$/,
  /^scripts\//,
  /^\.github\//,
  /^fern\/assets\//,
  /\.(css|scss|js|jsx|ts|tsx|png|jpe?g|svg|gif|webp|ico)$/,
];

/**
 * Repo slug (owner/name), resolved explicitly rather than letting gh infer it:
 * this checkout can have several remotes (forks included), and inferring would
 * silently target the wrong repo. CI sets GITHUB_REPOSITORY; locally GH_REPO or
 * the origin remote decides. Returns null when nothing resolves — collect treats
 * that as an error rather than guessing which repo's PRs to read.
 */
export function resolveRepo() {
  const fromEnv = process.env.GH_REPO || process.env.GITHUB_REPOSITORY;
  if (fromEnv) return fromEnv;
  try {
    const url = execFileSync('git', ['remote', 'get-url', 'origin'], {
      cwd: REPO_ROOT,
      encoding: 'utf8',
    }).trim();
    const match = url.match(/github\.com[:/](.+?)(?:\.git)?$/);
    return match ? match[1] : null;
  } catch {
    return null;
  }
}

let cachedRepoSlug;

/**
 * Repo slug for building GitHub links (PR references, file permalinks). Unlike
 * resolveRepo, this never returns null: a link built in an environment with no
 * usable remote should still point at the canonical repo.
 */
export function repoSlug() {
  cachedRepoSlug ??= resolveRepo() ?? 'signalwire/docs';
  return cachedRepoSlug;
}

/** Branch name prefix the draft workflow uses to find its own open PRs. */
export const DRAFT_BRANCH_PREFIX = 'action-';

/** Branch the draft workflow opens for a batch — also printed as a hint by render. */
export function draftBranch(date) {
  return `${DRAFT_BRANCH_PREFIX}${date.replace(/-/g, '')}-changelog`;
}

/**
 * The `##` headings of a changelog entry file.
 *
 * A heading is the identity of an entry. Render records the headings already in a
 * dated file in the manifest, so the Slack digests announce only what this batch
 * added rather than re-announcing that date's earlier entries.
 */
export function entryHeadings(markdown) {
  if (!markdown) return [];
  return [...markdown.matchAll(/^##\s+(.+)$/gm)].map((m) => m[1].trim());
}

/** True when a changed file is worth showing to the classifier. */
export function isDocsRelevant(path) {
  if (EXCLUDE.some((re) => re.test(path))) return false;
  return INCLUDE.some((re) => re.test(path));
}

/**
 * Prompt budget.
 *
 * These exist because sweeping mechanical PRs — a brand-capitalization pass over
 * 125 files, a CRLF normalization over 67 — would otherwise dominate the prompt
 * while being exactly the changes that should tier as `skip`. A representative
 * sample of diffs plus accurate counts classifies such a PR just as well as the
 * full diff, at a fraction of the size.
 */

/** Max diff characters for a single file. */
export const MAX_PATCH_CHARS = 1200;

/** Max diff characters across all files in one PR. */
export const MAX_PATCH_CHARS_PER_PR = 6000;

/**
 * Max files listed individually per PR. Beyond this, a per-directory tally.
 *
 * Defined in changelog-criteria.cjs and re-exported here rather than duplicated:
 * its only consumer is the CommonJS prompt builder, which cannot import this
 * file, but ESM callers should still have one import surface for the budgets.
 */
export const { MAX_LISTED_FILES } = require('../../.github/scripts/changelog-criteria.cjs');

/**
 * True when a diff changes nothing but whitespace, line endings, or letter case.
 *
 * Used to flag mechanical sweeps for the classifier. Compares only the +/- lines,
 * normalized; a diff whose additions and removals are equal under normalization
 * carries no semantic change.
 */
export function isMechanicalPatch(patch) {
  if (!patch) return false;

  const norm = (lines) =>
    lines
      .map((l) => l.slice(1).replace(/\s+/g, ' ').trim().toLowerCase())
      .filter(Boolean)
      .sort()
      .join('\n');

  const lines = patch.split('\n');
  const added = lines.filter((l) => l.startsWith('+') && !l.startsWith('+++'));
  const removed = lines.filter((l) => l.startsWith('-') && !l.startsWith('---'));

  if (added.length === 0 || removed.length === 0) return false;
  return norm(added) === norm(removed);
}
