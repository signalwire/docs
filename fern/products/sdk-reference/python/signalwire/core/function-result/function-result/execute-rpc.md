---
slug: "/reference/python/signalwire/core/function-result/function-result/execute-rpc"
title: "execute_rpc"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.function_result.FunctionResult.execute_rpc"
  parent: "signalwire.core.function_result.FunctionResult"
  module: "signalwire.core.function_result"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py"
---
# `execute_rpc`

Execute an RPC method on a call using SWML.

This is a generic helper for executing RPC commands. For common operations,
consider using the specific helpers: rpc\_dial(), rpc\_ai\_message(), rpc\_ai\_unhold().

> \[!NOTE]
> result = (
> FunctionResult("Executing RPC")
> .execute\_rpc(
> method="ai\_message",
> call\_id="some-call-id",
> params={"role": "system", "message\_text": "Hello"}
> )
> )

## Signature

```python
execute_rpc(
    method: str,
    params: Optional[Dict[str, Any]] = None,
    call_id: Optional[str] = None,
    node_id: Optional[str] = None
) -> FunctionResult
```

## Parameters

| Name      | Type                       | Required | Default | Description                                                           |
| --------- | -------------------------- | -------- | ------- | --------------------------------------------------------------------- |
| `method`  | `str`                      | yes      | —       | The RPC method to execute (e.g., "dial", "ai\_message", "ai\_unhold") |
| `params`  | `Optional[Dict[str, Any]]` | no       | `None`  | Parameters for the RPC method (optional)                              |
| `call_id` | `Optional[str]`            | no       | `None`  | Target call ID for the RPC (optional)                                 |
| `node_id` | `Optional[str]`            | no       | `None`  | Target node ID for the RPC (optional)                                 |

## Returns

`FunctionResult` — self for method chaining

## Source

[`/src/signalwire/signalwire/core/function_result.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py)

Line 1287.
