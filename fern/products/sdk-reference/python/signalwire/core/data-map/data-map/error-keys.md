---
slug: "/reference/python/signalwire/core/data-map/data-map/error-keys"
title: "error_keys"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.data_map.DataMap.error_keys"
  parent: "signalwire.core.data_map.DataMap"
  module: "signalwire.core.data_map"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/data_map.py"
---
# `error_keys`

Set error keys for the most recent webhook (if webhooks exist) or top-level

## Signature

```python
error_keys(keys: List[str]) -> DataMap
```

## Parameters

| Name   | Type        | Required | Default | Description                                         |
| ------ | ----------- | -------- | ------- | --------------------------------------------------- |
| `keys` | `List[str]` | yes      | —       | List of JSON keys whose presence indicates an error |

## Returns

`DataMap` — Self for method chaining

## Source

[`/src/signalwire/signalwire/core/data_map.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/data_map.py)

Line 356.
