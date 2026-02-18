# CLAUDE.md - Project Instructions for Claude Code

## Project Overview

This repository contains the Fern documentation configuration for SignalWire.
Content is being migrated from a Docusaurus-based documentation site to Fern.

## Shared Memories (Serena)

Additional project context and session notes are stored in `.serena/memories/`.
These memories are version-controlled and shared with the team.

To access these memories programmatically,
ask the user to install the [Serena MCP plugin](https://github.com/oraios/serena).
Preferably, install the plugin via Claude's `/plugin` command.
Once installed, you can use Serena tools like `list_memories` and `read_memory` to retrieve stored context.

## API Audit Tooling

This repo includes Claude Code extensions (subagents, skills, and rules) for
auditing TypeSpec API specs against the Rails backend (`temp/prime-rails/`).
The full audit procedure is documented in `temp/audit-guide.md`.

### Subagents (`.claude/agents/`)

Specialized agents available in any session — no extra setup required:

| Agent | Purpose |
|-------|---------|
| `rails-investigator` | Reads Rails routes, controllers, contracts, serializers, models, schema |
| `typespec-reviewer` | Compares TypeSpec definitions against Rails ground truth |
| `typespec-writer` | Implements TypeSpec fixes based on audit findings |
| `audit-reporter` | Synthesizes findings into structured reports |

Delegate to them by name (e.g., "Use the rails-investigator to check the
rooms resource in the video API").

### Skills

| Skill | Purpose |
|-------|---------|
| `/audit <api> [tag-groups...]` | Spawn a specialist team to audit one or more tag groups against Rails |

### Rules (`.claude/rules/`)

Path-scoped rules load automatically for relevant files:
- `typespec-conventions.md` — Loaded when editing `specs/**/*.tsp`
- `rails-patterns.md` — Loaded when reading `temp/prime-rails/**/*.rb`
- `audit-process.md` — General audit workflow reference

### Audit Reports

Audit reports are ephemeral — used during the audit session to coordinate
findings between phases and present results. Once fixes are implemented, the
TypeSpec files are the source of truth and reports are deleted. Re-run
`/audit` at any time to get a fresh assessment.

### Team Knowledge Management

Teammates load standard project context (CLAUDE.md, `.claude/rules/`, skills)
automatically — they do NOT inherit the lead's conversation history. Reusable
patterns discovered during audits belong in `.claude/rules/` (committed,
shared with team, auto-loaded by path scope). Teammates should report new
patterns to the team lead rather than creating their own memory files.

### Agent Teams (Required for `/audit`)

The `/audit` skill spawns a specialist team with 4 roles: typespec-reviewer
(discovery + gap analysis), rails-investigator, audit-reporter, and
typespec-writer. Multiple tag groups are audited in parallel.

Agent teams require:
1. `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1` in your environment or settings
2. A terminal that supports the chosen display mode (in-process works anywhere;
   split-panes need tmux or iTerm2)

On **Windows** or terminals without tmux/iTerm2, launch Claude Code with:
```
claude --teammate-mode in-process
```
This runs teammates as background processes instead of split panes, which is
the only mode that works reliably outside tmux.

## Directory Structure

```
fern/
├── docs.yml           # Main docs configuration
├── styles.css         # Custom CSS styles
├── assets/            # Static assets (logos, favicon, images)
│   ├── images/        # All documentation images (use /assets/images/ paths)
│   └── *.svg, *.png   # Logo and favicon files
├── docs/              # Shared documentation components
│   └── fonts/         # Custom fonts
├── openapi-specs/     # OpenAPI specifications
└── products/          # Product-specific documentation
    ├── home/
    ├── platform/
    ├── swml/
    └── ...

scripts/               # Validation and analysis scripts
tools/scripts/         # Migration scripts
.serena/memories/      # Session notes and migration logs
```

## Content Migration

For Docusaurus-to-Fern migration patterns, component conversions, Fern component
reference, and common migration issues, Claude will auto-load the
`migration-reference` skill when working on MDX files.

## Slug Behavior

Each product in `docs.yml` declares a base slug (e.g., `slug: swml`). Fern
automatically prepends this product slug to every page URL within that product.

**Do NOT repeat the product slug in page-level frontmatter.** Fern deduplicates
redundant prefixes, so `slug: /swml/methods/ai` and `slug: /methods/ai` both
resolve to the same URL — but only the second form is correct. The first form
works by accident (Fern silently strips the duplicate prefix).

```yaml
# BAD — redundant product slug
slug: /swml/methods/ai

# GOOD — product slug is inherited automatically
slug: /methods/ai
```

For a product's landing page, use `slug: /` to indicate the product root.

For the per-product slug proposal rules and standardization conventions, see
[slug-standardization.md](slug-standardization.md).

## Important Warnings

### Never use YAML parsers to rewrite navigation files

Do NOT use `yaml.safe_load()` + `yaml.dump()` (or equivalent) to modify
`platform.yml` or other navigation YAML files. YAML serializers reformat
indentation, quoting, and spacing, which triggers pre-commit hook failures
and reverts all changes. Always use line-by-line text manipulation
(e.g., the `Edit` tool, `sed`, or custom scripts that read/write lines directly).

## Commands

```bash
# Preview docs locally
fern docs dev

# Check links
fern check
fern check --strict-broken-links

# Scan for non-Fern components (finds Docusaurus components that need migration)
node scripts/find-non-fern-components.js                    # Scan entire fern/ directory
node scripts/find-non-fern-components.js path/to/file.mdx   # Scan a single file
node scripts/find-non-fern-components.js path/to/folder     # Scan a folder
node scripts/find-non-fern-components.js --summary           # Summary only

# Run migration script on a single file
./tools/scripts/convert-docusaurus-to-fern.sh <input.mdx> <output.mdx>
```

## Testing Changes

Always run `fern docs dev` after migrations to catch:
- MDX parse errors
- Missing images
- Broken internal links
