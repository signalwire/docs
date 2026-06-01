---
slug: "/reference/python/signalwire/cli/core/agent-loader/load-service-from-file"
title: "load_service_from_file"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "function"
  language: "python"
  qualified_name: "signalwire.cli.core.agent_loader.load_service_from_file"
  parent: "signalwire.cli.core.agent_loader"
  module: "signalwire.cli.core.agent_loader"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/core/agent_loader.py"
---
# `load_service_from_file`

Load a SWML service from a Python file

## Signature

```python
load_service_from_file(
    service_path: str,
    service_identifier: Optional[str] = None,
    prefer_route: bool = True
) -> SWMLService
```

## Parameters

| Name                 | Type            | Required | Default | Description                                                   |
| -------------------- | --------------- | -------- | ------- | ------------------------------------------------------------- |
| `service_path`       | `str`           | yes      | —       | Path to the Python file containing the service                |
| `service_identifier` | `Optional[str]` | no       | `None`  | Optional service identifier - can be class name or route      |
| `prefer_route`       | `bool`          | no       | `True`  | If True, interpret identifier as route first, then class name |

## Returns

`SWMLService` — SWMLService instance (could be AgentBase or basic SWMLService)

## Throws

- `ImportError` — If the file cannot be imported
- `ValueError` — If no service is found in the file

## Source

[`/src/signalwire/signalwire/cli/core/agent_loader.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/core/agent_loader.py)

Line 170.
