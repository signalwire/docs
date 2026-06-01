---
slug: "/reference/cpp/signalwire/swml"
title: "swml"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "module"
  language: "cpp"
  qualified_name: "signalwire::swml"
  parent: "signalwire"
  module: "signalwire"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/document.hpp"
---
# `swml`

## Signature

```cpp
namespace signalwire::swml
```

## Constants

| Name          | Type                                                                     | Required | Default | Description |
| ------------- | ------------------------------------------------------------------------ | -------- | ------- | ----------- |
| `KNOWN_VERBS` | `const std::vector< std::pair< std::string, std::string > > KNOWN_VERBS` | yes      | —       | —           |

## Functions

- [`get_embedded_schema`](/reference/cpp/signalwire/swml/get-embedded-schema) — Get the embedded schema JSON string.

## Type Aliases

- [`json`](/reference/cpp/signalwire/swml/json)

## Classes

- [`Document`](/reference/cpp/signalwire/swml/document) — A complete SWML document with version and sections.
- [`Schema`](/reference/cpp/signalwire/swml/schema) — Schema loader that extracts verb definitions from schema.json.
- [`Section`](/reference/cpp/signalwire/swml/section) — A named section containing an ordered list of verbs.
- [`Service`](/reference/cpp/signalwire/swml/service) — Base SWML service providing HTTP server, auth, and verb methods. Also hosts SWAIG functions: any Service (sidecar, non-agent verb host) can register tools and serve them on /swaig without subclassing AgentBase.
- [`Verb`](/reference/cpp/signalwire/swml/verb) — Represents a single SWML verb instance, e.g. {"answer": {"max\_duration": 3600}}.
- [`VerbDefinition`](/reference/cpp/signalwire/swml/verb-definition) — Represents a verb definition extracted from the SWML schema.

## Modules

- [`@105170200250052060102006264300101233067136363207`](/reference/cpp/signalwire/swml/105170200250052060102006264300101233067136363207)

## Source

[`include/signalwire/swml/document.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/document.hpp)

Line 10.
