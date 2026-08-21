#!/usr/bin/env node
/**
 * Renders Slack Block Kit payloads FROM the merged markdown artifacts.
 *
 * This runs at publish time, after a human has reviewed and merged the weekly PR.
 * It deliberately reads the committed markdown rather than any intermediate JSON:
 * the reviewed files are the single source of truth, so an edit made during review
 * reaches Slack automatically and the three audiences cannot drift apart.
 *
 * Usage:
 *   node scripts/changelog/slack-digest.js --audience devex   --date 2026-08-17
 *   node scripts/changelog/slack-digest.js --audience support --date 2026-08-17
 *   node scripts/changelog/slack-digest.js --audience devex   --date 2026-08-17 --output payload.json
 *
 * Exits 2 (not 1) when there is nothing to post for that audience, so the
 * workflow can distinguish "quiet week" from "something broke".
 */

import { existsSync, readFileSync, writeFileSync } from 'node:fs';
import { join } from 'node:path';
import { fileURLToPath } from 'node:url';
import yaml from 'js-yaml';
import { Logger } from '../utils/logger.js';
import { CHANGELOG_DIR, REPO_ROOT, batchDir } from './config.js';

const log = new Logger();

/** Slack rejects section text over 3000 chars; leave headroom like cloud-product does. */
const MAX_SECTION_CHARS = 2900;

const EXIT_NOTHING_TO_POST = 2;

// ============================================
// Helpers
// ============================================

/** Production docs base URL, read from the first instance in fern/docs.yml. */
function docsBaseUrl() {
  const doc = yaml.load(readFileSync(join(REPO_ROOT, 'fern', 'docs.yml'), 'utf8'));
  const instance = doc.instances?.[0];
  const host = instance?.['custom-domain'] || instance?.url;
  if (!host) throw new Error('Could not read a docs URL from fern/docs.yml instances');
  return `https://${host.replace(/^https?:\/\//, '').replace(/\/$/, '')}`;
}

function truncate(text) {
  if (text.length <= MAX_SECTION_CHARS) return text;
  return `${text.slice(0, MAX_SECTION_CHARS - 20).trimEnd()}\n_…truncated_`;
}

/** Strip frontmatter from an MDX/MD file. */
function stripFrontmatter(contents) {
  if (!contents.startsWith('---')) return contents;
  const end = contents.indexOf('\n---', 3);
  return end === -1 ? contents : contents.slice(end + 4);
}

/**
 * Convert a subset of markdown to Slack mrkdwn.
 * Markdown links become <url|label>; bold survives as-is; headings are handled
 * by the callers, which split on them.
 */
function toMrkdwn(text, baseUrl) {
  return text
    .replace(/\[([^\]]+)\]\((\/docs\/[^)]+)\)/g, (_, label, path) => `<${baseUrl}${path.replace(/^\/docs/, '')}|${label}>`)
    .replace(/\[([^\]]+)\]\((https?:\/\/[^)]+)\)/g, '<$2|$1>')
    .replace(/^#+\s*/gm, '')
    .trim();
}

/** Split markdown into { heading, body } sections at a given heading level. */
function splitSections(markdown, level) {
  const marker = `${'#'.repeat(level)} `;
  const lines = markdown.split('\n');
  const sections = [];
  let current = null;

  for (const line of lines) {
    if (line.startsWith(marker)) {
      if (current) sections.push(current);
      current = { heading: line.slice(marker.length).trim(), body: [] };
    } else if (current) {
      current.body.push(line);
    }
  }
  if (current) sections.push(current);

  return sections.map((s) => ({ heading: s.heading, body: s.body.join('\n').trim() }));
}

// ============================================
// Audiences
// ============================================

/**
 * Entry files belonging to a batch, from the manifest render.js wrote.
 *
 * Entry files are named for the date their PR merged, so one batch spans several
 * of them. The manifest is the only thing that knows which belong together.
 */
