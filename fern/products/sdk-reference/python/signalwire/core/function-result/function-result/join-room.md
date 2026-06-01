---
slug: "/reference/python/signalwire/core/function-result/function-result/join-room"
title: "join_room"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.function_result.FunctionResult.join_room"
  parent: "signalwire.core.function_result.FunctionResult"
  module: "signalwire.core.function_result"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py"
---
# `join_room`

Join a RELAY room using SWML.

This is a virtual helper that generates SWML to join a RELAY room,
which enables multi-party communication and collaboration.

## Signature

```python
join_room(name: str) -> FunctionResult
```

## Parameters

| Name   | Type  | Required | Default | Description                             |
| ------ | ----- | -------- | ------- | --------------------------------------- |
| `name` | `str` | yes      | —       | The name of the room to join (required) |

## Returns

`FunctionResult` — self for method chaining

## Source

[`/src/signalwire/signalwire/core/function_result.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py)

Line 988.
