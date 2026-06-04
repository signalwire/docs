#!/usr/bin/env node
/**
 * Postman Collection Builder & Publisher
 *
 * Single source of truth for the OpenAPI → Postman publishing pipeline.
 * The same code path runs locally and in .github/workflows/publish-postman.yml
 * so what you see on disk is what the workflow uploads.
 *
 * Subcommands:
 *   build   <spec> <output>                Convert an OpenAPI spec into a
 *                                          publish-ready Postman payload JSON.
 *                                          Pure transform — no network.
 *
 *   publish <payload> --collection-id <id> PUT the payload to Postman's
 *                                          /collections/:id endpoint. Reads
 *                                          POSTMAN_API_KEY from the env.
 *
 * Local usage:
 *   yarn postman:build fern/apis/signalwire-rest/openapi.yaml dist/rest.json
 *   yarn postman:publish dist/rest.json --collection-id $POSTMAN_REST_COLLECTION_ID
 *
 * CI invokes these via package.json scripts so the local and CI paths are
 * byte-identical aside from the secrets layer.
 */
import { existsSync, mkdirSync, readFileSync, writeFileSync, copyFileSync, rmSync } from 'node:fs';
import { dirname, resolve, basename, join } from 'node:path';
import { execFileSync } from 'node:child_process';
import { tmpdir } from 'node:os';
import { mkdtempSync } from 'node:fs';
import { fileURLToPath } from 'node:url';

import yaml from 'js-yaml';
import Converter from 'openapi-to-postmanv2';

import { Logger } from '../utils/logger.js';
import { inlineSingleExamples } from './inline-examples.js';

const log = new Logger();
const SCRIPT_DIR = dirname(fileURLToPath(import.meta.url));
const CONVERT_OPTIONS_PATH = resolve(SCRIPT_DIR, 'convert-options.json');
const REWRITE_LINKS_PATH = resolve(SCRIPT_DIR, 'rewrite-links.js');

// ============================================
// Shared helpers
// ============================================

function printUsage() {
  process.stderr.write(`Usage:
  build-collection.mjs build   <spec> <output>
  build-collection.mjs publish <payload> --collection-id <id>

Build:
  Converts an OpenAPI YAML/JSON spec into a publish-ready Postman payload.
  The committed spec is never mutated — a temp copy is rewritten in place
  and converted from there.

Publish:
  PUTs the payload to https://api.getpostman.com/collections/<id>.
  Requires POSTMAN_API_KEY in the environment.
`);
}

function parseFlags(args) {
  const flags = {};
  const positional = [];
  for (let i = 0; i < args.length; i++) {
    const a = args[i];
    if (a.startsWith('--')) {
      const key = a.slice(2);
      const next = args[i + 1];
      if (next && !next.startsWith('--')) {
        flags[key] = next;
        i++;
      } else {
        flags[key] = true;
      }
    } else {
      positional.push(a);
    }
  }
  return { flags, positional };
}

// ============================================
// build <spec> <output>
// ============================================

/**
 * Run the link rewriter on a temp copy of the spec. We call the existing
 * script as a subprocess instead of importing it — rewrite-links.js is the
 * canonical CLI for that transform and we want one source of truth.
 */
function rewriteLinks(specPath) {
  execFileSync('node', [REWRITE_LINKS_PATH, specPath], {
    stdio: ['ignore', 'inherit', 'inherit'],
  });
}

/**
 * Convert a parsed OpenAPI spec object to a Postman collection via the
 * library's documented Node API.
 *
 * We use `convertV2` (not `convert`) because that's what the CLI defaults
 * to — `bin/openapi2postmanv2.js` picks `convertV2` when `--interface-version`
 * is unset or `v2`. The README's "Sample Usage" section shows `convert`
 * (v1), but the CLI ships v2 and our convert-options.json targets v2 keys
 * (`parametersResolution`, not `requestParametersResolution`). Calling
 * `convertV2` directly matches the workflow's old `openapi2postmanv2 -s …`
 * behavior byte-for-byte without spawning a subprocess.
 *
 * We pass the spec as `type: 'json'` (a parsed JS object), not `type:
 * 'string'` (raw YAML/JSON text). This skips an internal parse and — more
 * importantly — lets us run the inline-examples preprocessor on the object
 * before conversion.
 */
function convertSpec(specObject, options) {
  return new Promise((resolveP, rejectP) => {
    Converter.convertV2({ type: 'json', data: specObject }, options, (err, status) => {
      if (err) return rejectP(err);
      if (!status?.result) {
        return rejectP(new Error(`conversion failed: ${status?.reason ?? 'unknown error'}`));
      }
      const collection = status.output?.[0]?.data;
      if (!collection) return rejectP(new Error('conversion produced no output'));
      resolveP(collection);
    });
  });
}

