---
slug: "/reference/python/signalwire/core/mixins/web-mixin/web-mixin/run"
title: "run"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.mixins.web_mixin.WebMixin.run"
  parent: "signalwire.core.mixins.web_mixin.WebMixin"
  module: "signalwire.core.mixins.web_mixin"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/web_mixin.py"
---
# `run`

Smart run method that automatically detects environment and handles accordingly

## Signature

```python
run(
    event = None,
    context = None,
    force_mode = None,
    host: Optional[str] = None,
    port: Optional[int] = None
)
```

## Parameters

| Name         | Type            | Required | Default | Description                                         |
| ------------ | --------------- | -------- | ------- | --------------------------------------------------- |
| `event`      | —               | no       | `None`  | Serverless event object (Lambda, Cloud Functions)   |
| `context`    | —               | no       | `None`  | Serverless context object (Lambda, Cloud Functions) |
| `force_mode` | —               | no       | `None`  | Override automatic mode detection for testing       |
| `host`       | `Optional[str]` | no       | `None`  | Host override for server mode                       |
| `port`       | `Optional[int]` | no       | `None`  | Port override for server mode                       |

## Returns

Response for serverless modes, None for server mode

## Source

[`/src/signalwire/signalwire/core/mixins/web_mixin.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/web_mixin.py)

Line 305.
