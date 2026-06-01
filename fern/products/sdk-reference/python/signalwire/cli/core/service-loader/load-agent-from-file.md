---
slug: "/reference/python/signalwire/cli/core/service-loader/load-agent-from-file"
title: "load_agent_from_file"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "function"
  language: "python"
  qualified_name: "signalwire.cli.core.service_loader.load_agent_from_file"
  parent: "signalwire.cli.core.service_loader"
  module: "signalwire.cli.core.service_loader"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/core/service_loader.py"
---
# `load_agent_from_file`

Backward compatibility wrapper

Note: This still uses the direct extraction approach for compatibility

## Signature

```python
load_agent_from_file(
    agent_path: str,
    agent_class_name: Optional[str] = None,
    suppress_output: bool = False
) -> AgentBase
```

## Parameters

| Name               | Type            | Required | Default | Description |
| ------------------ | --------------- | -------- | ------- | ----------- |
| `agent_path`       | `str`           | yes      | —       | —           |
| `agent_class_name` | `Optional[str]` | no       | `None`  | —           |
| `suppress_output`  | `bool`          | no       | `False` | —           |

## Returns

`AgentBase`

## Source

[`/src/signalwire/signalwire/cli/core/service_loader.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/core/service_loader.py)

Line 253.
