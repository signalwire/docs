---
slug: "/reference/cpp/signalwire/datamap/data-map/error-keys"
title: "error_keys"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::datamap::DataMap::error_keys"
  parent: "signalwire::datamap::DataMap"
  module: "signalwire.datamap"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/datamap/datamap.hpp"
  visibility: "public"
---
# `error_keys`

Set error keys for the most recent webhook or top-level.

## Signature

```cpp
DataMap & error_keys(const std::vector< std::string > & keys)
```

## Parameters

| Name   | Type                                 | Required | Default | Description |
| ------ | ------------------------------------ | -------- | ------- | ----------- |
| `keys` | `const std::vector< std::string > &` | yes      | —       | —           |

## Returns

`DataMap &`

## Source

[`include/signalwire/datamap/datamap.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/datamap/datamap.hpp)

Line 96.
