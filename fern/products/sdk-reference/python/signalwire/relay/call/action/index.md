---
slug: "/reference/python/signalwire/relay/call/action"
title: "Action"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.relay.call.Action"
  parent: "signalwire.relay.call"
  module: "signalwire.relay.call"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py"
---
# `Action`

Base class for async action handles (play, record, detect, etc.).

Holds a control\_id and back-reference to the Call. Resolves when the
server sends a terminal event for this control\_id.

## Signature

```python
class Action
```

## Properties

| Name         | Type                   | Required | Default | Description |
| ------------ | ---------------------- | -------- | ------- | ----------- |
| `call`       | `call`                 | yes      | —       | —           |
| `completed`  | `completed`            | yes      | —       | —           |
| `control_id` | `control_id`           | yes      | —       | —           |
| `is_done`    | `bool`                 | yes      | —       | —           |
| `result`     | `Optional[RelayEvent]` | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/relay/call/action/init)
- [`wait`](/reference/python/signalwire/relay/call/action/wait) — Wait for the action to complete. Returns the terminal event.

## Source

[`/src/signalwire/signalwire/relay/call.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/call.py)

Line 43.
