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

## Docusaurus to Fern Migration Patterns

When migrating MDX content from Docusaurus to Fern,
apply these conversions:

### Global Replacements

| Docusaurus | Fern |
|------------|------|
| `className=` | `class=` (but `className` also works and is preferred for Frame) |
| `<Tooltips>` | `<Tooltip>` |

### Remove Docusaurus Imports

Delete all import lines for:
- `import ... from '@site/...'`
- `import ... from 'react-icons/...'`
- `import ... from '@theme/...'`
- `import ... from '/docs/main/_common/...'` (see Shared Snippets below)

### Shared Snippets (Markdown Component)

Docusaurus used `import` + JSX component syntax to include shared content.
In Fern, use the `<Markdown>` component with a `src` attribute pointing to `/snippets/`:

```jsx
// BEFORE (Docusaurus)
import UiAccordion from '/docs/main/_common/dashboard/_ui-accordion.mdx'
<UiAccordion/>

// AFTER (Fern)
<Markdown src="/snippets/common/dashboard/_ui-accordion.mdx" />
```

Shared snippets live in `fern/snippets/common/` and are organized by topic:
- `fern/snippets/common/dashboard/` - Dashboard UI components
- `fern/snippets/common/call-fabric/` - Call Fabric shared content
- `fern/snippets/common/sip/` - SIP-related shared content

The old Docusaurus path `/docs/main/_common/` maps to `/snippets/common/` in Fern.

### Component Migration

**Has Fern equivalent:**
| Docusaurus | Fern |
|------------|------|
| `<APIField>` | `<ParamField>` |
| `<Admonition>` | `<Note>`, `<Tip>`, `<Warning>`, etc. |
| `<CodeBlock>` | Fenced code blocks or `<CodeBlock>` in `<CodeBlocks>` |
| `<Tabs>` with `<TabItem>` | `<Tabs>` with `<Tab title="...">` |
| `<details>` | `<Accordion title="...">` |
| `<Subtitle>` | Frontmatter `subtitle:` field |
| `<Steps>` | `<Steps>` with `<Step>` |
| `<Card>` / `<CardGroup>` | `<Card>` / `<CardGroup>` (also `<Cards>` wrapper) |
| `<Accordion>` | `<Accordion>` / `<AccordionGroup>` |
| `<Frame>` | `<Frame>` |

**TabItem → Tab conversion:**
```jsx
// BEFORE (Docusaurus)
<Tabs>
  <TabItem value="js" label="JavaScript" default>
    Content here
  </TabItem>
</Tabs>

// AFTER (Fern)
<Tabs>
  <Tab title="JavaScript">
    Content here
  </Tab>
</Tabs>
```

**Fern-specific components:**
- `<Indent>` — Visual indentation with guide lines for nested parameters

**No Fern equivalent (rewrite or remove):**
- `<InstallHero>` — rewrite as static content
- `<GuidesList>` / `<GuidesListMirror>` — rewrite as manual Card links
- `<UseCaseLinks>` / `<UseCaseView>` — rewrite as static content or Cards
- `<DocCardList />` — rewrite as explicit Card links
- `<ReleaseCard>` — rewrite as static content
- `<Sigmond>` — remove or rewrite
- `<Tables>` — use standard Markdown tables
- `<Slideshow>` — rewrite as static images or remove

### Image Paths

Images from the old Docusaurus site were bulk migrated to `/fern/assets/images/`.

