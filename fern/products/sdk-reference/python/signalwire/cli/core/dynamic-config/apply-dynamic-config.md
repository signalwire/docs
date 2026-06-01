---
slug: "/reference/python/signalwire/cli/core/dynamic-config/apply-dynamic-config"
title: "apply_dynamic_config"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "function"
  language: "python"
  qualified_name: "signalwire.cli.core.dynamic_config.apply_dynamic_config"
  parent: "signalwire.cli.core.dynamic_config"
  module: "signalwire.cli.core.dynamic_config"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/core/dynamic_config.py"
---
# `apply_dynamic_config`

Apply dynamic configuration callback if the agent has one

## Signature

```python
apply_dynamic_config(
    agent: AgentBase,
    mock_request: Optional[MockRequest] = None,
    verbose: bool = False
) -> None
```

## Parameters

| Name           | Type                    | Required | Default | Description                     |
| -------------- | ----------------------- | -------- | ------- | ------------------------------- |
| `agent`        | `AgentBase`             | yes      | —       | The agent instance              |
| `mock_request` | `Optional[MockRequest]` | no       | `None`  | Optional mock request object    |
| `verbose`      | `bool`                  | no       | `False` | Whether to print verbose output |

## Returns

`None`

## Source

[`/src/signalwire/signalwire/cli/core/dynamic_config.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/core/dynamic_config.py)

Line 22.
