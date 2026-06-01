---
slug: "/reference/cpp/signalwire/datamap/data-map/params"
title: "params"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::datamap::DataMap::params"
  parent: "signalwire::datamap::DataMap"
  module: "signalwire.datamap"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/datamap/datamap.hpp"
  visibility: "public"
---
# `params`

Set request params for the last added webhook (alias for body).

## Signature

```cpp
DataMap & params(const json & data)
```

## Parameters

| Name   | Type           | Required | Default | Description |
| ------ | -------------- | -------- | ------- | ----------- |
| `data` | `const json &` | yes      | —       | —           |

## Returns

`DataMap &`

## Source

[`include/signalwire/datamap/datamap.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/datamap/datamap.hpp)

Line 84.
