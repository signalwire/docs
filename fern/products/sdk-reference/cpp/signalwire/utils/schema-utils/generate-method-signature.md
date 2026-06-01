---
slug: "/reference/cpp/signalwire/utils/schema-utils/generate-method-signature"
title: "generate_method_signature"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::utils::SchemaUtils::generate_method_signature"
  parent: "signalwire::utils::SchemaUtils"
  module: "signalwire.utils"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/utils/schema_utils.hpp"
  visibility: "public"
---
# `generate_method_signature`

Generate a Python-style method signature string for a verb. Mirrors Python's generate\_method\_signature(verb\_name).

**Modifiers:** `const`

## Signature

```cpp
std::string generate_method_signature(const std::string & verb_name) const
```

## Parameters

| Name        | Type                  | Required | Default | Description |
| ----------- | --------------------- | -------- | ------- | ----------- |
| `verb_name` | `const std::string &` | yes      | —       | —           |

## Returns

`std::string`

## Source

[`include/signalwire/utils/schema_utils.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/utils/schema_utils.hpp)

Line 105.
