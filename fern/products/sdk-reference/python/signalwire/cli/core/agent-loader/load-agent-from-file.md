---
slug: "/reference/python/signalwire/cli/core/agent-loader/load-agent-from-file"
title: "load_agent_from_file"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "function"
  language: "python"
  qualified_name: "signalwire.cli.core.agent_loader.load_agent_from_file"
  parent: "signalwire.cli.core.agent_loader"
  module: "signalwire.cli.core.agent_loader"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/core/agent_loader.py"
---
# `load_agent_from_file`

Load an agent from a Python file

## Signature

```python
load_agent_from_file(
    agent_path: str,
    agent_class_name: Optional[str] = None
) -> AgentBase
```

## Parameters

| Name               | Type            | Required | Default | Description                                     |
| ------------------ | --------------- | -------- | ------- | ----------------------------------------------- |
| `agent_path`       | `str`           | yes      | —       | Path to the Python file containing the agent    |
| `agent_class_name` | `Optional[str]` | no       | `None`  | Optional name of the agent class to instantiate |

## Returns

`AgentBase` — AgentBase instance

## Throws

- `ImportError` — If the file cannot be imported
- `ValueError` — If no agent is found in the file

## Source

[`/src/signalwire/signalwire/cli/core/agent_loader.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/core/agent_loader.py)

Line 193.
