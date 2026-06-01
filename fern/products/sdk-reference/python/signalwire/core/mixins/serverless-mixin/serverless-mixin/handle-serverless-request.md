---
slug: "/reference/python/signalwire/core/mixins/serverless-mixin/serverless-mixin/handle-serverless-request"
title: "handle_serverless_request"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.mixins.serverless_mixin.ServerlessMixin.handle_serverless_request"
  parent: "signalwire.core.mixins.serverless_mixin.ServerlessMixin"
  module: "signalwire.core.mixins.serverless_mixin"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/serverless_mixin.py"
---
# `handle_serverless_request`

Handle serverless environment requests (CGI, Lambda, Cloud Functions)

## Signature

```python
handle_serverless_request(event = None, context = None, mode = None)
```

## Parameters

| Name      | Type | Required | Default | Description                                         |
| --------- | ---- | -------- | ------- | --------------------------------------------------- |
| `event`   | —    | no       | `None`  | Serverless event object (Lambda, Cloud Functions)   |
| `context` | —    | no       | `None`  | Serverless context object (Lambda, Cloud Functions) |
| `mode`    | —    | no       | `None`  | Override execution mode (from force\_mode in run()) |

## Returns

Response appropriate for the serverless platform

## Source

[`/src/signalwire/signalwire/core/mixins/serverless_mixin.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/serverless_mixin.py)

Line 28.
