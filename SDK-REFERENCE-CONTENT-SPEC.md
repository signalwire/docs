# Python SDK Reference — Content Writing Spec

## Context

We have 163 MDX stub files scaffolded across 3 namespaces (`agents/`, `relay/`, `rest/`) under `fern/products/sdks/pages/reference/python/`. Each stub has frontmatter only. This spec defines how to fill them with content — the page structure, component usage, and writing conventions that every page must follow.

**Source material**: Python SDK source code at `temp/signalwire-python/signalwire/signalwire/`
**SDK manual**: `temp/sdk-manual/` — authoritative prose reference, cross-check for completeness
**Structural reference**: Realtime-SDK docs at `fern/products/realtime-sdk/` (section ordering)
**Component reference**: SWML docs at `fern/products/swml/` (richer component set)
**Fern documentation**: `temp/fern-docs/` — Fern platform docs for config setup, MDX components, and component properties. Consult here for any Fern-specific questions (component syntax, attributes, frontmatter fields, navigation config, etc.)

## Page Types

There are 5 page types. Every MDX file maps to exactly one.

---

### Type 1: Class Overview Page

**Used for**: `index.mdx` files inside class folders (e.g., `agent-base/index.mdx`, `relay/client/index.mdx`)

**Section order**:

1. Frontmatter
2. Overview paragraph — what the class is, when to use it, where it fits in the SDK
3. Class hierarchy — only when the relationship is public-facing and useful (e.g., "AgentBase extends SWMLService")
4. `## **Properties**` — all public properties via `<ParamField>`
5. `## **Constructor**` — signature + parameters via `<ParamField>` + `<Indent>`
6. `#### Example` — a basic working code example

**Concrete template**:

```mdx
---
title: "ClassName"
slug: /reference/python/namespace/class-name
description: One-line description of the class.
max-toc-depth: 3
---

Brief overview of what this class does, when you'd use it, and where it fits
in the SDK architecture. Focus on the public interface — what a developer
needs to know to use this class effectively.

Extends [`ParentClass`](/docs/sdks/reference/python/namespace/parent-class) — inherits
all parent properties and methods.

## **Properties**

<ParamField path="property_name" type="string" toc={true}>
  Description of the property and what it represents.
</ParamField>

<ParamField path="another_property" type="boolean" default="false" toc={true}>
  Description with default value.
</ParamField>

## **Constructor**

```python
instance = ClassName(required_param, optional_param="default")
```

<ParamField path="required_param" type="string" required={true} toc={true}>
  Description of the required parameter.
</ParamField>

<ParamField path="optional_param" type="string" default="default" toc={true}>
  Description of the optional parameter.
</ParamField>

#### Example

```python
from signalwire import ClassName

instance = ClassName("value")
instance.serve()
```
```

---

### Type 2: Method Page

**Used for**: Files inside `methods/` folders (e.g., `agent-base/methods/set-params.mdx`, `relay/call/methods/play.mdx`)

**Section order**:

1. Frontmatter
2. Method signature heading
3. Brief description (1-2 sentences)
4. Callout (if needed — `<Info>`, `<Warning>`, `<Note>`, or `<Tip>`)
5. `#### Parameters` — `<ParamField>` wrapper + `<Indent>` for nested params
6. `#### Returns` — return type and description
7. `#### Example` or `#### Examples` — code

**Concrete template**:

```mdx
---
title: "method_name"
slug: /reference/python/namespace/class-name/method-name
description: Brief description of the method.
max-toc-depth: 3
---

### method_name

**method_name**(`param1`, `param2="default"`) -> `ReturnType`

Brief description of what this method does and when to use it.

<Note>
Important detail the user should know before calling this method.
</Note>

#### Parameters

<ParamField path="param1" type="string" required={true} toc={true}>
  Description of the first parameter.
</ParamField>

<ParamField path="param2" type="object" toc={true}>
  Description of the object parameter.
</ParamField>

<Indent>
<ParamField path="param2.nested_field" type="string" required={true} toc={true}>
  Description of the nested field.
</ParamField>

<ParamField path="param2.optional_field" type="integer" default="10" toc={true}>
  Description with default value.
</ParamField>
</Indent>

#### Returns

`ReturnType` — Description of what is returned and what you can do with it.

#### Example

```python
from signalwire import AgentBase

