---
slug: "/reference/python/signalwire/prefabs/info-gatherer/info-gatherer-agent/on-swml-request"
title: "on_swml_request"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.prefabs.info_gatherer.InfoGathererAgent.on_swml_request"
  parent: "signalwire.prefabs.info_gatherer.InfoGathererAgent"
  module: "signalwire.prefabs.info_gatherer"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/prefabs/info_gatherer.py"
---
# `on_swml_request`

Handle dynamic configuration using the callback function

This method is called when SWML is requested and allows us to configure
the agent just-in-time using the provided callback.

## Signature

```python
on_swml_request(request_data = None, callback_path = None, request = None)
```

## Parameters

| Name            | Type | Required | Default | Description |
| --------------- | ---- | -------- | ------- | ----------- |
| `request_data`  | —    | no       | `None`  | —           |
| `callback_path` | —    | no       | `None`  | —           |
| `request`       | —    | no       | `None`  | —           |

## Source

[`/src/signalwire/signalwire/prefabs/info_gatherer.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/prefabs/info_gatherer.py)

Line 158.
