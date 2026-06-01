---
slug: "/reference/python/signalwire/core/function-result/function-result/swml-change-context"
title: "swml_change_context"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.function_result.FunctionResult.swml_change_context"
  parent: "signalwire.core.function_result.FunctionResult"
  module: "signalwire.core.function_result"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py"
---
# `swml_change_context`

Force the conversation into a different context.

Webhook-triggered context changes bypass any `valid_contexts` clamp.
Step state resets (cur\_step = 0) on entry. The new context's first
step's instructions are injected on the next turn.

## Communicating intent to the destination context

Same pattern as swml\_change\_step: the model reads your FunctionResult's
`response` text as the tool result before it sees the destination
context's first step. Put your reason there:

```
FunctionResult(
    "I'm transferring you to billing because your question is "
    "about an invoice charge."
).swml_change_context("billing")
```

For structured carry-over, use update\_global\_data() and reference the
values via ${var} expansion in the destination context's step text.

Note that conversation history is preserved across context switches
unless the destination context is marked `isolated=True`. The model
retains everything the user said in the previous context — you do
not need to re-state it.

> \[!NOTE]
> result = (
> FunctionResult("Transferring you to technical support.")
> .update\_global\_data({"original\_issue": user\_problem})
> .swml\_change\_context("technical\_support")
> )

## Signature

```python
swml_change_context(context_name: str) -> FunctionResult
```

## Parameters

| Name           | Type  | Required | Default | Description                                                              |
| -------------- | ----- | -------- | ------- | ------------------------------------------------------------------------ |
| `context_name` | `str` | yes      | —       | Name of the context to switch to. Must exist in the agent's context map. |

## Returns

`FunctionResult` — Self for method chaining.

## Examples

```python
FunctionResult(
    "I'm transferring you to billing because your question is "
    "about an invoice charge."
).swml_change_context("billing")
```

## Source

[`/src/signalwire/signalwire/core/function_result.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py)

Line 353.
