---
slug: "/reference/python/signalwire/core/function-result/function-result/swml-transfer"
title: "swml_transfer"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.function_result.FunctionResult.swml_transfer"
  parent: "signalwire.core.function_result.FunctionResult"
  module: "signalwire.core.function_result"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py"
---
# `swml_transfer`

Add a SWML transfer action with AI response setup for when transfer completes.

This is a virtual helper that generates SWML to transfer the call to another
destination and sets up an AI response for when the transfer completes and
control returns to the agent.

For transfers, you typically want to enable post-processing so the AI speaks
the response first before executing the transfer.

> \[!NOTE]
>
> # Permanent transfer (default)
>
> result = (
> FunctionResult("I'm transferring you to support", post\_process=True)
> .swml\_transfer(
> "https://support.example.com/swml",
> "Goodbye!"  # Won't be used since final=True by default
> )
> )
>
> # Temporary transfer with return
>
> result.swml\_transfer(
> dest,
> "The support call is complete. How else can I help?",
> final=False
> )

## Signature

```python
swml_transfer(dest: str, ai_response: str, final: bool = True) -> FunctionResult
```

## Parameters

| Name          | Type   | Required | Default | Description                                                                                                                          |
| ------------- | ------ | -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| `dest`        | `str`  | yes      | —       | Destination URL for the transfer (SWML endpoint, SIP address, etc.)                                                                  |
| `ai_response` | `str`  | yes      | —       | Message the AI should say when transfer completes and control returns                                                                |
| `final`       | `bool` | no       | `True`  | Whether this is a permanent transfer (True) or temporary (False). Defaults to True for permanent transfers (same as connect method). |

## Returns

`FunctionResult` — Self for method chaining

## Examples

```python
# Temporary transfer with return
result.swml_transfer(
    dest, 
    "The support call is complete. How else can I help?", 
    final=False
)
```

## Source

[`/src/signalwire/signalwire/core/function_result.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py)

Line 191.
