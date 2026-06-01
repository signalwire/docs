---
slug: "/reference/cpp/signalwire/pom/yaml-parse"
title: "yaml_parse"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "function"
  language: "cpp"
  qualified_name: "signalwire::pom::yaml_parse"
  parent: "signalwire::pom"
  module: "signalwire"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/src/pom/pom.cpp"
  visibility: "public"
---
# `yaml_parse`

Parse a YAML document (POM-shaped subset only) into a json value. Supports list-of-dicts at top level; values may be strings, booleans, or lists of either. Throws std::invalid\_argument on malformed input.

## Signature

```cpp
json yaml_parse(const std::string & yaml_text)
```

## Parameters

| Name        | Type                  | Required | Default | Description |
| ----------- | --------------------- | -------- | ------- | ----------- |
| `yaml_text` | `const std::string &` | yes      | —       | —           |

## Returns

`json`

## Source

[`src/pom/pom.cpp`](https://github.com/signalwire/signalwire-cpp/blob/main/src/pom/pom.cpp)

Line 1110.