/**
 * Reshape the raw converter output to match Postman's PUT /collections/:id
 * contract and our preferred folder layout.
 *
 * Layout produced by openapi-to-postmanv2 with `folderStrategy: "Tags"` and
 * `includeWebhooks: true`: top-level `.item[]` is a flat list of tag-derived
 * folders plus a synthetic "Webhooks" folder for OpenAPI 3.1 `webhooks:`
 * entries. We move all tag folders into a single wrapper folder named "APIs"
 * (case-insensitively alphabetized so e.g. "cXML *" slots near "Call Flows"
 * instead of trailing at the bottom under ASCII byte order). The "Webhooks"
 * folder stays peer-level at the root.
 *
 * Partitioning is by name string ("Webhooks" vs the rest) because the
 * converter doesn't tag the synthetic webhooks folder with any
 * distinguishing metadata. If a future spec adds a tag literally named
 * "Webhooks", that tag would land at the root with the webhooks folder
 * instead of inside "APIs" — revisit then.
 *
 * Postman API requires {"collection": {...}} and rejects payloads carrying
 * foreign _postman_id / id / uid fields, so we strip those everywhere.
 */
function reshape(collection) {
  const items = Array.isArray(collection.item) ? collection.item : [];
  const apis = items
    .filter((it) => it?.name !== 'Webhooks')
    .sort((a, b) => (a?.name ?? '').toLowerCase().localeCompare((b?.name ?? '').toLowerCase()));
  const webhooks = items.filter((it) => it?.name === 'Webhooks');

  collection.item = [{ name: 'APIs', item: apis }, ...webhooks];

  wireAuthVariables(collection);
  stripIdsDeep(collection);

  return { collection };
}

/**
 * Replace the converter's generic auth placeholders with customer-friendly
 * collection variables, and expose those variables in `.variable[]` so they
 * surface in Postman's Variables tab where the docs tell users to look.
 *
 *   collection-level Basic Auth: {{basicAuthUsername}} → {{project_id}}
 *                                {{basicAuthPassword}} → {{api_token}}
 *   per-request Bearer Auth:     {{bearerToken}}       → {{subscriber_token}}
 *
 * Per-request Basic Auth blocks are nulled so they inherit the (rewired)
 * collection-level Basic Auth — keeps the payload lean and gives us one
 * canonical place to maintain the credential names. Non-basic per-request
 * auth (bearer, noauth) stays explicit because it differs from the
 * collection-level default.
 *
 * The upsert pattern is borrowed from Portman's writeCollectionVariables:
 * find by `key`, replace if exists, push if not. Idempotent across reruns.
 */
function wireAuthVariables(collection) {
  collection.variable = collection.variable ?? [];

  // Walk every item once: rename per-request bearer placeholders, null
  // per-request basic-auth blocks so they inherit the (rewired) collection
  // default, and note which auth schemes actually appear so we only
  // pre-declare variables that are reachable from this collection.
  let hasBasic = collection.auth?.type === 'basic';
  let hasBearer = false;
  walkItems(collection, (item) => {
    const auth = item.request?.auth;
    if (!auth) return;
    if (auth.type === 'basic') {
      item.request.auth = null;
      hasBasic = true;
    } else if (auth.type === 'bearer' && Array.isArray(auth.bearer)) {
      hasBearer = true;
      for (const field of auth.bearer) {
        if (field.key === 'token') field.value = '{{subscriber_token}}';
      }
    }
  });

  // Variables tab entries — pre-declared so customers see the full list of
  // credentials on first fork, with descriptions explaining each. Empty
  // initial value so Postman flags them as unset until populated. Each is
  // gated on actually being referenced from somewhere in the collection so
  // we don't litter the Variables tab with dead placeholders (e.g.,
  // subscriber_token in the compat collection, which has no bearer endpoints).
  if (hasBasic) {
    upsertVariable(collection.variable, {
      key: 'project_id',
      value: '',
      type: 'string',
      description:
        'Your SignalWire Project ID. Find it in the API pane of your SignalWire Dashboard.',
    });
    upsertVariable(collection.variable, {
      key: 'api_token',
      value: '',
      type: 'string',
      description:
        'Your SignalWire API Token. Find it in the API pane of your SignalWire Dashboard.',
    });
  }
  if (hasBearer) {
    upsertVariable(collection.variable, {
      key: 'subscriber_token',
      value: '',
      type: 'string',
      description:
        'A Subscriber Access Token (SAT) for endpoints that require subscriber auth. Generate one via the Create Subscriber Token endpoint.',
    });
  }

  // Collection-level Basic Auth: rewire references to the named variables.
  if (collection.auth?.type === 'basic' && Array.isArray(collection.auth.basic)) {
    for (const field of collection.auth.basic) {
      if (field.key === 'username') field.value = '{{project_id}}';
      if (field.key === 'password') field.value = '{{api_token}}';
    }
  }
}

function upsertVariable(list, entry) {
  const idx = list.findIndex((v) => v?.key === entry.key);
  if (idx > -1) list[idx] = entry;
  else list.push(entry);
}