function readManifest(batchDate) {
  const manifestPath = join(batchDir(batchDate), 'manifest.json');
  if (!existsSync(manifestPath)) return null;
  const manifest = JSON.parse(readFileSync(manifestPath, 'utf8'));
  return {
    ...manifest,
    entryFiles: (manifest.entryFiles ?? []).map((f) => ({
      path: join(REPO_ROOT, f.path),
      alreadyReported: f.alreadyReported ?? [],
    })),
  };
}

/** Label for a batch covering several merge dates. */
function windowLabel(window, fallbackDate) {
  if (!window?.since || !window?.until) return fallbackDate;
  return window.since === window.until ? window.until : `${window.since} to ${window.until}`;
}

/**
 * #devex-general: what shipped, terse, one line per notable entry.
 * Built from the public changelog files, so it never says more than customers see.
 */
function buildDevexPayload(date, baseUrl) {
  const manifest = readManifest(date);
  if (!manifest) {
    // No manifest: fall back to a single same-dated entry file.
    const single = join(CHANGELOG_DIR, `${date}.mdx`);
    if (!existsSync(single)) return null;
    return buildDevexFromFiles(date, baseUrl, [{ path: single, alreadyReported: [] }], null);
  }
  return buildDevexFromFiles(
    date,
    baseUrl,
    manifest.entryFiles.filter((f) => existsSync(f.path)),
    manifest.window,
  );
}

function buildDevexFromFiles(date, baseUrl, entryFiles, window) {
  // Newest first, matching how the timeline reads. Headings the manifest lists as
  // already reported are excluded, so appending a late entry to an existing dated
  // file does not re-announce that date's earlier entries.
  const entries = [...entryFiles]
    .sort((a, b) => b.path.localeCompare(a.path))
    .flatMap(({ path, alreadyReported }) => {
      const seen = new Set(alreadyReported);
      return splitSections(stripFrontmatter(readFileSync(path, 'utf8')), 2).filter(
        (s) => !seen.has(s.heading),
      );
    });

  if (entries.length === 0) return null;

  const changelogUrl = `${baseUrl}/changelog`;
  const bullets = entries
    .map((e) => {
      // Lead sentence only — the Slack post is a pointer, not a copy, and this
      // keeps a busy week scannable instead of truncated. Splitting on
      // punctuation-then-whitespace leaves "Smallest.ai" and file names intact.
      const firstPara = e.body.split('\n\n')[0] ?? '';
      const lead = firstPara.split(/(?<=[.!?])\s+/)[0] ?? firstPara;
      return `• *${e.heading}*\n${toMrkdwn(lead, baseUrl)}`;
    })
    .join('\n\n');

  const count = entries.length;
  const label = windowLabel(window, date);
  return {
    text: `Docs changelog for ${label}: ${count} ${count === 1 ? 'update' : 'updates'}`,
    blocks: [
      {
        type: 'header',
        text: { type: 'plain_text', text: `Docs updates — ${label}` },
      },
      {
        type: 'section',
        text: { type: 'mrkdwn', text: truncate(bullets) },
      },
      {
        type: 'context',
        elements: [
          { type: 'mrkdwn', text: `<${changelogUrl}|Full changelog> · published to customers` },
        ],
      },
    ],
  };
}

/**
 * Support channel: the detailed digest. Includes corrections and URL changes that
 * never reach the public changelog. Inlines a per-product summary and links to the
 * committed file for the full detail, because the full text routinely exceeds
 * Slack's per-block limit.
 */
