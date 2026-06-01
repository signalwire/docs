---
slug: "/reference/python/signalwire/cli/core/agent-loader/discover-services-in-file"
title: "discover_services_in_file"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "function"
  language: "python"
  qualified_name: "signalwire.cli.core.agent_loader.discover_services_in_file"
  parent: "signalwire.cli.core.agent_loader"
  module: "signalwire.cli.core.agent_loader"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/core/agent_loader.py"
---
# `discover_services_in_file`

Discover all available SWML services (including agents) in a Python file without instantiating them

## Signature

```python
discover_services_in_file(service_path: str) -> List[Dict[str, Any]]
```

## Parameters

| Name           | Type  | Required | Default | Description                                 |
| -------------- | ----- | -------- | ------- | ------------------------------------------- |
| `service_path` | `str` | yes      | —       | Path to the Python file containing services |

## Returns

`List[Dict[str, Any]]` — List of dictionaries with service information

## Throws

- `ImportError` — If the file cannot be imported
- `FileNotFoundError` — If the file doesn't exist

## Source

[`/src/signalwire/signalwire/cli/core/agent_loader.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/core/agent_loader.py)

Line 38.
