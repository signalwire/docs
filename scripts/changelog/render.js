#!/usr/bin/env node
/**
 * Changelog renderer — STAGE 3 of 3.
 *
 * Reads the classified entries, validates them strictly, and writes the two
 * artifacts that a human reviews in the weekly PR:
 *
 *   <changelog dir, see config.js>/<date>.mdx     public, `notable` only
 *   .github/changelog-state/batches/<date>/digest.md            internal, notable + minor
 *
 * These two markdown files are the single source of truth. The Slack digests are
 * rendered FROM them at publish time by changelog-publish.yml, so editing an
 * entry during review changes every downstream audience with no chance of drift.
 *
 * Usage:
 *   node scripts/changelog/render.js                      # newest work folder
 *   node scripts/changelog/render.js --date 2026-08-17
 *   node scripts/changelog/render.js --date 2026-08-17 --dry-run
 *
 * Validation is deliberately strict and fatal. In phase 1 classified.json is
 * pasted in by hand, so a malformed file is expected; failing loudly with the
 * exact field at fault is the whole point. Re-run after fixing — the script is
 * idempotent and overwrites its outputs.
 *
 * Environment Variables:
 *   LOGGER_LEVEL  Set log verbosity: error, warn, info, debug, trace (default: info)
 */

import { existsSync, mkdirSync, readFileSync, writeFileSync } from 'node:fs';
import { join } from 'node:path';
import { fileURLToPath } from 'node:url';
import { createRequire } from 'node:module';
import { Logger } from '../utils/logger.js';
import {
  CHANGELOG_DIR,
  CHANGELOG_DIR_REL,
  CHANGELOG_URL_PATH,
  LEDGER_PATH,
  REPO_ROOT,
  batchDir,
  draftBranch,
  entryHeadings,
  newestBatchDate,
  repoSlug,
} from './config.js';

const require = createRequire(import.meta.url);
const { TIERS, TIER_ROUTING } = require('../../.github/scripts/changelog-criteria.cjs');

const log = new Logger();

const VALID_STATUS = ['added', 'modified', 'removed', 'renamed', 'changed'];

// ============================================
// Validation
// ============================================

/**
 * Validate the classified payload, collecting every problem before failing.
 *
 * Returns the entries. Throws with a numbered list of problems if anything is
 * wrong, so a hand-pasted file can be fixed in one pass rather than N runs.
 */