function buildSupportPayload(date, baseUrl, repo, sha) {
  const path = join(batchDir(date), 'support-digest.md');
  if (!existsSync(path)) return null;

  const contents = readFileSync(path, 'utf8');
  const products = splitSections(contents, 2);
  if (products.length === 0) return null;

  const fileUrl = `https://github.com/${repo}/blob/${sha}/.github/changelog-state/batches/${date}/support-digest.md`;

  const summary = products
    .map((p) => {
      const items = p.body
        .split('\n')
        .filter((l) => l.startsWith('- **'))
        .map((l) => {
          const m = l.match(/^- \*\*(New|Changed) — (.+?)\*\*/);
          if (!m) return null;
          const marker = m[1] === 'New' ? 'New' : 'Changed';
          return `   • _${marker}_ ${m[2]}`;
        })
        .filter(Boolean);

      return `*${p.heading}*\n${items.join('\n')}`;
    })
    .join('\n\n');

  const total = products.reduce(
    (n, p) => n + p.body.split('\n').filter((l) => l.startsWith('- **')).length,
    0,
  );

  return {
    text: `Docs changes for Support — ${date}: ${total} ${total === 1 ? 'item' : 'items'}`,
    blocks: [
      {
        type: 'header',
        text: { type: 'plain_text', text: `Docs changes for Support — ${date}` },
      },
      {
        type: 'section',
        text: {
          type: 'mrkdwn',
          text: `${total} documentation ${total === 1 ? 'change' : 'changes'} worth knowing about. *Changed* means the docs previously said something different — a correction or a moved page.`,
        },
      },
      { type: 'divider' },
      {
        type: 'section',
        text: { type: 'mrkdwn', text: truncate(summary) },
      },
      {
        type: 'context',
        elements: [
          {
            type: 'mrkdwn',
            text: `<${fileUrl}|Full detail with links> · <${baseUrl}/changelog|public changelog>`,
          },
        ],
      },
    ],
  };
}

// ============================================
// Main
// ============================================

function main() {
  const args = process.argv.slice(2);
  let audience = null;
  let date = null;
  let output = null;

  for (let i = 0; i < args.length; i++) {
    if (args[i] === '--audience' && args[i + 1]) audience = args[++i];
    if (args[i] === '--date' && args[i + 1]) date = args[++i];
    if (args[i] === '--output' && args[i + 1]) output = args[++i];
    if (args[i] === '-h' || args[i] === '--help') {
      console.log(`
Usage: node scripts/changelog/slack-digest.js --audience <devex|support> --date <YYYY-MM-DD> [--output <file>]

Reads the merged markdown artifacts and prints a Slack Block Kit payload.
Exits ${EXIT_NOTHING_TO_POST} when there is nothing to post for that audience.

Environment Variables:
  GITHUB_REPOSITORY  owner/repo, for linking the Support detail file (default: signalwire/docs)
  GITHUB_SHA         commit to link the Support detail file at (default: main)
`);
      process.exit(0);
    }
  }

  if (!['devex', 'support'].includes(audience)) {
    throw new Error('--audience must be "devex" or "support"');
  }
  if (!/^\d{4}-\d{2}-\d{2}$/.test(date ?? '')) {
    throw new Error('--date must be YYYY-MM-DD');
  }

  const baseUrl = docsBaseUrl();
  const repo = process.env.GITHUB_REPOSITORY || 'signalwire/docs';
  const sha = process.env.GITHUB_SHA || 'main';

  const payload =
    audience === 'devex'
      ? buildDevexPayload(date, baseUrl)
      : buildSupportPayload(date, baseUrl, repo, sha);

  if (!payload) {
    log.warn(`Nothing to post to ${audience} for ${date}`);
    process.exit(EXIT_NOTHING_TO_POST);
  }

  const json = `${JSON.stringify(payload, null, 2)}\n`;
  if (output) {
    writeFileSync(output, json);
    log.success(`Wrote ${output}`);
  } else {
    process.stdout.write(json);
  }
}

// Exported for slack-digest.test.js
export { splitSections, stripFrontmatter, toMrkdwn, truncate, windowLabel, MAX_SECTION_CHARS };

// Only run when invoked directly, not when imported (matches check-md-exports.js)
if (process.argv[1] === fileURLToPath(import.meta.url)) {
  try {
    main();
  } catch (err) {
    log.failure(err.message);
    process.exit(1);
  }
}
