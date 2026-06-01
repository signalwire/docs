---
slug: "/reference/python/signalwire/core/mixins/tool-mixin/tool-mixin/on-function-call"
title: "on_function_call"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.mixins.tool_mixin.ToolMixin.on_function_call"
  parent: "signalwire.core.mixins.tool_mixin.ToolMixin"
  module: "signalwire.core.mixins.tool_mixin"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/tool_mixin.py"
---
# `on_function_call`

Called when a SWAIG function is invoked

## Signature

```python
on_function_call(
    name: str,
    args: Dict[str, Any],
    raw_data: Optional[Dict[str, Any]] = None
) -> Any
```

## Parameters

| Name       | Type                       | Required | Default | Description        |
| ---------- | -------------------------- | -------- | ------- | ------------------ |
| `name`     | `str`                      | yes      | —       | Function name      |
| `args`     | `Dict[str, Any]`           | yes      | —       | Function arguments |
| `raw_data` | `Optional[Dict[str, Any]]` | no       | `None`  | Raw request data   |

## Returns

`Any` — Function result

## Source

[`/src/signalwire/signalwire/core/mixins/tool_mixin.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/tool_mixin.py)

Line 219.
