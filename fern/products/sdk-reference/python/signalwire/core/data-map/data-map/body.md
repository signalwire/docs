---
slug: "/reference/python/signalwire/core/data-map/data-map/body"
title: "body"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.data_map.DataMap.body"
  parent: "signalwire.core.data_map.DataMap"
  module: "signalwire.core.data_map"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/data_map.py"
---
# `body`

Set request body for the last added webhook (POST/PUT requests)

## Signature

```python
body(data: Dict[str, Any]) -> DataMap
```

## Parameters

| Name   | Type             | Required | Default | Description                                               |
| ------ | ---------------- | -------- | ------- | --------------------------------------------------------- |
| `data` | `Dict[str, Any]` | yes      | —       | Request body data (can include ${variable} substitutions) |

## Returns

`DataMap` — Self for method chaining

## Source

[`/src/signalwire/signalwire/core/data_map.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/data_map.py)

Line 255.
