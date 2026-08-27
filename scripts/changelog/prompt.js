#!/usr/bin/env node
/**
 * Rebuilds a batch's classification prompt — STAGE 2's input.
 *
 * `prompt.md` is not committed. It is exactly `buildPrompt(input.prs, input.window)`,
 * so committing it stores the same PR data twice: the prompt for one week runs to
 * ~80KB, more than half of everything a batch writes. `collect.js` still writes it
 * locally, so running the pipeline by hand is unchanged. This script exists for the
 * other case — a fresh clone of the draft branch, where the file was never committed.
 *
 * Usage:
 *   node scripts/changelog/prompt.js                       # newest batch
 *   node scripts/changelog/prompt.js --date 2026-08-27
 *   node scripts/changelog/prompt.js --date 2026-08-27 --stdout
 *
 * Environment Variables:
 *   LOGGER_LEVEL  Set log verbosity: error, warn, info, debug, trace (default: info)
 */

import { existsSync, readFileSync, writeFileSync } from 'node:fs';
import { join } from 'node:path';
import { fileURLToPath } from 'node:url';
import { createRequire } from 'node:module';
import { Logger } from '../utils/logger.js';
import { REPO_ROOT, batchDir, newestBatchDate } from './config.js';

// The prompt builder is CommonJS so that actions/github-script can require() it.
const require = createRequire(import.meta.url);
const buildPrompt = require('../../.github/scripts/changelog-prompt.cjs');

const log = new Logger();

function main() {
  const args = process.argv.slice(2);
  let date = null;
  let toStdout = false;

  for (let i = 0; i < args.length; i++) {
    if (args[i] === '--date' && args[i + 1]) date = args[++i];
    if (args[i] === '--stdout') toStdout = true;
    if (args[i] === '-h' || args[i] === '--help') {
      console.log(`
Usage: node scripts/changelog/prompt.js [options]

Options:
  --date <YYYY-MM-DD>  Batch to rebuild (default: newest under .github/changelog-state/batches/)
  --stdout             Print the prompt instead of writing prompt.md

Reads  .github/changelog-state/batches/<date>/input.json
Writes .github/changelog-state/batches/<date>/prompt.md   (gitignored)
`);
      process.exit(0);
    }
  }

  date = date ?? newestBatchDate();
  if (!date) {
    throw new Error('No batch folder found. Run: yarn changelog:collect');
  }

  const inputPath = join(batchDir(date), 'input.json');
  const rel = (p) => p.replace(`${REPO_ROOT}/`, '');

  if (!existsSync(inputPath)) {
    throw new Error(
      `Missing ${rel(inputPath)}\n\n` +
        `  It carries the PR data the prompt is built from. Re-run:\n` +
        `    yarn changelog:collect --since <start> --until ${date} --date ${date}`,
    );
  }

  const input = JSON.parse(readFileSync(inputPath, 'utf8'));
  const prompt = `${buildPrompt(input.prs ?? [], input.window ?? {})}\n`;

  if (toStdout) {
    process.stdout.write(prompt);
    return;
  }

  const promptPath = join(batchDir(date), 'prompt.md');
  writeFileSync(promptPath, prompt);

  log.success(`Wrote ${rel(promptPath)} (${input.prs?.length ?? 0} PRs)`);
  log.newline();
  log.header('Next: classify');
  log.info(`  1. Paste ${rel(promptPath)} into Claude Code`);
  log.info(`  2. Save the JSON reply as ${rel(join(batchDir(date), 'classified.json'))}`);
  log.info('  3. Run: yarn changelog:render');
}

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
