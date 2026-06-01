---
slug: "/reference/cpp/signalwire/utils/schema-utils/schema-utils"
title: "SchemaUtils"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::utils::SchemaUtils::SchemaUtils"
  parent: "signalwire::utils::SchemaUtils"
  module: "signalwire.utils"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/utils/schema_utils.hpp"
  visibility: "public"
---
# `SchemaUtils`

Construct a SchemaUtils. Mirrors Python's SchemaUtils(schema\_path=None, schema\_validation=True). Pass schema\_path = "" to use the embedded schema.

## Signature

```cpp
void SchemaUtils(
    const std::string & schema_path = "",
    bool schema_validation = true
)
```

## Parameters

| Name                | Type                  | Required | Default | Description |
| ------------------- | --------------------- | -------- | ------- | ----------- |
| `schema_path`       | `const std::string &` | no       | `""`    | —           |
| `schema_validation` | `bool`                | no       | `true`  | —           |

## Source

[`include/signalwire/utils/schema_utils.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/utils/schema_utils.hpp)

Line 65.
