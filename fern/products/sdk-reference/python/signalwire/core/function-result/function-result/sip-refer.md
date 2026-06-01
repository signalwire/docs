---
slug: "/reference/python/signalwire/core/function-result/function-result/sip-refer"
title: "sip_refer"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.function_result.FunctionResult.sip_refer"
  parent: "signalwire.core.function_result.FunctionResult"
  module: "signalwire.core.function_result"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py"
---
# `sip_refer`

Send SIP REFER to a SIP call using SWML.

This is a virtual helper that generates SWML to send a SIP REFER
message, which is used for call transfer in SIP environments.

## Signature

```python
sip_refer(to_uri: str) -> FunctionResult
```

## Parameters

| Name     | Type  | Required | Default | Description                                 |
| -------- | ----- | -------- | ------- | ------------------------------------------- |
| `to_uri` | `str` | yes      | —       | The SIP URI to send the REFER to (required) |

## Returns

`FunctionResult` — self for method chaining

## Source

[`/src/signalwire/signalwire/core/function_result.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py)

Line 1017.
