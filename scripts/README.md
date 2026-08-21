# Scripts

Maintenance and QA tooling for the docs repo. All scripts are plain Node (no
dependencies beyond what's in `package.json`) and share conventions: hand-rolled
`--flag` parsing with `-h`/`--help`, the shared logger in `utils/logger.js`
(`LOGGER_LEVEL=debug` for verbose output), and exit codes suitable for CI.

| Script | yarn alias | Purpose |
|--------|------------|---------|
| `check-links.js` | `yarn check-links` | Validate every link on the published site (lychee over the sitemap, plus local git-based verification of GitHub blob/tree/tag URLs). |
| `check-md-exports.js` | `yarn check-md-exports` | Audit the `.md` exports and `llms.txt` indexes served for AI consumption. |
| `check-md-exports.test.js` | `yarn test:scripts` | Fixture tests locking in `check-md-exports.js`'s detection heuristics. |
| `check-llm-exports.mjs` | `yarn check-llm-exports <preview-url>` | Check issue-specific required and forbidden content in preview `.md` exports. |
| `llm-export-cases.json` | Used by `check-llm-exports.mjs` | Manifest of routes and semantic export assertions. |
| `llm-agent-scenarios.md` | Manual preview evaluation | Context-isolated agent prompts and expected documentation destinations. |
| `changelog/collect.js` | `yarn changelog:collect` | Collect PRs merged in a window, filter to docs-relevant paths, and write a classification prompt bundle. |
| `changelog/render.js` | `yarn changelog:render` | Turn a batch's classification into dated changelog entries and the internal Support digest. |
| `changelog/slack-digest.js` | `yarn changelog:slack` | Render Slack Block Kit payloads from the merged changelog markdown. |
| `changelog/config.js` | — | Shared paths, docs-path filters, and prompt budgets for the changelog pipeline. |
| `changelog/*.test.js` | `yarn test:scripts` | Fixture tests for the changelog pipeline's pure helpers: path filters, mechanical-change detection, payload validation, entry-file merging, and Slack text rendering. |
| `postman/` | `yarn postman:build` / `postman:publish` | Build and publish the Postman collection from the OpenAPI specs. |
| `utils/logger.js` | — | Shared leveled logger (text/JSON, collectors) used by the scripts above. |

## check-md-exports.js

Fern serves a machine-readable version of every docs page (append `.md` to the
page URL) and per-product `llms.txt` indexes, which we advertise to AI tooling.
This script audits that surface end to end — it exists because those exports
have broken structurally before while the HTML site looked fine
([#525](https://github.com/signalwire/docs/issues/525)).

It crawls the `llms.txt` tree, fetches every listed `.md` export (~3,200 pages),
and runs tiered checks per page:

- **error** (exit code 1): soft/hard 404s for listed pages, near-empty bodies,
  Fern components leaking unrendered (`<ParamField …>` verbatim in the export),
  and *orphaned descriptions* — the #525 signature, a Properties/Parameters
  section reduced to bare description blocks with zero defined terms.
- **warn**: parameter terms with no description, raw HTML with class attributes
  (visual-component leak-through, tracked under
  [#388](https://github.com/signalwire/docs/issues/388)), HTML entity residue,
  unknown JSX-ish tags in prose.
- **info** (hidden without `--include-info`): floating link-reference
  definitions, `sitemap.xml` vs `llms.txt` coverage diff.

Code fences and inline code spans are stripped before the component/HTML checks,
so code samples never false-positive.

### Common invocations

```bash
# Full production audit (~3,200 pages; allow ~10–25 min depending on network)
yarn check-md-exports

# Iterate on one product, or one page
yarn check-md-exports --product swml
yarn check-md-exports --url https://signalwire.com/docs/swml/reference/errors.md

# Audit a PR preview deployment
yarn check-md-exports --base-url https://signalwire-preview-<id>.docs.buildwithfern.com/docs

# Verify every <ParamField path="…"> from the MDX sources appears in the
# deployed export. Reads the working tree by default, so a branch that is
# ahead of / behind the deployed main reports drift — pass --source-ref to
# read sources from the ref the site was actually built from.
yarn check-md-exports --cross-check --product swml
yarn check-md-exports --source-ref origin/main --product swml

# Reports
yarn check-md-exports --json report.json --output report.md
```

Run `yarn check-md-exports --help` for the full flag list (`--limit`,
`--concurrency`, `--list`, `--no-sitemap-check`, …).

### Exit codes

`0` clean or warn/info only · `1` error-tier findings (CI-ready; not currently
wired into a workflow) · `2` runtime/config error.

### Tests

`yarn test:scripts` runs the fixture suite in `check-md-exports.test.js` —
canned markdown encoding the #525 regression shape, the legitimate page styles
that must *not* fire, and the URL-mapping rules for `--cross-check`. If you tune
a heuristic in `check-md-exports.js`, every fixture must still pass; add a new
fixture for whatever prompted the tuning.
