---
slug: "/reference/python/signalwire/core/function-result/function-result/rpc-ai-message"
title: "rpc_ai_message"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.function_result.FunctionResult.rpc_ai_message"
  parent: "signalwire.core.function_result.FunctionResult"
  module: "signalwire.core.function_result"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py"
---
# `rpc_ai_message`

Inject a message into an AI agent on another call using execute\_rpc.

This is useful for cross-call communication, such as notifying a held
caller's AI agent about a status change or instructing it to relay
a message.

> \[!NOTE]
> result = (
> FunctionResult("I'll let them know.")
> .rpc\_ai\_message(
> call\_id=original\_call\_id,
> message\_text="The person you were trying to reach is unavailable. Please take a message."
> )
> )

## Signature

```python
rpc_ai_message(
    call_id: str,
    message_text: str,
    role: str = 'system'
) -> FunctionResult
```

## Parameters

| Name           | Type  | Required | Default    | Description                                                      |
| -------------- | ----- | -------- | ---------- | ---------------------------------------------------------------- |
| `call_id`      | `str` | yes      | —          | The call ID of the target call                                   |
| `message_text` | `str` | yes      | —          | The message text to inject into the AI conversation              |
| `role`         | `str` | no       | `'system'` | The role for the message, typically "system" (default: "system") |

## Returns

`FunctionResult` — self for method chaining

## Source

[`/src/signalwire/signalwire/core/function_result.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py)

Line 1380.