agent = AgentBase()
result = agent.method_name("value", param2={"nested_field": "data"})
```
```

**For pages documenting multiple related methods** (e.g., `hints.mdx` covers `add_hint()`, `add_hints()`, `add_pattern_hint()`):

```mdx
---
title: "hints"
slug: /reference/python/agents/agent-base/hints
description: Add speech recognition hints to improve accuracy.
max-toc-depth: 3
---

### add_hint

**add_hint**(`hint`) -> `None`

Add a single speech recognition hint.

#### Parameters

<ParamField path="hint" type="string" required={true} toc={true}>
  A word or phrase to boost recognition accuracy.
</ParamField>

#### Returns

`None`

---

### add_hints

**add_hints**(`hints`) -> `None`

Add multiple speech recognition hints at once.

#### Parameters

<ParamField path="hints" type="list[str]" required={true} toc={true}>
  A list of words or phrases.
</ParamField>

#### Returns

`None`

#### Example

```python
agent.add_hint("SignalWire")
agent.add_hints(["transfer", "billing", "support"])
```
```

---

### Type 3: Events Page

**Used for**: Event reference pages (e.g., `relay/call/events.mdx`, `relay/events.mdx`)

**Section order**:

1. Frontmatter
2. Overview of the event system for this class
3. `## Events` heading
4. Repeating block per event: name, registration pattern, description, payload fields

**Concrete template**:

```mdx
---
title: "Call Events"
slug: /reference/python/relay/call/events
description: Event handling for RELAY call lifecycle.
max-toc-depth: 3
---

Events are emitted during the lifecycle of a call. Register handlers using
the `call.on()` method or the `@client.on_call` decorator.

## Events

### state_changed

```python
call.on("state_changed", handler)
```

Emitted when the call state changes (e.g., `ringing` -> `answered` -> `ended`).

#### Parameters

<ParamField path="call" type="Call" required={true} toc={true}>
  The [`Call`](/docs/sdks/reference/python/relay/call) object with updated state.
</ParamField>

---

### play_finished

```python
call.on("play_finished", handler)
```

Emitted when a play action completes.

#### Parameters

<ParamField path="event" type="PlayEvent" required={true} toc={true}>
  Contains `control_id` and `state` of the completed playback.
</ParamField>
```

---

### Type 4: Grouped Reference Page

**Used for**: Pages that document multiple small classes or a simple namespace on one page (e.g., `relay/actions.mdx`, `rest/phone-numbers.mdx`, `agents/prefabs.mdx`)

**Section order**:

1. Frontmatter
2. Overview paragraph
3. Repeating blocks per class/method — heading, description, properties/params, example

**Concrete template (actions page)**:

```mdx
---
title: "Actions"
slug: /reference/python/relay/actions
description: Action classes returned from call control methods.
max-toc-depth: 3
---

Action objects are returned from call control methods like `play()`, `record()`,
and `detect()`. They provide a common interface for controlling in-progress operations.

## Base Interface

All action objects share these methods and properties:

<ParamField path="is_done" type="bool" toc={true}>
  Whether the action has completed.
</ParamField>

### stop

**stop**() -> `None`

Stop the action immediately.

### wait

**wait**(`timeout=None`) -> `Self`

Block until the action completes or the timeout expires.

<ParamField path="timeout" type="float" toc={true}>
  Maximum seconds to wait. `None` waits indefinitely.
</ParamField>

---

## PlayAction

Returned from [`call.play()`](/docs/sdks/reference/python/relay/call/methods/play).

### Additional Methods

### pause

**pause**() -> `None`

Pause audio playback.

### resume

**resume**() -> `None`

Resume paused playback.

### volume

**volume**(`level`) -> `None`

Adjust playback volume.

<ParamField path="level" type="float" required={true} toc={true}>
  Volume level adjustment.
</ParamField>
```

**Concrete template (REST namespace page)**:

