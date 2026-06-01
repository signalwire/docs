---
slug: "/reference/rust/signalwire/skills/builtin/web-search/web-search"
title: "WebSearch"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::skills::builtin::web_search::WebSearch"
  parent: "signalwire::skills::builtin::web_search"
  module: "skills.builtin.web_search"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/skills/builtin/web_search.rs"
  visibility: "public"
---
# `WebSearch`

Search the web using Google Custom Search API.

Mirrors Python's `signalwire.skills.web_search`: the SDK issues a
real HTTP GET to Google CSE (`https://www.googleapis.com/customsearch/v1`)
with the query, key, and CSE ID in the query string, and parses the
JSON response. The base URL can be overridden via the
`WEB_SEARCH_BASE_URL` env var (used by `audit_skills_dispatch.py`'s
fixture). Without that override, the URL points at Google.

## Signature

```rust
struct WebSearch { /* fields */ }
```

## Inheritance

**Implements:** `SkillBase`

## Methods

- [`description`](/reference/rust/signalwire/skills/builtin/web-search/web-search/description)
- [`get_global_data`](/reference/rust/signalwire/skills/builtin/web-search/web-search/get-global-data)
- [`get_prompt_sections`](/reference/rust/signalwire/skills/builtin/web-search/web-search/get-prompt-sections)
- [`name`](/reference/rust/signalwire/skills/builtin/web-search/web-search/name)
- [`new`](/reference/rust/signalwire/skills/builtin/web-search/web-search/new)
- [`params`](/reference/rust/signalwire/skills/builtin/web-search/web-search/params)
- [`register_tools`](/reference/rust/signalwire/skills/builtin/web-search/web-search/register-tools)
- [`setup`](/reference/rust/signalwire/skills/builtin/web-search/web-search/setup)
- [`supports_multiple_instances`](/reference/rust/signalwire/skills/builtin/web-search/web-search/supports-multiple-instances)
- [`version`](/reference/rust/signalwire/skills/builtin/web-search/web-search/version)

## Source

[`src/skills/builtin/web_search.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/skills/builtin/web_search.rs)

Line 15.
