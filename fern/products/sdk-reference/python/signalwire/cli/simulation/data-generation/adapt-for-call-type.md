---
slug: "/reference/python/signalwire/cli/simulation/data-generation/adapt-for-call-type"
title: "adapt_for_call_type"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "function"
  language: "python"
  qualified_name: "signalwire.cli.simulation.data_generation.adapt_for_call_type"
  parent: "signalwire.cli.simulation.data_generation"
  module: "signalwire.cli.simulation.data_generation"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/simulation/data_generation.py"
---
# `adapt_for_call_type`

Adapt call data structure based on call type (sip vs webrtc)

## Signature

```python
adapt_for_call_type(call_data: Dict[str, Any], call_type: str) -> Dict[str, Any]
```

## Parameters

| Name        | Type             | Required | Default | Description              |
| ----------- | ---------------- | -------- | ------- | ------------------------ |
| `call_data` | `Dict[str, Any]` | yes      | —       | Base call data structure |
| `call_type` | `str`            | yes      | —       | "sip" or "webrtc"        |

## Returns

`Dict[str, Any]` — Adapted call data with appropriate addresses and metadata

## Source

[`/src/signalwire/signalwire/cli/simulation/data_generation.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/simulation/data_generation.py)

Line 48.