```mdx
---
title: "Phone Numbers"
slug: /reference/python/rest/phone-numbers
description: Search and manage phone numbers.
max-toc-depth: 3
---

Manage phone numbers in your SignalWire project.

Access via `client.phone_numbers` on a [`RestClient`](/docs/sdks/reference/python/rest/client) instance.

### list

**list**(`filters=None`) -> `list[PhoneNumber]`

List phone numbers in the project.

#### Parameters

<ParamField path="filters" type="dict" toc={true}>
  Optional filters to narrow results.
</ParamField>

#### Returns

`list[PhoneNumber]` — A list of phone number objects.

---

### search

**search**(`area_code=None`, `country=None`) -> `list[AvailableNumber]`

Search for available phone numbers to purchase.

#### Parameters

<ParamField path="area_code" type="string" toc={true}>
  Filter by area code.
</ParamField>

<ParamField path="country" type="string" default="US" toc={true}>
  ISO country code.
</ParamField>

#### Returns

`list[AvailableNumber]` — Available numbers matching the search criteria.

#### Example

```python
from signalwire import RestClient

client = RestClient()
numbers = client.phone_numbers.search(area_code="503")
```
```

---

### Type 5: Namespace Overview Page

**Used for**: `overview.mdx` files at the top of each namespace (e.g., `agents/overview.mdx`, `relay/overview.mdx`)

**Section order**:

1. Frontmatter
2. Overview paragraph — what this namespace covers, who it's for
3. Quick-start snippet (if appropriate)
4. `<CardGroup>` linking to major classes/subsections

**Concrete template**:

```mdx
---
title: "Agents"
subtitle: "Python API reference for AgentBase, SWMLService, SWAIG functions, skills, and contexts"
sidebar-title: Overview
slug: /reference/python/agents
description: Core framework for building AI-powered voice agents.
max-toc-depth: 3
position: 0
---

The Agents namespace provides the core framework for building AI-powered voice
agents with SignalWire. It includes the central `AgentBase` class, SWML document
generation, tool/function definitions, skills, and multi-agent hosting.

```python
from signalwire import AgentBase

agent = AgentBase()
agent.set_prompt_text("You are a helpful assistant.")
agent.serve()
```

<CardGroup cols={2}>
  <Card
    title="AgentBase"
    icon="fa-regular fa-robot"
    href="/docs/sdks/reference/python/agents/agent-base"
  >
    The central class for building AI agents. Manages prompts, tools, skills, and serving.
  </Card>
  <Card
    title="SWMLService"
    icon="fa-regular fa-file-code"
    href="/docs/sdks/reference/python/agents/swml-service"
  >
    SWML document generation and FastAPI service base class.
  </Card>
  <Card
    title="FunctionResult"
    icon="fa-regular fa-reply"
    href="/docs/sdks/reference/python/agents/function-result"
  >
    Fluent interface for returning actions from tool functions.
  </Card>
  <Card
    title="CLI Tools"
    icon="fa-regular fa-terminal"
    href="/docs/sdks/reference/python/agents/cli"
  >
    Command-line tools for testing, searching, scaffolding, and deployment.
  </Card>
</CardGroup>
```

---

## Component Reference

### ParamField

Documents a property, parameter, or event payload field.

```mdx
<ParamField path="name" type="string" required={true} default="value" toc={true}>
  Description text with **bold**, `code`, and [links](/path).
</ParamField>
```

| Attribute | Required | Description |
|-----------|----------|-------------|
| `path` | Yes | Dot-notation name (e.g., `param`, `config.nested.field`) |
| `type` | Yes | Python type (e.g., `str`, `int`, `bool`, `dict`, `list[str]`, `Optional[str]`, `Callable`) |
| `required={true}` | No | Only set for truly required params. Omit for optional. |
| `default="value"` | No | Default value. Include units if relevant (e.g., `"30 seconds"`). |
| `toc={true}` | No | Include in table of contents. Set for all top-level params. |

**Type conventions for Python**:
- Use Python type names: `str`, `int`, `float`, `bool`, `dict`, `list`, `None`
- Generics: `list[str]`, `dict[str, Any]`, `Optional[str]`
- Callables: `Callable`, `Callable[[str], None]`
- Union types: `str | int`
- SDK types: `Call`, `Message`, `PlayAction`, `FunctionResult`

### Indent

Wraps nested parameters belonging to a parent object.