function walkItems(node, visit) {
  if (Array.isArray(node?.item)) {
    for (const child of node.item) {
      visit(child);
      walkItems(child, visit);
    }
  }
}

function stripIdsDeep(node) {
  if (Array.isArray(node)) {
    for (const entry of node) stripIdsDeep(entry);
    return;
  }
  if (node && typeof node === 'object') {
    delete node._postman_id;
    delete node.id;
    delete node.uid;
    for (const key of Object.keys(node)) stripIdsDeep(node[key]);
  }
}

async function build(positional) {
  const [specArg, outputArg] = positional;
  if (!specArg || !outputArg) {
    printUsage();
    process.exit(2);
  }
  const specPath = resolve(specArg);
  const outputPath = resolve(outputArg);

  if (!existsSync(specPath)) {
    log.failure(`spec not found: ${specPath}`);
    process.exit(1);
  }
  if (!existsSync(CONVERT_OPTIONS_PATH)) {
    log.failure(`convert-options.json missing at ${CONVERT_OPTIONS_PATH}`);
    process.exit(1);
  }

  log.header(`Building Postman payload from ${specArg}`);

  // Stage the spec into a temp dir so we never mutate the committed file.
  // The link rewriter writes in place — running it on the original would
  // leave the workspace dirty after every build.
  const workDir = mkdtempSync(join(tmpdir(), 'postman-build-'));
  const stagedSpec = join(workDir, basename(specPath));
  copyFileSync(specPath, stagedSpec);

  try {
    rewriteLinks(stagedSpec);

    log.info('parsing spec');
    const specObject = yaml.load(readFileSync(stagedSpec, 'utf8'));

    // OpenAPI 3.1 schema-level `examples:` arrays aren't honored by
    // openapi-to-postmanv2's bundled faker; convert single-element ones to
    // singular `example:` so curated values actually surface in Postman.
    // Multi-element arrays and explicit `example:` are left alone.
    const inlined = inlineSingleExamples(specObject);
    log.info(`inlined ${inlined} single-element examples → example`);

    const options = JSON.parse(readFileSync(CONVERT_OPTIONS_PATH, 'utf8'));

    log.info('converting spec → collection');
    const collection = await convertSpec(specObject, options);

    log.info('reshaping (group APIs, sort, strip IDs, wrap)');
    const payload = reshape(collection);

    mkdirSync(dirname(outputPath), { recursive: true });
    writeFileSync(outputPath, JSON.stringify(payload, null, 2));
    log.success(`wrote ${outputPath}`);
  } finally {
    rmSync(workDir, { recursive: true, force: true });
  }
}

// ============================================
// publish <payload> --collection-id <id>
// ============================================

async function publish(positional, flags) {
  const [payloadArg] = positional;
  const collectionId = flags['collection-id'];
  const apiKey = process.env.POSTMAN_API_KEY;

  if (!payloadArg || !collectionId) {
    printUsage();
    process.exit(2);
  }
  if (!apiKey) {
    log.failure('POSTMAN_API_KEY is not set');
    process.exit(1);
  }
  const payloadPath = resolve(payloadArg);
  if (!existsSync(payloadPath)) {
    log.failure(`payload not found: ${payloadPath}`);
    process.exit(1);
  }

  log.header(`Publishing to Postman collection ${collectionId}`);

  const body = readFileSync(payloadPath, 'utf8');
  const res = await fetch(`https://api.getpostman.com/collections/${collectionId}`, {
    method: 'PUT',
    headers: {
      'X-Api-Key': apiKey,
      'Content-Type': 'application/json',
    },
    body,
  });

  const text = await res.text();
  let parsed;
  try {
    parsed = JSON.parse(text);
  } catch {
    parsed = null;
  }

  if (res.ok) {
    const name = parsed?.collection?.name ?? '(unknown)';
    const uid = parsed?.collection?.uid ?? '(unknown)';
    log.success(`Postman PUT succeeded (HTTP ${res.status})`);
    log.info(`  name: ${name}`);
    log.info(`  uid:  ${uid}`);
    return;
  }

  log.failure(`Postman PUT failed (HTTP ${res.status})`);
  log.error(text);
  process.exit(1);
}

// ============================================
// dispatch
// ============================================

async function main() {
  const [, , subcommand, ...rest] = process.argv;
  const { flags, positional } = parseFlags(rest);

  if (!subcommand || flags.help || subcommand === '--help' || subcommand === '-h') {
    printUsage();
    process.exit(subcommand ? 0 : 2);
  }

  switch (subcommand) {
    case 'build':
      await build(positional);
      break;
    case 'publish':
      await publish(positional, flags);
      break;
    default:
      log.failure(`unknown subcommand: ${subcommand}`);
      printUsage();
      process.exit(2);
  }
}

main().catch((err) => {
  log.failure(err.message ?? String(err));
  if (process.env.LOGGER_LEVEL === 'debug' || process.env.LOGGER_LEVEL === 'trace') {
    log.error(err.stack ?? '');
  }
  process.exit(1);
});