In Docusaurus, images could be referenced via:
- `@image/` shorthand (pointed to the images directory)
- `/img/` paths (pointed to Docusaurus' `/static/img/` directory, rarely used)

In Fern, all images live in `/fern/assets/images/` and are referenced via `/assets/images/...`:

```md
// BEFORE (Docusaurus)
![Alt text](@image/diagram.png)
![Alt text](/img/screenshot.webp)

// AFTER (Fern)
![Alt text](/assets/images/diagram.png)
![Alt text](/assets/images/img/screenshot.webp)
```

When migrating new content,
ensure the referenced images exist in `/fern/assets/images/`.
If not, copy them from the source and update paths accordingly.

### Admonition / Callout Syntax

Docusaurus uses `:::type` to open and `:::` to close admonitions.
Both must be replaced with Fern callout components:

```md
// BEFORE (Docusaurus)
:::tip
This is a tip.
:::

// AFTER (Fern)
<Tip>
This is a tip.
</Tip>
```

Type mappings:
| Docusaurus | Fern |
|------------|------|
| `:::tip` / `:::` | `<Tip>` / `</Tip>` |
| `:::note` / `:::` | `<Note>` / `</Note>` |
| `:::warning` / `:::` | `<Warning>` / `</Warning>` |
| `:::info` / `:::` | `<Info>` / `</Info>` |
| `:::caution` / `:::` | `<Warning>` / `</Warning>` |

**All Fern callout types:** `<Info>`, `<Warning>`, `<Success>`, `<Error>`, `<Note>`, `<Launch>`, `<Tip>`, `<Check>`

**React-style Admonitions:**
Docusaurus also supports `<Admonition>` components.
Convert these by mapping the `type` attribute to the corresponding Fern component.
Fern callouts support `title` and `icon` properties:

```jsx
// BEFORE (Docusaurus)
<Admonition type="info" title="Fun fact">
This simple YAML/JSON document is a complete calling application!
</Admonition>

// AFTER (Fern)
<Info title="Fun fact">
This simple YAML/JSON document is a complete calling application!
</Info>
```

Fern callout properties:
- `title` (string) - Optional title for the callout
- `icon` (string) - Optional Font Awesome icon name (e.g., `icon="skull-crossbones"`)

### Code Blocks with Tabs (andJSON)

Docusaurus SWML docs used a custom `andJSON` tag to auto-generate a companion JSON tab:

````md
// BEFORE (Docusaurus) - auto-generated JSON tab
```yaml andJSON
version: 1.0.0
sections:
  main:
    - answer: {}
```
````

Fern has no auto-generation.
Use `<CodeBlocks>` with explicit `<CodeBlock title="...">` for each language:

````jsx
// AFTER (Fern) - explicit YAML and JSON tabs
<CodeBlocks>
<CodeBlock title="YAML">
```yaml
version: 1.0.0
sections:
  main:
    - answer: {}
```
</CodeBlock>
<CodeBlock title="JSON">
```json
{
  "version": "1.0.0",
  "sections": {
    "main": [
      { "answer": {} }
    ]
  }
}
```
</CodeBlock>
</CodeBlocks>
````

When migrating `andJSON` blocks, you must manually write the JSON equivalent.

### Cards and CardGroups

Fern supports `<Card>` and `<CardGroup>` components with different properties than Docusaurus.

**Key differences from Docusaurus:**
- Remove React icon imports — use Font Awesome icon names or SVG paths instead
- Remove `description` prop — use card body content instead
- `icon` accepts: Font Awesome name (e.g., `"regular droplet"`), SVG path, or `<img>` element

```jsx
// BEFORE (Docusaurus)
import { FaRobot } from "react-icons/fa"
<Card icon={<FaRobot />} description="Build AI apps">

// AFTER (Fern)
<Card title="Agents SDK" icon="regular robot" href="/sdks/agents-sdk">
  Build AI apps
</Card>
```

**CardGroup:** Use `cols={N}` for column count (JSX expression, not string):

```jsx
<CardGroup cols={2}>
  <Card title="First" href="/first">Description</Card>
  <Card title="Second" href="/second">Description</Card>
</CardGroup>
```

**Card properties:**
- `title` (string) - Card title
- `icon` (string | img) - Font Awesome icon (e.g., `"brands python"`), SVG path, or `<img>` element
- `href` (string) - Makes card clickable
- `iconPosition` (`"top"` | `"left"`) - Icon placement
- `src` (string) - Image URL for image cards
- `imagePosition` (`"top"` | `"left"` | `"right"` | `"bottom"`) - Image placement

### Dynamic JSX to Static Content

Convert `.map()` iterations to static markup:

```jsx
// BEFORE (Docusaurus)
export const items = [{ name: "Foo", link: "/foo" }, ...]
<CardGroup>
  {items.map(item => <Card title={item.name} href={item.link} />)}
</CardGroup>

// AFTER (Fern)
<CardGroup cols={2}>
  <Card title="Foo" href="/foo">
    Description here
  </Card>
</CardGroup>
```

### Heading Anchors

Convert Docusaurus `{#anchor}` syntax to Fern `[#anchor]` syntax:

```md
// BEFORE (Docusaurus)
### My Heading {#my-anchor}

// AFTER (Fern)
### My Heading [#my-anchor]
```

### HTML Comments

Remove all HTML comments — they can cause MDX parse errors:

```md
// REMOVE these
<!-- This is a comment -->
<!-- TODO: fix this later -->
```

### Badge and Parameter Span Classes

Docusaurus uses custom span classes for styling. Convert to Fern equivalents:

```jsx
// BEFORE (Docusaurus)
<span className="badge badge--warning">BETA</span>
<span className="badge badge--danger">DEPRECATED</span>
<span className="optional-arg">optional</span>
<span className="required-arg">required</span>

// AFTER (Fern)
// For badges, use inline styling or remove
**BETA** or <span class="badge">BETA</span>

// For parameters, use ParamField required prop instead
<ParamField path="name" type="string" required={true}>...</ParamField>
<ParamField path="name" type="string" required={false}>...</ParamField>
```

### Relative Links

Always convert relative links to absolute slugs:

```md
// BEFORE (Docusaurus) - relative paths
[See details](./other-page.mdx)
[Reference](../folder/page.mdx#section)

// AFTER (Fern) - absolute slugs
[See details](/category/other-page)
[Reference](/category/folder/page#section)
```

### Mermaid Diagrams

Mermaid diagrams work as-is in Fern. No conversion needed:

````md
```mermaid
flowchart LR
    A[Start] --> B[Process]
    B --> C[End]
```
````

### Folder-Based (Inferred) Navigation

Fern supports automatic navigation generation from folder structures using the `folder` key
instead of manually listing every page. This is useful for sections with many pages
that map cleanly to a directory.

```yaml
# EXPLICIT (manual page listing)
- section: Guides
  contents:
    - page: Overview
      path: ./pages/guides/index.mdx
    - page: First Guide
      path: ./pages/guides/first-guide.mdx
    - page: Second Guide
      path: ./pages/guides/second-guide.mdx

# INFERRED (folder-based, auto-discovers pages)
- section: Guides
  contents:
    - folder: ./pages/guides

# INFERRED with options
- folder: ./pages/guides
  title: Guides                  # Display name in sidebar
  slug: user-guides              # Custom URL path
  title-source: frontmatter      # Use frontmatter titles instead of filenames
```

**How `folder`, `section`, and `page` interact:**

A `folder` is a self-contained navigation unit. It automatically generates:
- A **section header** in the sidebar (from the directory name or `title:`)
- **Pages** from files in the directory
- **Nested sections** from subdirectories

A `section` is a manual grouping wrapper with a `contents:` list. It creates a
section header and contains explicitly listed items (pages, folders, other sections).

Because a `folder` already creates its own section header, **do not wrap a `folder`
inside a `section` with the same name** — this produces a duplicate header:

```yaml
# BAD — duplicate "Guides" header in sidebar
- section: Guides
  contents:
    - folder: ./pages/guides

# GOOD — folder creates its own "Guides" section
- folder: ./pages/guides

# GOOD — section with explicit pages (no folder)
- section: Guides
  contents:
    - page: Overview
      path: ./pages/guides/index.mdx

# GOOD — section wrapping multiple folders (section name differs from folder names)
- section: Reference
  contents:
    - folder: ./pages/rest-api
    - folder: ./pages/webhooks
```

**Automatic behaviors:**
- Converts filenames to titles and URL slugs (e.g., `first-guide.mdx` → "First Guide")
- Creates nested sections from subdirectories
- Sorts pages alphabetically by default
- Uses `index.mdx` or `index.md` files as section overview pages

**Customization via frontmatter:**
- `sidebar-title:` — Override the auto-generated sidebar title
- `slug:` — Custom URL slug
- `skip-slug: true` — Omit the folder name from URL paths

**When to use folder-based nav:**
- Sections where pages map 1:1 to files in a directory
- Sections where alphabetical ordering is acceptable (or ordering is controlled via frontmatter)
- Directories with many pages where manual listing is tedious

**When to use explicit nav:**
- When you need custom ordering that differs from alphabetical/frontmatter-based
- When page titles in the sidebar should differ from file-derived names (and you don't want to add `sidebar-title` frontmatter)
- When you want to cherry-pick specific files from a directory

### Frontmatter

**Remove:** `sidebar_position:` (Fern uses YAML navigation files instead)

**Convert `<Subtitle>` to frontmatter:**
```yaml
---
title: Page Title
subtitle: This was previously a <Subtitle> component
---
```

## Fern Components Reference

Full documentation: https://buildwithfern.com/learn/docs/writing-content/components/overview

### Frame

Container for images with optional captions and backgrounds.

```jsx
<Frame caption="Description of image" background="subtle">
  <img src="/images/path/to/image.webp" alt="Alt text" />
</Frame>
```

Props: `caption` (string), `background` (`"subtle"` | `"default"`), `className` (string)

**Diagram images (dark mode support):**
For diagrams that need color inversion in dark mode, add `class="diagram"` to the `<img>` element and ensure "diagram" is in the filename (required for zoom inversion since rmiz strips classes):
```jsx
<Frame caption="Architecture diagram">
  <img class="diagram" src="/assets/images/my_diagram.webp" alt="Diagram" />
</Frame>
```

### Code Blocks

Fern code blocks support many features beyond basic syntax highlighting:

````md
```js Title Here {2-4} focus={5-6} maxLines=15 wordWrap
// Line highlighting with {lines}, focusing with focus={lines}
// maxLines limits visible lines (default 20, 0 to disable)
// wordWrap wraps long lines instead of scrolling
```
````

**Embed from files** with `<Code>`:
```jsx
<Code src="snippets/example.js" title="Example" language="js" />
<Code src="https://raw.githubusercontent.com/..." title="Remote file" />
```

**Tabbed code blocks** with `<CodeBlocks>`:
```jsx
<CodeBlocks>
  ```python title="Python"
  print("hello")
  ```
  ```typescript title="TypeScript"
  console.log("hello");
  ```
</CodeBlocks>
```

Code blocks with the same language auto-sync across the page.

### Steps

Sequential numbered steps for tutorials:

```jsx
<Steps>
  <Step title="First step">
    Content for step 1
  </Step>
  <Step title="Second step">
    Content for step 2
  </Step>
</Steps>
```

Props on `<Steps>`: `toc` (boolean) — include in table of contents
Props on `<Step>`: `title` (string), `id` (string)

### Accordion

Collapsible sections for FAQs or optional content:

```jsx
<AccordionGroup>
  <Accordion title="Question 1" defaultOpen={true}>
    Answer 1 (open by default)
  </Accordion>
  <Accordion title="Question 2">
    Answer 2
  </Accordion>
</AccordionGroup>
```

Props: `title` (required), `defaultOpen` (boolean), `id` (string)

### Tabs

Tabbed content panels:

```jsx
<Tabs>
  <Tab title="First Tab">
    Content 1
  </Tab>
  <Tab title="Second Tab">
    Content 2
  </Tab>
</Tabs>
```

### Indent

Visual indentation with guide lines for nested parameters:

```jsx
<ParamField path="config" type="object">Config object</ParamField>
<Indent>
  <ParamField path="config.host" type="string">Hostname</ParamField>
  <ParamField path="config.port" type="number">Port</ParamField>
</Indent>
```

### Tables

Standard markdown tables work. For long tables, use `<StickyTable>`:

```jsx
<StickyTable>
| Header 1 | Header 2 |
|----------|----------|
| Cell 1   | Cell 2   |
</StickyTable>
```

### Tooltip

Hover tooltips for definitions:

```jsx
The <Tooltip tip="Explanation text">term</Tooltip> is important.
```

Props: `tip` (string | ReactNode), `side` (`"top"` | `"right"` | `"bottom"` | `"left"`)

## Important Warnings

### Never use YAML parsers to rewrite navigation files

Do NOT use `yaml.safe_load()` + `yaml.dump()` (or equivalent) to modify
`platform.yml` or other navigation YAML files. YAML serializers reformat
indentation, quoting, and spacing, which triggers pre-commit hook failures
and reverts all changes. Always use line-by-line text manipulation
(e.g., the `Edit` tool, `sed`, or custom scripts that read/write lines directly).

## Common Issues to Fix

- Mismatched tags (e.g., `<Info>` opened but `</Tip>` closed)
- Unclosed `:::` admonition blocks
- Windows line endings (`\r`)
- HTML comments that should be removed
- Blank lines inside JSX components that cause parse errors
- `cols="2"` string syntax instead of `cols={2}` JSX expression in CardGroup
- React icon imports like `icon={<MdCode />}` instead of Font Awesome strings like `icon="solid code"`
- `<UseCaseView>` components - must be rewritten using `<AccordionGroup>`, `<Accordion>`, and `<Tabs>`
- `<details>` / `<summary>` tags - convert to `<Accordion title="...">`
- Unconverted `:::note`, `:::tip`, `:::warning` admonitions - convert to `<Note>`, `<Tip>`, `<Warning>`
- `<Language>` / `<LangItem>` components - convert to `<Tabs>` / `<Tab>` or merge content
- `` ```yaml andJSON `` or `` ```yaml andJson `` - remove `andJSON`/`andJson` (Fern has no auto-JSON generation)
- `src={require("...").default}` - convert to plain `src="..."` string paths
- `onChange` prop on Accordion - remove (not supported in Fern)

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