```mdx
<ParamField path="config" type="dict" toc={true}>
  Configuration object.
</ParamField>

<Indent>
<ParamField path="config.key" type="str" required={true} toc={true}>
  Nested field.
</ParamField>
</Indent>
```

### Callouts

```mdx
<Info>General context, "see also" links, related methods.</Info>
<Info title="Title">Info with a heading.</Info>
<Note>Important detail the user shouldn't miss.</Note>
<Warning>Gotchas, breaking behavior, common mistakes.</Warning>
<Tip>Best practices, recommended patterns.</Tip>
```

**When to use each**:
- `<Info>` — Pointing to related methods or pages. "See [`play()`](/path) for audio playback."
- `<Note>` — Behavioral detail that affects usage. "This method blocks until the action completes."
- `<Warning>` — Something that could break or surprise. "Calling this after `serve()` has no effect."
- `<Tip>` — Recommended approach. "Use `@tool` decorator instead of `define_tool()` for most cases."

### Code Examples

**Single example** — plain fenced block:

````mdx
```python
agent = AgentBase()
agent.set_prompt_text("You are a helpful assistant.")
```
````

**Multiple examples** — wrapped in CodeBlocks:

```mdx
<CodeBlocks>
<CodeBlock title="Basic Usage">
```python
agent.add_skill("datetime")
```
</CodeBlock>
<CodeBlock title="With Configuration">
```python
agent.add_skill("web_search", config={"api_key": "..."})
```
</CodeBlock>
</CodeBlocks>
```

### CardGroup + Card

For namespace overviews linking to classes/subsections.

```mdx
<CardGroup cols={2}>
  <Card title="Title" icon="fa-regular fa-icon" href="/docs/path">
    Short description.
  </Card>
</CardGroup>
```

Icons use Font Awesome `fa-regular` style per branding guide.

### Tabs

For mutually exclusive alternatives on the same page.

```mdx
<Tabs>
<Tab title="Decorator Style">
```python
@agent.tool()
def my_func(args):
    return "result"
```
</Tab>
<Tab title="Imperative Style">
```python
agent.define_tool("my_func", handler=my_func, description="...")
```
</Tab>
</Tabs>
```

---

## Writing Conventions

### Frontmatter

Every page gets these fields. Additional fields depend on page type.

**All pages:**

```yaml
---
title: "Display Title"
slug: /reference/python/namespace/class/method
description: One-line description for SEO and previews.
max-toc-depth: 3
---
```

**Namespace overview pages** (`overview.mdx` at namespace root):

```yaml
---
title: "Agents"
subtitle: "Python API reference for AgentBase, SWMLService, SWAIG functions, skills, and contexts"
sidebar-title: Overview
slug: /reference/python/agents
description: Core framework for building AI-powered voice agents.
max-toc-depth: 3
position: 0
---
```

**Nested overview pages** (`overview.mdx` inside a subsection like `cli/overview.mdx`):

```yaml
---
title: "CLI Tools"
sidebar-title: Overview
slug: /reference/python/agents/cli
description: Command-line tools for testing, searching, and scaffolding.
max-toc-depth: 3
---
```

**Class overview pages** (`index.mdx` inside a class folder):

```yaml
---
title: "AgentBase"
slug: /reference/python/agents/agent-base
description: The central class for building AI agents.
max-toc-depth: 3
---
```

**Method pages** (`methods/set-params.mdx`):

```yaml
---
title: "set_params"
slug: /reference/python/agents/agent-base/set-params
description: Configure LLM parameters for the agent.
max-toc-depth: 3
---
```

#### Frontmatter field reference

| Field | Required | When to use |
|-------|----------|-------------|
| `title` | Always | Display title. Use Python names for methods (`set_params`), display names for classes (`AgentBase`). |
| `slug` | Always | Full path from product root. Always kebab-case with hyphens. Product base (`/docs/sdks/`) is prepended automatically by Fern. |
| `description` | Always | One sentence. Used in meta tags and search. |
| `max-toc-depth` | Always | Set to `3` on all pages. |
| `subtitle` | Overview pages only | Short tagline shown below title. Only on namespace `overview.mdx` pages. |
| `sidebar-title` | When needed | Set to `Overview` on `overview.mdx` pages so the sidebar shows "Overview" instead of the full title. Also use when the title is verbose and the sidebar needs a shorter name (e.g., title "CLI Tools", sidebar-title "Overview"). |
| `position` | When needed | Sort order in sidebar. `0` = first. Use on `overview.mdx` to ensure it appears at the top of its folder. |

