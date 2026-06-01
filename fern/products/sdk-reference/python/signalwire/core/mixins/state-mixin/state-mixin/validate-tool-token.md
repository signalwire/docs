---
slug: "/reference/python/signalwire/core/mixins/state-mixin/state-mixin/validate-tool-token"
title: "validate_tool_token"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.mixins.state_mixin.StateMixin.validate_tool_token"
  parent: "signalwire.core.mixins.state_mixin.StateMixin"
  module: "signalwire.core.mixins.state_mixin"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/state_mixin.py"
---
# `validate_tool_token`

Validate a tool token

## Signature

```python
validate_tool_token(function_name: str, token: str, call_id: str) -> bool
```

## Parameters

| Name            | Type  | Required | Default | Description               |
| --------------- | ----- | -------- | ------- | ------------------------- |
| `function_name` | `str` | yes      | —       | Name of the function/tool |
| `token`         | `str` | yes      | —       | Token to validate         |
| `call_id`       | `str` | yes      | —       | Call ID for the session   |

## Returns

`bool` — True if token is valid, False otherwise

## Source

[`/src/signalwire/signalwire/core/mixins/state_mixin.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/state_mixin.py)

Line 43.