function validate(payload, knownPrs) {
  const problems = [];

  if (!payload || typeof payload !== 'object') {
    throw new Error('classified.json is not a JSON object');
  }
  if (!Array.isArray(payload.entries)) {
    throw new Error('classified.json has no "entries" array');
  }
  if (payload.entries.length === 0) {
    throw new Error('classified.json has an empty "entries" array');
  }

  const seen = new Set();

  payload.entries.forEach((e, i) => {
    const at = `entries[${i}]${e?.pr ? ` (PR #${e.pr})` : ''}`;

    if (typeof e.pr !== 'number') {
      problems.push(`${at}: "pr" must be a number`);
    } else {
      if (seen.has(e.pr)) problems.push(`${at}: duplicate entry for PR #${e.pr}`);
      seen.add(e.pr);
      if (knownPrs && !knownPrs.has(e.pr)) {
        problems.push(`${at}: PR #${e.pr} is not in input.json — hallucinated or wrong window`);
      }
    }

    if (!TIERS.includes(e.tier)) {
      problems.push(`${at}: "tier" must be one of ${TIERS.join(', ')} (got ${JSON.stringify(e.tier)})`);
      return;
    }

    // skip entries need nothing else; they exist only for auditability.
    if (e.tier === 'skip') return;

    if (!e.entry_title || typeof e.entry_title !== 'string') {
      problems.push(`${at}: "entry_title" is required for tier "${e.tier}"`);
    }
    if (!e.entry_body || typeof e.entry_body !== 'string') {
      problems.push(`${at}: "entry_body" is required for tier "${e.tier}"`);
    }
    if (e.tier === 'minor' && !e.internal_detail) {
      problems.push(`${at}: "internal_detail" is required for tier "minor" — the digest is its only audience`);
    }

    if (!Array.isArray(e.pages)) {
      problems.push(`${at}: "pages" must be an array`);
    } else {
      e.pages.forEach((p, j) => {
        if (!p?.path) problems.push(`${at}.pages[${j}]: "path" is required`);
        if (p?.status && !VALID_STATUS.includes(p.status)) {
          problems.push(`${at}.pages[${j}]: unexpected status ${JSON.stringify(p.status)}`);
        }
        // A URL that is not root-relative would render as a broken link.
        if (p?.url != null && !String(p.url).startsWith('/docs/')) {
          problems.push(`${at}.pages[${j}]: "url" must start with /docs/ or be null (got ${JSON.stringify(p.url)})`);
        }
      });
    }
  });

  if (problems.length > 0) {
    const list = problems.map((p, i) => `  ${i + 1}. ${p}`).join('\n');
    throw new Error(`classified.json failed validation (${problems.length} problems):\n${list}`);
  }

  return payload.entries;
}

// ============================================
// Rendering
// ============================================

/** Distinct product tags across entries, for the MDX frontmatter. */
function collectTags(entries) {
  const tags = new Set();
  for (const e of entries) {
    if (e.product && e.product !== 'other') tags.add(e.product);
  }
  return [...tags].sort();
}

/**
 * Resolve an entry's pages against the collected repo data.
 *
 * URL and link text always come from `input.json`, which read them from the
 * page's own frontmatter — never from the classifier's output. A model can
 * plausibly invent both, and Fern reference slugs in particular cannot be
 * derived by hand.
 */
function resolveLinks(entry, pageMeta) {
  const seen = new Set();
  const links = [];

  for (const page of entry.pages ?? []) {
    const meta = pageMeta.get(page.path);
    const url = meta?.url ?? null;
    if (!url || seen.has(url)) continue;
    seen.add(url);
    // Link text names its destination and stands alone out of context.
    links.push({ url, label: meta?.title || url, status: page.status });
  }

  return links;
}

/** One `##` section: the unit Fern renders as a single timeline card. */
function renderEntrySection(entry, pageMeta) {
  const links = resolveLinks(entry, pageMeta);
  let section = `## ${entry.entry_title}\n\n${entry.entry_body.trim()}\n`;

  if (links.length === 1) {
    section += `\nSee [${links[0].label}](${links[0].url}).\n`;
  } else if (links.length > 1) {
    // Don't call a brand-new page an update.
    const heading = links.every((l) => l.status === 'added') ? 'New pages' : 'Updated pages';
    const list = links.map((l) => `- [${l.label}](${l.url})`).join('\n');
    section += `\n${heading}:\n\n${list}\n`;
  }
  return section;
}

/** Parse an existing entry file into its tags and its `##` sections. */
function parseExistingFile(contents) {
  let tags = [];
  let body = contents;

  if (contents.startsWith('---')) {
    const end = contents.indexOf('\n---', 3);
    if (end !== -1) {
      const fm = readFrontmatterTags(contents.slice(4, end));
      if (fm) tags = fm;
      body = contents.slice(end + 4);
    }
  }

  const sections = body
    .split(/^(?=##\s)/m)
    .map((s) => s.trim())
    .filter(Boolean);

  return { tags, sections };
}

function readFrontmatterTags(raw) {
  const match = raw.match(/tags:\s*(\[[^\]]*\])/);
  if (!match) return null;
  try {
    return JSON.parse(match[1]);
  } catch {
    return null;
  }
}

/**
 * Heading text of a `##` section, used to avoid duplicating an entry.
 *
 * Delegates to config.js so there is exactly one definition of what a `##`
 * heading is — collect uses the same helper to record priorHeadings, and dedup
 * breaks the moment the two disagree.
 */
function sectionHeading(section) {
  return entryHeadings(section)[0] ?? '';
}

/**
 * Build one dated entry file.
 *
 * Merges into whatever is already on disk for that date rather than overwriting:
 * a re-run or a backfill that lands on an already-published date must not silently
 * drop the entries already there. Existing sections win, so hand edits survive.
 */
function buildDatedFile(existingContents, entries, pageMeta) {
  const incoming = entries.map((e) => renderEntrySection(e, pageMeta).trim());
  const incomingTags = collectTags(entries);

  let sections = incoming;
  let tags = incomingTags;

  if (existingContents) {
    const existing = parseExistingFile(existingContents);
    const have = new Set(existing.sections.map(sectionHeading));
    const fresh = incoming.filter((s) => !have.has(sectionHeading(s)));
    sections = [...existing.sections, ...fresh];
    tags = [...new Set([...existing.tags, ...incomingTags])].sort();
  }

  const frontmatter = tags.length ? `---\ntags: ${JSON.stringify(tags)}\n---\n\n` : '';
  return `${frontmatter}${sections.join('\n\n')}\n`;
}

/**
 * The internal digest. Everything that reached `notable` or `minor`, grouped by
 * product, with the specific difference spelled out and the page URL.
 *
 * This is the single source for every internal channel — Slack renders one payload
 * from it at publish time, so adding a channel is a webhook, not another artifact.
 */
function renderDigest(date, entries, window, pageMeta) {
  const relevant = entries.filter((e) => TIER_ROUTING[e.tier]?.includes('slack'));
  if (relevant.length === 0) return null;

  const byProduct = new Map();
  for (const e of relevant) {
    const key = e.product || 'other';
    if (!byProduct.has(key)) byProduct.set(key, []);
    byProduct.get(key).push(e);
  }

  const counts = {
    notable: relevant.filter((e) => e.tier === 'notable').length,
    minor: relevant.filter((e) => e.tier === 'minor').length,
  };

  const sections = [...byProduct.entries()]
    .sort(([a], [b]) => a.localeCompare(b))
    .map(([product, items]) => {
      const body = items
        .sort((a, b) => (a.tier === b.tier ? 0 : a.tier === 'notable' ? -1 : 1))
        .map((e) => {
          const label = e.tier === 'notable' ? 'New' : 'Changed';
          const detail = (e.internal_detail || e.entry_body || '').trim();

          const pages = (e.pages ?? [])
            .map((p) => {
              const status = p.status ? `${p.status}: ` : '';
              const meta = pageMeta.get(p.path);
              return meta?.url
                ? `  - ${status}[${meta.title || meta.url}](${meta.url})`
                : `  - ${status}\`${p.path}\``;
            })
            .join('\n');

          return `- **${label} — ${e.entry_title}** ([#${e.pr}](https://github.com/${repoSlug()}/pull/${e.pr}))\n\n  ${detail}\n\n${pages}`;
        })
        .join('\n\n');

      return `## ${product}\n\n${body}`;
    })
    .join('\n\n');

  const plural = (n, one, many) => `${n} ${n === 1 ? one : many}`;

  return `# Documentation changes — ${date}

Covers documentation merged between ${window.since} and ${window.until}.
${plural(counts.notable, 'new or changed capability', 'new or changed capabilities')}, ${plural(counts.minor, 'correction or move', 'corrections and moves')}.

Entries marked **New** also appear on the public [changelog](/docs${CHANGELOG_URL_PATH}).
Entries marked **Changed** stay internal: corrections to things the docs
previously got wrong, pages that moved, and gaps that were filled.

${sections}
`;
}

// ============================================
// Main
// ============================================

function main() {
  const args = process.argv.slice(2);
  let date = null;
  let dryRun = false;

  for (let i = 0; i < args.length; i++) {
    if (args[i] === '--date' && args[i + 1]) date = args[++i];
    if (args[i] === '--dry-run') dryRun = true;
    if (args[i] === '-h' || args[i] === '--help') {
      console.log(`
Usage: node scripts/changelog/render.js [options]

Options:
  --date <YYYY-MM-DD>  Batch to render (default: newest under .github/changelog-state/batches/)
  --dry-run            Print what would be written without writing it

Reads  .github/changelog-state/batches/<date>/{input.json,classified.json}
Writes ${CHANGELOG_DIR_REL}/<date>.mdx      (notable only)
       .github/changelog-state/batches/<date>/digest.md          (notable + minor)
`);
      process.exit(0);
    }
  }

  log.header('Changelog renderer');
  log.newline();

  date = date ?? newestBatchDate();
  if (!date) {
    throw new Error('No work folder found. Run: yarn changelog:collect');
  }

  const workDir = batchDir(date);
  const classifiedPath = join(workDir, 'classified.json');
  const inputPath = join(workDir, 'input.json');

  if (!existsSync(classifiedPath)) {
    throw new Error(
      `Missing ${classifiedPath.replace(`${REPO_ROOT}/`, '')}\n\n` +
        `  Paste ${join(workDir, 'prompt.md').replace(`${REPO_ROOT}/`, '')} into Claude Code,\n` +
        '  then save the JSON reply to that path and re-run.',
    );
  }

  let payload;
  try {
    payload = JSON.parse(readFileSync(classifiedPath, 'utf8'));
  } catch (err) {
    throw new Error(
      `${classifiedPath.replace(`${REPO_ROOT}/`, '')} is not valid JSON: ${err.message}\n` +
        '  If you pasted the reply with markdown fences, remove the ``` lines.',
    );
  }

  // Cross-check against what was actually collected, so a stale or hallucinated
  // PR number cannot reach a customer-facing page.
  if (!existsSync(inputPath)) {
    throw new Error(
      `Missing ${inputPath.replace(`${REPO_ROOT}/`, '')} — it carries each PR's merge date and ` +
        'page URLs. Re-run: yarn changelog:collect',
    );
  }

  const input = JSON.parse(readFileSync(inputPath, 'utf8'));
  const knownPrs = new Set((input.prs ?? []).map((p) => p.number));
  const window = input.window ?? { since: 'unknown', until: date };
  const pageMeta = new Map();
  const mergeDates = new Map();

  for (const pr of input.prs ?? []) {
    // Each entry is dated by when its PR merged, not when the batch was drafted.
    if (pr.mergedAt) mergeDates.set(pr.number, pr.mergedAt.slice(0, 10));

    // Authoritative URLs and link text, read from page frontmatter at collect time.
    for (const file of pr.files ?? []) {
      if (file.url) pageMeta.set(file.path, { url: file.url, title: file.title ?? null });
    }
  }

  const entries = validate(payload, knownPrs);

  const tally = TIERS.map((t) => `${entries.filter((e) => e.tier === t).length} ${t}`).join(', ');
  log.info(`${entries.length} classified entries: ${tally}`);

  const lowConfidence = entries.filter((e) => typeof e.confidence === 'number' && e.confidence < 0.7);
  if (lowConfidence.length > 0) {
    log.newline();
    const c = log.collector('low-confidence');
    for (const e of lowConfidence) {
      c.warn(`#${e.pr} [${e.tier}] ${e.entry_title ?? '(skipped)'} — ${e.reasoning ?? 'no reasoning given'}`);
    }
    c.flush({ header: `${lowConfidence.length} entries need a closer look in review:` });
  }

  // Group notable entries by the date their PR merged, so each entry lands on the
  // timeline under its real date instead of the date the batch was drafted.
  const byDate = new Map();
  const undated = [];
  for (const entry of entries.filter((e) => e.tier === 'notable')) {
    const merged = mergeDates.get(entry.pr);
    if (!merged) {
      undated.push(entry);
      continue;
    }
    if (!byDate.has(merged)) byDate.set(merged, []);
    byDate.get(merged).push(entry);
  }

  if (undated.length > 0) {
    // Should not happen: validate() already rejects PRs absent from input.json.
    throw new Error(
      `No merge date for PR ${undated.map((e) => `#${e.pr}`).join(', ')}. Re-run: yarn changelog:collect`,
    );
  }

  const digest = renderDigest(date, entries, window, pageMeta);

  log.newline();

  if (byDate.size === 0) {
    log.warn('No notable entries — no public changelog files for this window.');
  }
  if (!digest) {
    log.warn('No notable or minor entries — no internal digest for this window.');
  }
  // Note: even a fully-skipped batch advances the ledger below, so those PRs are
  // not reclassified next run. That is why the ledger write is unconditional.

  const dates = [...byDate.keys()].sort();
  const files = dates.map((d) => {
    const path = join(CHANGELOG_DIR, `${d}.mdx`);
    const existing = existsSync(path) ? readFileSync(path, 'utf8') : null;
    return {
      date: d,
      path,
      existed: Boolean(existing),
      // Headings already in the file before this batch. The Slack digest excludes
      // them, so appending a late entry to an already-published date cannot
      // re-announce that date's earlier entries.
      alreadyReported: entryHeadings(existing),
      contents: buildDatedFile(existing, byDate.get(d), pageMeta),
      count: byDate.get(d).length,
    };
  });

  // Link text ships to customers as written. Reference-page frontmatter titles are
  // often a bare lowercase token ("params", "ai") that does not name its destination
  // out of context, which the MDX style rules require. Nothing here can invent better
  // prose, so surface them for the reviewer's reword pass.
  //
  // Scoped to sections this run actually writes: a section already on disk keeps its
  // own text when buildDatedFile merges, so warning about it would re-flag labels a
  // reviewer has already fixed.
  const bareLabels = files
    .flatMap((f) => {
      const already = new Set(f.alreadyReported);
      return byDate
        .get(f.date)
        .filter((e) => !already.has(e.entry_title))
        .flatMap((e) => resolveLinks(e, pageMeta).map((link) => ({ pr: e.pr, ...link })));
    })
    .filter((link) => /^[a-z0-9._-]+$/.test(link.label));

  if (bareLabels.length > 0) {
    log.newline();
    const c = log.collector('bare-link-text');
    for (const link of bareLabels) c.warn(`#${link.pr} [${link.label}](${link.url})`);
    c.flush({ header: `${bareLabels.length} link labels do not stand alone out of context:` });
  }

  const digestPath = join(batchDir(date), 'digest.md');
  const manifestPath = join(batchDir(date), 'manifest.json');

  // A dry run writes nothing, ledger included — it must be safe to re-run.
  if (dryRun) {
    for (const f of files) {
      log.header(`--- ${f.path.replace(`${REPO_ROOT}/`, '')}${f.existed ? ' (merging into existing)' : ''} ---`);
      console.log(f.contents);
    }
    if (digest) {
      log.header(`--- ${digestPath.replace(`${REPO_ROOT}/`, '')} ---`);
      console.log(digest);
    }
    return;
  }

  mkdirSync(CHANGELOG_DIR, { recursive: true });
  for (const f of files) {
    writeFileSync(f.path, f.contents);
    const how = f.existed ? 'merged into' : 'wrote';
    log.success(`${how} ${f.path.replace(`${REPO_ROOT}/`, '')} (${f.count} ${f.count === 1 ? 'entry' : 'entries'})`);
  }

  mkdirSync(batchDir(date), { recursive: true });
  if (digest) {
    writeFileSync(digestPath, digest);
    log.success(`Wrote ${digestPath.replace(`${REPO_ROOT}/`, '')}`);
  }

  const hasArtifacts = files.length > 0 || Boolean(digest);

  // The batch manifest is what changelog-publish.yml keys off. Entry files are now
  // one-per-merge-date, so triggering on those would post one Slack digest per
  // date; the manifest gives the batch a single identity and one post each.
  const manifestFiles = files.map((f) => ({
    path: f.path.replace(`${REPO_ROOT}/`, ''),
    alreadyReported: f.alreadyReported,
  }));

  // No manifest on a batch with nothing to announce: its absence is what tells
  // changelog-publish.yml there is no Slack post to make.
  if (hasArtifacts) {
    writeFileSync(
      manifestPath,
      `${JSON.stringify(
        {
          batch: date,
          window,
          entryFiles: manifestFiles,
          dates,
          digest: digest ? digestPath.replace(`${REPO_ROOT}/`, '') : null,
        },
        null,
        2,
      )}\n`,
    );
    log.success(`Wrote ${manifestPath.replace(`${REPO_ROOT}/`, '')}`);
  }

  // Advance the ledger. It ships in the same PR that publishes the entries, so
  // merging moves the watermark atomically with publication; abandoning the draft
  // leaves these PRs unreported and they come back in the next run.
  const ledger = existsSync(LEDGER_PATH)
    ? JSON.parse(readFileSync(LEDGER_PATH, 'utf8'))
    : { reported: {} };
  ledger.reported = ledger.reported ?? {};

  for (const entry of entries) {
    ledger.reported[String(entry.pr)] = {
      batch: date,
      window,
      tier: entry.tier,
    };
  }

  writeFileSync(LEDGER_PATH, `${JSON.stringify(ledger, null, 2)}\n`);
  log.success(
    `Ledger now covers ${Object.keys(ledger.reported).length} PRs (+${entries.length} this batch)`,
  );

  log.newline();
  if (!hasArtifacts) {
    log.success('Nothing reportable in this batch. Commit the ledger so these PRs are not reclassified.');
    return;
  }
  log.header('Next: review');
  log.info('  yarn fern-md-check');
  log.info(`  Review the files above, then commit on branch ${draftBranch(date)}`);
}

// Exported for render.test.js
export {
  validate,
  buildDatedFile,
  parseExistingFile,
  sectionHeading,
  collectTags,
  resolveLinks,
};

// Only run when invoked directly, not when imported (matches check-md-exports.js)
if (process.argv[1] === fileURLToPath(import.meta.url)) {
  try {
    main();
  } catch (err) {
    log.failure(err.message);
    log.debug(err.stack);
    process.exit(1);
  }
}
