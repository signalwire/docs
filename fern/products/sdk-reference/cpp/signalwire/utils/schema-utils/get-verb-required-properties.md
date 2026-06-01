---
slug: "/reference/cpp/signalwire/utils/schema-utils/get-verb-required-properties"
title: "get_verb_required_properties"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::utils::SchemaUtils::get_verb_required_properties"
  parent: "signalwire::utils::SchemaUtils"
  module: "signalwire.utils"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/utils/schema_utils.hpp"
  visibility: "public"
---
# `get_verb_required_properties`

The required list for a verb, or empty when unknown / not specified. Mirrors Python's get\_verb\_required\_properties(verb\_name).

**Modifiers:** `const`

## Signature

```cpp
std::vector< std::string > get_verb_required_properties(
    const std::string & verb_name
) const
```

## Parameters

| Name        | Type                  | Required | Default | Description |
| ----------- | --------------------- | -------- | ------- | ----------- |
| `verb_name` | `const std::string &` | yes      | —       | —           |

## Returns

`std::vector< std::string >`

## Source

[`include/signalwire/utils/schema_utils.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/utils/schema_utils.hpp)

Line 84.
