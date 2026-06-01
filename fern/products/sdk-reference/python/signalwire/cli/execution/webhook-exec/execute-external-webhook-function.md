---
slug: "/reference/python/signalwire/cli/execution/webhook-exec/execute-external-webhook-function"
title: "execute_external_webhook_function"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "function"
  language: "python"
  qualified_name: "signalwire.cli.execution.webhook_exec.execute_external_webhook_function"
  parent: "signalwire.cli.execution.webhook_exec"
  module: "signalwire.cli.execution.webhook_exec"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/execution/webhook_exec.py"
---
# `execute_external_webhook_function`

Execute an external webhook SWAIG function by making an HTTP request to the external service.
This simulates what SignalWire would do when calling an external webhook function.

## Signature

```python
execute_external_webhook_function(
    func: SWAIGFunction,
    function_name: str,
    function_args: Dict[str, Any],
    post_data: Dict[str, Any],
    verbose: bool = False
) -> Dict[str, Any]
```

## Parameters

| Name            | Type             | Required | Default | Description                                |
| --------------- | ---------------- | -------- | ------- | ------------------------------------------ |
| `func`          | `SWAIGFunction`  | yes      | —       | The SWAIGFunction object with webhook\_url |
| `function_name` | `str`            | yes      | —       | Name of the function being called          |
| `function_args` | `Dict[str, Any]` | yes      | —       | Parsed function arguments                  |
| `post_data`     | `Dict[str, Any]` | yes      | —       | Complete post data to send to the webhook  |
| `verbose`       | `bool`           | no       | `False` | Whether to show verbose output             |

## Returns

`Dict[str, Any]` — Response from the external webhook service

## Source

[`/src/signalwire/signalwire/cli/execution/webhook_exec.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/execution/webhook_exec.py)

Line 24.
