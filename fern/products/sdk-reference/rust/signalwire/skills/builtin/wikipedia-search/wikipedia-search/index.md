---
slug: "/reference/rust/signalwire/skills/builtin/wikipedia-search/wikipedia-search"
title: "WikipediaSearch"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::skills::builtin::wikipedia_search::WikipediaSearch"
  parent: "signalwire::skills::builtin::wikipedia_search"
  module: "skills.builtin.wikipedia_search"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/skills/builtin/wikipedia_search.rs"
  visibility: "public"
---
# `WikipediaSearch`

Search Wikipedia and get article summaries.

Mirrors Python's `signalwire.skills.wikipedia_search`: real HTTP GET
against the Wikipedia REST API. The base URL can be overridden by
setting `WIKIPEDIA_BASE_URL` (used by `audit_skills_dispatch.py`'s
fixture). Defaults to `https://en.wikipedia.org`.

## Signature

```rust
struct WikipediaSearch { /* fields */ }
```

## Inheritance

**Implements:** `SkillBase`

## Methods

- [`description`](/reference/rust/signalwire/skills/builtin/wikipedia-search/wikipedia-search/description)
- [`get_prompt_sections`](/reference/rust/signalwire/skills/builtin/wikipedia-search/wikipedia-search/get-prompt-sections)
- [`name`](/reference/rust/signalwire/skills/builtin/wikipedia-search/wikipedia-search/name)
- [`new`](/reference/rust/signalwire/skills/builtin/wikipedia-search/wikipedia-search/new)
- [`params`](/reference/rust/signalwire/skills/builtin/wikipedia-search/wikipedia-search/params)
- [`register_tools`](/reference/rust/signalwire/skills/builtin/wikipedia-search/wikipedia-search/register-tools)
- [`setup`](/reference/rust/signalwire/skills/builtin/wikipedia-search/wikipedia-search/setup)

## Source

[`src/skills/builtin/wikipedia_search.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/skills/builtin/wikipedia_search.rs)

Line 13.
