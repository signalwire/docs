---
slug: "/reference/python/signalwire/relay/call/call/echo"
title: "echo"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.relay.call.Call.echo"
  parent: "signalwire.relay.call.Call"
  module: "signalwire.relay.call"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py"
---
# `echo`

Echo audio back to the caller (useful for testing).

**Modifiers:** `async`

## Signature

```python
async echo(
    *,
    timeout: Optional[float] = None,
    status_url: Optional[str] = None,
    **kwargs: Any = {}
) -> dict
```

## Parameters

| Name         | Type              | Required | Default | Description |
| ------------ | ----------------- | -------- | ------- | ----------- |
| `timeout`    | `Optional[float]` | no       | `None`  | —           |
| `status_url` | `Optional[str]`   | no       | `None`  | —           |
| `...kwargs`  | `Any`             | no       | `{}`    | —           |

## Returns

`dict`

## Source

[`/src/signalwire/signalwire/relay/call.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py)

Line 1007.