#### Slug conventions

- **Full paths**: `/reference/python/agents/agent-base/set-params` (not just `set-params`)
- **Kebab-case**: Always hyphens between words (`set-params`, not `set_params` or `setparams`)
- **Python to slug mapping**: `snake_case` methods become `kebab-case` slugs (`play_and_collect` -> `play-and-collect`)
- **No trailing slashes**
- **Product base is automatic**: Fern prepends `/docs/sdks/` — don't include it in the slug

### Method Signatures

Display as bold text with backtick params and return type:

```
**method_name**(`param1`, `param2="default"`) -> `ReturnType`
```

- Use Python syntax: keyword args with defaults, type hints in ParamField not in signature
- Link return types when they're SDK classes: `` -> [`Call`](/docs/sdks/reference/python/relay/call) ``
- For methods returning `None`, write `-> `None`` or omit the return section

### Cross-References

Use inline Markdown links:

```mdx
See [`AgentBase`](/docs/sdks/reference/python/agents/agent-base) for the full class reference.
```

Or reference-style links at the top of the file for repeated references:

```mdx
[agent-base]: /docs/sdks/reference/python/agents/agent-base
[call]: /docs/sdks/reference/python/relay/call

...uses [`AgentBase`][agent-base] and returns a [`Call`][call] object.
```

### Enum Values

List valid values in the ParamField description:

```mdx
<ParamField path="direction" type="str" toc={true}>
  Call direction. Valid values:
  - `"inbound"` — incoming call
  - `"outbound"` — outgoing call
</ParamField>
```

### Content Principles

1. **Public interface only** — Don't document internal methods, private attributes, or implementation details
2. **Describe behavior, not code** — "Starts the FastAPI server" not "Calls uvicorn.run()"
3. **One concept per page** — Method pages document that method. Don't explain the whole class.
4. **Progressive examples** — Simple usage first, advanced patterns after
5. **Link, don't repeat** — Reference other pages instead of duplicating content
6. **Every ParamField gets a description** — Never leave a parameter undescribed

---

## Source Material Mapping

When writing content for each page, read the corresponding source file:

| Page Location | Read From |
|---------------|-----------|
| `agents/agent-base/**` | `core/agent_base.py` + `core/mixins/*.py` |
| `agents/swml-service/**` | `core/swml_service.py` |
| `agents/function-result/**` | `core/function_result.py` |
| `agents/context-builder/**` | `core/contexts.py` |
| `agents/data-map/**` | `core/data_map.py` |
| `agents/skills.mdx` | `skills/registry.py` + `skills/*/` |
| `agents/prefabs.mdx` | `prefabs/*.py` |
| `agents/cli/**` | `cli/*.py` |
| `agents/configuration/**` | `core/config_loader.py`, `core/security_config.py`, `core/auth_handler.py` |
| `relay/client/**` | `relay/client.py` |
| `relay/call/**` | `relay/call.py` |
| `relay/events.mdx` | `relay/event.py` |
| `relay/message/**` | `relay/message.py` |
| `relay/constants.mdx` | `relay/constants.py` |
| `rest/client/**` | `rest/client.py` |
| `rest/calling/**` | `rest/namespaces/calling.py` |
| `rest/*.mdx` (namespaces) | `rest/namespaces/*.py` |

All source paths relative to `temp/signalwire-python/signalwire/signalwire/`.

## SDK Manual Cross-Check

The SDK manual at `temp/sdk-manual/` is the authoritative prose reference for the Python SDK. Its `10_reference/` chapter contains detailed API documentation that **must be cross-checked** against our reference pages to ensure no methods, parameters, behaviors, or usage patterns are missed.

### Cross-check mapping

