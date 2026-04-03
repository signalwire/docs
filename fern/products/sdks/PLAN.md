# SignalWire SDK Product — Content Plan Overview

## What Was Done (Scaffolding)

The unified **SDKs** product has been scaffolded at `fern/products/sdks/`. Three old products (Agents SDK, Server SDK, Browser SDK) are commented out in `docs.yml` with redirects pointing their old slugs to `/docs/sdks`. The scaffold contains:

- **`sdks.yml`** — Navigation config with two tabs (Guides + Reference), all folder-based
- **8 guide stub folders** under `pages/guides/` (use-case navigation)
- **5 Python reference stub folders** under `pages/reference/python/` (variant-based)

No content has been written yet. Every MDX file contains frontmatter only.

## What Needs to Happen Next

### 1. Guides Tab — Content Writing

Write guide content for each use-case section. Guides use **`<CodeBlocks>`** for multi-language code examples (Python first, others added later). **Source material: SDK manual** (`/c/Users/devon/projects/agents-sdk-manual/`).

| Section | SDK Manual Source | Priority |
|---------|-------------------|----------|
| Getting Started | `01_getting-started/` | High |
| Build AI Agents | `03_building-agents/`, `04_swaig-functions/`, `05_skills/`, `09_prefabs/` | High |
| Make and Receive Calls | `06_advanced/06_08_relay-client.md` + relay examples | Medium |
| Send Messages | Relay messaging sections | Medium |
| Add Video | Video sections from manual + browser SDK guides | Medium |
| Add Chat | Chat sections from manual + browser SDK guides | Low |
| Manage Resources | `08_signalwire-integration/`, `06_advanced/06_09_rest-client.md` | Low |
| Deploy | `07_deployment/` | Low |

Each guide section will likely need multiple pages beyond the single `overview.mdx` stub. Add new MDX files to the folder as needed — the folder-based navigation in `sdks.yml` will pick them up automatically.

### 2. Reference Tab — Content Writing (Python Variant)

Write Python-specific API reference content. The reference tab uses **Fern variants** — each language gets its own navigation tree with dedicated pages. Start with Python only. **Source material: SDK source code** (read classes, methods, docstrings, and type signatures directly from the Python SDK at `temp/signalwire-python/`).

#### Organization Pattern

Use the existing **realtime-sdk** (Server SDK v4) reference docs as a **structural reference**, not a 1:1 template. The Python SDK will have its own namespaces, classes, and methods that may differ significantly from the realtime-sdk (e.g., there may not be a `voice/` or `messaging/` namespace — it depends entirely on what the Python SDK exposes). The actual structure will be determined during source code exploration. The pattern to follow is the **nesting convention**:

```
namespace/                  → Top-level SDK namespace (agents, relay, rest, cli, configuration)
  class/                    → Each user-facing class/interface
    index.mdx               → Class overview: description, properties, constructor, basic example
    methods/                → One standalone page per method
      method-name.mdx       → Parameters, return type, example
```

**Example** from the existing realtime-sdk (`realtime-sdk/pages/latest/tech-ref/voice/`):
```
voice/                      ← namespace
  call/                     ← class
    index.mdx               ← Call class overview + properties
    events.mdx              ← Call events
    methods/                ← one page per method
      answer.mdx
      hangup.mdx
      play.mdx
      record.mdx
      ...
  client/                   ← class
    index.mdx               ← Voice.Client overview + properties
    methods/
      dial-phone.mdx
      listen.mdx
      ...
```

#### Process

1. **Read the Python SDK source code** — identify all public classes, their methods, properties, parameters, and return types
2. **Compare against realtime-sdk reference structure** — note how the existing docs organize namespaces → classes → methods and follow the same pattern
3. **Map to namespaces** — group everything under the top-level namespace it belongs to:

