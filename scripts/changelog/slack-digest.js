#!/usr/bin/env node
/**
 * Renders Slack Block Kit payloads FROM the merged markdown artifacts.
 *
 * This runs at publish time, after a human has reviewed and merged the weekly PR.
 * It deliberately reads the committed markdown rather than any intermediate JSON:
 * the reviewed files are the single source of truth, so an edit made during review
 * reaches Slack automatically and the two audiences cannot drift apart.
 *
 * There is ONE payload. Every internal channel gets the same post, so adding a
 * channel is a webhook in changelog-publish.yml and nothing else.
 *
 * Usage:
 *   node scripts/changelog/slack-digest.js --date 2026-08-17
 *   node scripts/changelog/slack-digest.js --date 2026-08-17 --output payload.json
 *
 * Exits 2 (not 1) when there is nothing to post, so the workflow can distinguish
 * "quiet week" from "something broke".
 */

import { existsSync, readFileSync, readdirSync, writeFileSync } from 'node:fs';
import { join } from 'node:path';
import { fileURLToPath } from 'node:url';
import yaml from 'js-yaml';
import { Logger } from '../utils/logger.js';
import {
  CHANGELOG_DIR,
  CHANGELOG_URL_PATH,
  REPO_ROOT,
  batchDir,
  entryHeadings,
  repoSlug,
} from './config.js';

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
 * Every `##` heading currently on the public changelog.
 *
 * The digest labels each item by whether it actually reached customers, so this
 * reads the published entry files rather than trusting the tier.
 */
function publishedHeadings() {
  if (!existsSync(CHANGELOG_DIR)) return new Set();
  const headings = new Set();
  for (const file of readdirSync(CHANGELOG_DIR)) {
    if (!/^\d{4}-\d{2}-\d{2}\.mdx?$/.test(file)) continue;
    for (const h of entryHeadings(readFileSync(join(CHANGELOG_DIR, file), 'utf8'))) {
      headings.add(h);
    }
  }
  return headings;
}

/**
 * The internal digest payload. One post, sent to every internal channel.
 *
 * Includes the corrections and URL changes that never reach the public changelog.
 * Inlines a per-product summary and links to the committed file for the full
 * detail, because the full text routinely exceeds Slack's per-block limit.
 */
function buildPayload(date, baseUrl, repo, sha) {
  const path = join(batchDir(date), 'digest.md');
  if (!existsSync(path)) return null;

  const contents = readFileSync(path, 'utf8');
  const products = splitSections(contents, 2);
  if (products.length === 0) return null;

  const fileUrl = `https://github.com/${repo}/blob/${sha}/.github/changelog-state/batches/${date}/digest.md`;
  const published = publishedHeadings();

  const summary = products
    .map((p) => {
      const items = p.body
        .split('\n')
        .filter((l) => l.startsWith('- **'))
        .map((l) => {
          const m = l.match(/^- \*\*(?:New|Changed) — (.+?)\*\*/);
          if (!m) return null;
          // Labelled by what actually shipped, not by the tier baked in at render
          // time. Deleting a section from the entry file is how a reviewer demotes
          // an entry, and that happens after render — so the digest must read the
          // published changelog to stay truthful.
          const marker = published.has(m[1]) ? 'Published' : 'Internal';
          return `   • _${marker}_ ${m[1]}`;
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
    text: `Docs changes — ${date}: ${total} ${total === 1 ? 'item' : 'items'}`,
    blocks: [
      {
        type: 'header',
        text: { type: 'plain_text', text: `Docs changes — ${date}` },
      },
      {
        type: 'section',
        text: {
          type: 'mrkdwn',
          text: `${total} documentation ${total === 1 ? 'change' : 'changes'} worth knowing about. *Published* entries are on the public changelog; *Internal* ones are not — corrections, moved pages, and filled gaps.`,
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
            text: `<${fileUrl}|Full detail with links> · <${baseUrl}${CHANGELOG_URL_PATH}|public changelog>`,
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
  let date = null;
  let output = null;

  for (let i = 0; i < args.length; i++) {
    if (args[i] === '--date' && args[i + 1]) date = args[++i];
    if (args[i] === '--output' && args[i + 1]) output = args[++i];
    if (args[i] === '-h' || args[i] === '--help') {
      console.log(`
Usage: node scripts/changelog/slack-digest.js --date <YYYY-MM-DD> [--output <file>]

Reads the merged digest.md and prints a Slack Block Kit payload.
Exits ${EXIT_NOTHING_TO_POST} when there is nothing to post.

Environment Variables:
  GITHUB_REPOSITORY  owner/repo, for linking the full detail file
                     (default: GH_REPO, then the origin remote, then signalwire/docs)
  GITHUB_SHA         commit to link the full detail file at (default: main)
`);
      process.exit(0);
    }
  }

  if (!/^\d{4}-\d{2}-\d{2}$/.test(date ?? '')) {
    throw new Error('--date must be YYYY-MM-DD');
  }

  const baseUrl = docsBaseUrl();
  const repo = repoSlug();
  const sha = process.env.GITHUB_SHA || 'main';

  const payload = buildPayload(date, baseUrl, repo, sha);

  if (!payload) {
    log.warn(`Nothing to post for ${date}`);
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
export { splitSections, stripFrontmatter, toMrkdwn, truncate, MAX_SECTION_CHARS };

// Only run when invoked directly, not when imported (matches check-md-exports.js)
if (process.argv[1] === fileURLToPath(import.meta.url)) {
  try {
    main();
  } catch (err) {
    log.failure(err.message);
    process.exit(1);
  }
}
