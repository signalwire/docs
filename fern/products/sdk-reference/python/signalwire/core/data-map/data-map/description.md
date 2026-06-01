---
slug: "/reference/python/signalwire/core/data-map/data-map/description"
title: "description"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.data_map.DataMap.description"
  parent: "signalwire.core.data_map.DataMap"
  module: "signalwire.core.data_map"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/data_map.py"
---
# `description`

Set the function description (alias for purpose).

See purpose() for guidance on writing description text the LLM
can act on.

## Signature

```python
description(description: str) -> DataMap
```

## Parameters

| Name          | Type  | Required | Default | Description                                                           |
| ------------- | ----- | -------- | ------- | --------------------------------------------------------------------- |
| `description` | `str` | yes      | —       | LLM-facing description of what this function does and when to use it. |

## Returns

`DataMap` — Self for method chaining.

## Source

[`/src/signalwire/signalwire/core/data_map.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/data_map.py)

Line 110.
