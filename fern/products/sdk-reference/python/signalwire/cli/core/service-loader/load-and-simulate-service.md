---
slug: "/reference/python/signalwire/cli/core/service-loader/load-and-simulate-service"
title: "load_and_simulate_service"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "function"
  language: "python"
  qualified_name: "signalwire.cli.core.service_loader.load_and_simulate_service"
  parent: "signalwire.cli.core.service_loader"
  module: "signalwire.cli.core.service_loader"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/core/service_loader.py"
---
# `load_and_simulate_service`

Load a service file and simulate a request to it

This is the main entry point that combines loading and request simulation

## Signature

```python
load_and_simulate_service(
    service_path: str,
    route: Optional[str] = None,
    method: str = 'POST',
    body: Optional[dict] = None,
    query_params: Optional[dict] = None,
    headers: Optional[dict] = None,
    suppress_output: bool = False
) -> dict
```

## Parameters

| Name              | Type             | Required | Default  | Description                                         |
| ----------------- | ---------------- | -------- | -------- | --------------------------------------------------- |
| `service_path`    | `str`            | yes      | —        | Path to the service file                            |
| `route`           | `Optional[str]`  | no       | `None`   | Optional route to request (for multi-service files) |
| `method`          | `str`            | no       | `'POST'` | HTTP method                                         |
| `body`            | `Optional[dict]` | no       | `None`   | Request body                                        |
| `query_params`    | `Optional[dict]` | no       | `None`   | Query parameters                                    |
| `headers`         | `Optional[dict]` | no       | `None`   | Request headers                                     |
| `suppress_output` | `bool`           | no       | `False`  | —                                                   |

## Returns

`dict` — The service's response

## Source

[`/src/signalwire/signalwire/cli/core/service_loader.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/core/service_loader.py)

Line 183.
