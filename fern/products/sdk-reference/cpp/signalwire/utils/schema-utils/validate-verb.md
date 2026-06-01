---
slug: "/reference/cpp/signalwire/utils/schema-utils/validate-verb"
title: "validate_verb"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::utils::SchemaUtils::validate_verb"
  parent: "signalwire::utils::SchemaUtils"
  module: "signalwire.utils"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/utils/schema_utils.hpp"
  visibility: "public"
---
# `validate_verb`

Validate a verb config against the schema. Mirrors Python's validate\_verb(verb\_name, verb\_config). Returns (valid, errors) — Python's Tuple\[bool, List\[str]].

**Modifiers:** `const`

## Signature

```cpp
std::pair< bool, std::vector< std::string > > validate_verb(
    const std::string & verb_name,
    const json & verb_config
) const
```

## Parameters

| Name          | Type                  | Required | Default | Description |
| ------------- | --------------------- | -------- | ------- | ----------- |
| `verb_name`   | `const std::string &` | yes      | —       | —           |
| `verb_config` | `const json &`        | yes      | —       | —           |

## Returns

`std::pair< bool, std::vector< std::string > >`

## Source

[`include/signalwire/utils/schema_utils.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/utils/schema_utils.hpp)

Line 94.