| Namespace | Source Code (in `temp/signalwire-python/`) | Classes to Document |
|-----------|----------------------------------------------|---------------------|
| Agents | `signalwire/` | `AgentBase`, `SWMLService`, SWAIG function classes, `SkillBase`, context builders |
| RELAY | `relay/` | Relay client, voice, video, messaging, chat, PubSub, task classes |
| REST | `rest/` | REST client, resource namespaces |
| CLI | `swaig-test`, `scripts/` | CLI entry points and their options |
| Configuration | `signalwire/` | Env var handling, config file parsing, SWML schema |

4. **Create the directory structure** — for each namespace, create class folders with `index.mdx` + `methods/` subdirectory
5. **Write one page per method** — each method page documents: signature, parameters (with types), return value (with type), and a code example

#### Target Directory Structure (Python Reference)

```
reference/python/
  agents/
    agent-base/
      index.mdx
      methods/
        set-params.mdx
        add-skill.mdx
        ...
    swml-service/
      index.mdx
      methods/
        ...
    swaig-function/
      index.mdx
      methods/
        ...
    skill-base/
      index.mdx
      methods/
        ...
    contexts/
      index.mdx
      methods/
        ...
  relay/
    client/
      index.mdx
      methods/
        ...
    call/
      index.mdx
      methods/
        ...
    ...
  rest/
    client/
      index.mdx
      methods/
        ...
    ...
  cli/
    overview.mdx
    swaig-test.mdx
    sw-search.mdx
    sw-agent-init.mdx
  configuration/
    overview.mdx
    environment-variables.mdx
    config-files.mdx
```

**This is illustrative only.** The actual namespaces, classes, methods, and page names will be determined by exploring the Python SDK source code. The realtime-sdk structure is a reference for the nesting convention (`namespace → class → methods`), not a content blueprint. The Python SDK may have entirely different top-level namespaces and class hierarchies — we will discover and define the right structure when we begin exploring the code.

### 3. Adding More Languages

To add a new language (e.g., TypeScript):

1. Create `pages/reference/typescript/` with the same subfolder structure (`agents/`, `relay/`, `rest/`, `cli/`, `configuration/`)
2. Add a new variant block in `sdks.yml` under the reference tab:
   ```yaml
   - title: TypeScript
     icon: brands fa-js
     layout:
       - folder: ./pages/reference/typescript/agents
         title: Agents
       # ... same folders
   ```
3. Add TypeScript code blocks to guide pages using `<CodeBlocks>`

### 4. Key Conventions

- **Guides**: Shared pages, language-agnostic prose, code shown via `<CodeBlocks>` with language tabs
- **Reference**: Language-specific pages via Fern variants, one variant per language
- **Navigation**: All folder-based — add MDX files to folders, `sdks.yml` doesn't need editing
- **Page ordering**: Controlled by frontmatter `slug` values within each folder
- **No versioning**: This product has no version selector

### 5. Source Material Locations

**Guides** — write from the SDK manual:
- `/c/Users/devon/projects/agents-sdk-manual/` — Comprehensive SDK manual (12 chapters)

**Reference** — write from SDK source code, cloned into `temp/`:
- `temp/signalwire-python/` — Python SDK (cloned from `https://github.com/signalwire/signalwire-python.git`)
  - `signalwire/` — core SDK module (RELAY, REST, agents)
  - `relay/` — RELAY client implementation
  - `rest/` — REST client implementation
  - `examples/` — usage examples
  - `tests/` — test suite

Python is the **starting language**. Once the Python reference is complete, use it as the model/template for other language SDKs. Clone each language repo into `temp/` as needed (e.g., `temp/signalwire-js/`, `temp/signalwire-ruby/`, etc.).

**Old product directories** (preserved for context, not primary sources):
- `fern/products/agents-sdk/` — 75 pages of prior agent docs
- `fern/products/browser-sdk/` — 200 files of prior browser SDK docs
- `fern/products/realtime-sdk/` — 589 files of prior server SDK docs
