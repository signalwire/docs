---
slug: "/reference/cpp/signalwire/datamap/data-map/expression"
title: "expression"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::datamap::DataMap::expression"
  parent: "signalwire::datamap::DataMap"
  module: "signalwire.datamap"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/datamap/datamap.hpp"
  visibility: "public"
---
# `expression`

Add an expression pattern for pattern-based responses.

## Signature

```cpp
DataMap & expression(
    const std::string & test_value,
    const std::string & pattern,
    const swaig::FunctionResult & output,
    const swaig::FunctionResult * nomatch_output = nullptr
)
```

## Parameters

| Name             | Type                            | Required | Default   | Description |
| ---------------- | ------------------------------- | -------- | --------- | ----------- |
| `test_value`     | `const std::string &`           | yes      | —         | —           |
| `pattern`        | `const std::string &`           | yes      | —         | —           |
| `output`         | `const swaig::FunctionResult &` | yes      | —         | —           |
| `nomatch_output` | `const swaig::FunctionResult *` | no       | `nullptr` | —           |

## Returns

`DataMap &`

## Source

[`include/signalwire/datamap/datamap.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/datamap/datamap.hpp)

Line 66.
