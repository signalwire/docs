/**
 * Shared configuration for the changelog pipeline.
 *
 * Path filtering lives here rather than in prose so that "what counts as a docs
 * change" is one editable list. See .github/scripts/changelog-criteria.cjs for
 * the tiering rubric, which is the other half of the noise controls.
 */

import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';

const __dirname = dirname(fileURLToPath(import.meta.url));

export const REPO_ROOT = dirname(dirname(__dirname));
export const CHANGELOG_DIR = join(REPO_ROOT, 'fern', 'products', 'home', 'changelog');
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

/** Repo-relative path of the changelog directory, for matching PR file lists. */
export const CHANGELOG_DIR_REL = 'fern/products/home/changelog';

/**
 * True for a dated changelog entry file.
 *
 * `overview.mdx` is hand-maintained and is not an entry, so a PR editing only the
 * overview is not self-documenting a change.
 */
export function isChangelogEntryFile(path) {
  return new RegExp(`^${CHANGELOG_DIR_REL}/\\d{4}-\\d{2}-\\d{2}\\.mdx?$`).test(path);
}

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
 */
const EXCLUDE = [
  /^specs\/.*\/tsp-output\//,
  /^fern\/apis\/.*\/openapi\.ya?ml$/,
  /\.draft$/,
  /^scripts\//,
  /^\.github\//,
  /^fern\/assets\//,
  /\.(css|scss|js|jsx|ts|tsx|png|jpe?g|svg|gif|webp|ico)$/,
];

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

/** Max files listed individually per PR. Beyond this, a per-directory tally. */
export const MAX_LISTED_FILES = 20;

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
