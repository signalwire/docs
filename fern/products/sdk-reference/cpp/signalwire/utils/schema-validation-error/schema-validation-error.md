---
slug: "/reference/cpp/signalwire/utils/schema-validation-error/schema-validation-error"
title: "SchemaValidationError"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::utils::SchemaValidationError::SchemaValidationError"
  parent: "signalwire::utils::SchemaValidationError"
  module: "signalwire.utils"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/utils/schema_utils.hpp"
  visibility: "public"
---
# `SchemaValidationError`

**Modifiers:** `inline`

## Signature

```cpp
void SchemaValidationError(
    std::string verb_name,
    std::vector< std::string > errors
)
```

## Parameters

| Name        | Type                         | Required | Default | Description |
| ----------- | ---------------------------- | -------- | ------- | ----------- |
| `verb_name` | `std::string`                | yes      | —       | —           |
| `errors`    | `std::vector< std::string >` | yes      | —       | —           |

## Source

[`include/signalwire/utils/schema_utils.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/utils/schema_utils.hpp)

Line 36.
