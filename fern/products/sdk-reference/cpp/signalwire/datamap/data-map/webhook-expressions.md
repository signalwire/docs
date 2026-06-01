---
slug: "/reference/cpp/signalwire/datamap/data-map/webhook-expressions"
title: "webhook_expressions"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::datamap::DataMap::webhook_expressions"
  parent: "signalwire::datamap::DataMap"
  module: "signalwire.datamap"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/datamap/datamap.hpp"
  visibility: "public"
---
# `webhook_expressions`

Add expressions that run after the most recent webhook.

## Signature

```cpp
DataMap & webhook_expressions(const std::vector< json > & expressions)
```

## Parameters

| Name          | Type                          | Required | Default | Description |
| ------------- | ----------------------------- | -------- | ------- | ----------- |
| `expressions` | `const std::vector< json > &` | yes      | —       | —           |

## Returns

`DataMap &`

## Source

[`include/signalwire/datamap/datamap.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/datamap/datamap.hpp)

Line 78.
