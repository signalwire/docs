---
slug: "/reference/python/signalwire/core/agent/tools/registry/tool-registry/define-tool"
title: "define_tool"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.agent.tools.registry.ToolRegistry.define_tool"
  parent: "signalwire.core.agent.tools.registry.ToolRegistry"
  module: "signalwire.core.agent.tools.registry"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/agent/tools/registry.py"
---
# `define_tool`

Define a SWAIG function that the AI can call.

## Signature

```python
define_tool(
    name: str,
    description: str,
    parameters: Dict[str, Any],
    handler: Callable,
    secure: bool = True,
    fillers: Optional[Dict[str, List[str]]] = None,
    wait_file: Optional[str] = None,
    wait_file_loops: Optional[int] = None,
    webhook_url: Optional[str] = None,
    required: Optional[List[str]] = None,
    is_typed_handler: bool = False,
    **swaig_fields = {}
) -> None
```

## Parameters

| Name               | Type                             | Required | Default | Description                                                                   |
| ------------------ | -------------------------------- | -------- | ------- | ----------------------------------------------------------------------------- |
| `name`             | `str`                            | yes      | —       | Function name (must be unique)                                                |
| `description`      | `str`                            | yes      | —       | Function description for the AI                                               |
| `parameters`       | `Dict[str, Any]`                 | yes      | —       | JSON Schema of parameters                                                     |
| `handler`          | `Callable`                       | yes      | —       | Function to call when invoked                                                 |
| `secure`           | `bool`                           | no       | `True`  | Whether to require token validation                                           |
| `fillers`          | `Optional[Dict[str, List[str]]]` | no       | `None`  | Optional dict mapping language codes to arrays of filler phrases (deprecated) |
| `wait_file`        | `Optional[str]`                  | no       | `None`  | Optional URL to audio file to play while function executes                    |
| `wait_file_loops`  | `Optional[int]`                  | no       | `None`  | Optional number of times to loop the wait\_file                               |
| `webhook_url`      | `Optional[str]`                  | no       | `None`  | Optional external webhook URL to use instead of local handling                |
| `required`         | `Optional[List[str]]`            | no       | `None`  | Optional list of required parameter names                                     |
| `is_typed_handler` | `bool`                           | no       | `False` | Whether the handler uses type-hinted parameters                               |
| `...swaig_fields`  | —                                | no       | `{}`    | —                                                                             |

## Returns

`None`

## Throws

- `ValueError` — If tool name already exists

## Source

[`/src/signalwire/signalwire/core/agent/tools/registry.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/agent/tools/registry.py)

Line 35.
