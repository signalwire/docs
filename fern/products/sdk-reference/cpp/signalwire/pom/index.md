---
slug: "/reference/cpp/signalwire/pom"
title: "pom"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "module"
  language: "cpp"
  qualified_name: "signalwire::pom"
  parent: "signalwire"
  module: "signalwire"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/pom/pom.hpp"
---
# `pom`

## Signature

```cpp
namespace signalwire::pom
```

## Functions

- [`yaml_dump`](/reference/cpp/signalwire/pom/yaml-dump) — Emit a json value as YAML. Inverse of yaml\_parse. Pretty output matches the shape PyYAML's yaml.dump(..., default\_flow\_style=False, sort\_keys=False) produces for the POM shape.
- [`yaml_dump_ordered`](/reference/cpp/signalwire/pom/yaml-dump-ordered)
- [`yaml_parse`](/reference/cpp/signalwire/pom/yaml-parse) — Parse a YAML document (POM-shaped subset only) into a json value. Supports list-of-dicts at top level; values may be strings, booleans, or lists of either. Throws std::invalid\_argument on malformed input.

## Type Aliases

- [`json`](/reference/cpp/signalwire/pom/json)

## Classes

- [`PromptObjectModel`](/reference/cpp/signalwire/pom/prompt-object-model) — Top-level container of an ordered list of sections.
- [`Section`](/reference/cpp/signalwire/pom/section) — One section in the Prompt Object Model tree. Mirrors Python's signalwire.pom.pom.Section. Fields are public to match the Python attribute access pattern section.body, section.bullets, section.subsections.

## Modules

- [`@321346216146062004112344024263326171263320170331`](/reference/cpp/signalwire/pom/321346216146062004112344024263326171263320170331)

## Source

[`include/signalwire/pom/pom.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/pom/pom.hpp)

Line 37.
