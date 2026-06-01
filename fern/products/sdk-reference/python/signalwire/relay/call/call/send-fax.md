---
slug: "/reference/python/signalwire/relay/call/call/send-fax"
title: "send_fax"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.relay.call.Call.send_fax"
  parent: "signalwire.relay.call.Call"
  module: "signalwire.relay.call"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py"
---
# `send_fax`

Send a fax document. Returns a FaxAction.

**Modifiers:** `async`

## Signature

```python
async send_fax(
    document: str,
    *,
    identity: Optional[str] = None,
    header_info: Optional[str] = None,
    control_id: Optional[str] = None,
    on_completed: Optional[Callable[RelayEvent, Any]] = None,
    **kwargs: Any = {}
) -> FaxAction
```

## Parameters

| Name           | Type                                  | Required | Default | Description |
| -------------- | ------------------------------------- | -------- | ------- | ----------- |
| `document`     | `str`                                 | yes      | —       | —           |
| `identity`     | `Optional[str]`                       | no       | `None`  | —           |
| `header_info`  | `Optional[str]`                       | no       | `None`  | —           |
| `control_id`   | `Optional[str]`                       | no       | `None`  | —           |
| `on_completed` | `Optional[Callable[RelayEvent, Any]]` | no       | `None`  | —           |
| `...kwargs`    | `Any`                                 | no       | `{}`    | —           |

## Returns

`FaxAction`

## Source

[`/src/signalwire/signalwire/relay/call.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py)

Line 767.