| Our Reference Page | Manual Reference File (Python) | Manual Concept Chapters |
|--------------------|-------------------------------|------------------------|
| `agents/agent-base/**` | `10_01_api-agent-base.md` | `03_building-agents/` (all files) |
| `agents/swml-service/**` | `10_02_api-swml-service.md` | `02_core-concepts/02_02_swml.md` |
| `agents/swaig-function/**` | `10_03_api-swaig-function.md` | `04_swaig-functions/04_01-04_02` |
| `agents/function-result/**` | `10_04_api-function-result.md` | `04_swaig-functions/04_03_results-actions.md` |
| `agents/data-map/**` | `10_05_api-data-map.md` | `04_swaig-functions/04_04_datamap.md` |
| `agents/skill-base/**` | `10_06_api-skill-base.md` | `05_skills/` (all files) |
| `agents/context-builder/**` | `10_07_api-contexts.md` | `06_advanced/06_01_contexts-workflows.md` |
| `agents/cli/swaig-test.mdx` | `10_08_cli-swaig-test.md` | — |
| `agents/cli/sw-search.mdx` | `10_09_cli-sw-search.md` | `06_advanced/06_06_search-knowledge.md` |
| `agents/cli/sw-agent-init.mdx` | `10_10_cli-sw-agent-init.md` | — |
| `agents/configuration/**` | `10_11_environment-variables.md`, `10_12_config-files.md` | `02_core-concepts/02_05_security.md` |
| `agents/prefabs.mdx` | — | `09_prefabs/` (all files) |
| `agents/skills.mdx` | — | `05_skills/05_02_builtin-skills.md`, `05_05_skill-config.md` |
| `agents/agent-server/**` | — | `06_advanced/06_05_multi-agent.md` |
| `relay/client/**` | `10_14_api-relay-client.md` | `06_advanced/06_08_relay-client.md` |
| `relay/call/**` | `10_14_api-relay-client.md` | `06_advanced/06_08_relay-client.md` |
| `rest/client/**` | `10_15_api-rest-client.md` | `06_advanced/06_09_rest-client.md` |

### Cross-check process

For each reference page, before marking it complete:

1. **Read the manual reference file** — Check that every method, parameter, and return type documented in the manual is present in our page
2. **Read the manual concept chapter** — Look for behavioral notes, gotchas, and usage patterns that should appear as `<Note>`, `<Warning>`, or `<Tip>` callouts
3. **Check for missing methods** — The manual may document methods not found in our file tree (these may need new pages)
4. **Check for missing parameters** — The manual often documents parameter constraints (valid ranges, enum values, required combinations) not obvious from source code
5. **Adopt good examples** — The manual and `temp/sdk-manual/11_examples/` contain real-world code examples that should inform our example sections

### Additional manual resources

| Resource | Location | Use for |
|----------|----------|---------|
| AI parameters appendix | `12_appendix/12_01_ai-parameters.md` | Complete list of LLM params for `set_params` page |
| Patterns appendix | `12_appendix/12_02_patterns.md` | Common usage patterns for examples |
| Best practices | `12_appendix/12_03_best-practices.md` | `<Tip>` callouts on relevant pages |
| Troubleshooting | `12_appendix/12_04_troubleshooting.md` | `<Warning>` callouts for known issues |
| Examples by feature | `11_examples/11_01_by-feature.md` | Code examples for method pages |
| Examples by complexity | `11_examples/11_02_by-complexity.md` | Progressive example ordering |

### Future use: Guides tab

After the reference section is complete, chapters 01-09 of the SDK manual will serve as the primary source for the **Guides tab** content:

| Guide Section | Manual Chapters |
|---------------|----------------|
| Getting Started | `01_getting-started/` |
| Build AI Agents | `03_building-agents/`, `04_swaig-functions/`, `05_skills/` |
| Make and Receive Calls | `06_advanced/06_08_relay-client.md` |
| Send Messages | `06_advanced/06_08_relay-client.md` (messaging sections) |
| Manage Resources | `08_signalwire-integration/`, `06_advanced/06_09_rest-client.md` |
| Deploy | `07_deployment/` |

This is noted here for planning purposes only — guides are out of scope for this spec.

## Verification

1. Every page must have at least: frontmatter, one description paragraph, and one code example
2. Every `<ParamField>` must have `path`, `type`, and a description
3. Method pages must have Parameters and Returns sections (unless void with no params)
4. Cross-reference links should point to valid slugs within the SDK docs
5. Python code examples should be syntactically valid and use real SDK imports
