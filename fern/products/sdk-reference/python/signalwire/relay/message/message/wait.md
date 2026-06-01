---
slug: "/reference/python/signalwire/relay/message/message/wait"
title: "wait"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.relay.message.Message.wait"
  parent: "signalwire.relay.message.Message"
  module: "signalwire.relay.message"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/message.py"
---
# `wait`

Block until the message reaches a terminal state.

Returns the terminal RelayEvent. Raises asyncio.TimeoutError if
timeout is specified and exceeded.

**Modifiers:** `async`

## Signature

```python
async wait(timeout: Optional[float] = None) -> RelayEvent
```

## Parameters

| Name      | Type              | Required | Default | Description |
| --------- | ----------------- | -------- | ------- | ----------- |
| `timeout` | `Optional[float]` | no       | `None`  | —           |

## Returns

`RelayEvent`

## Source

[`/src/signalwire/signalwire/relay/message.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/message.py)

Line 76.
