---
slug: "/reference/python/signalwire/cli/core/service-loader/simulate-request-to-service"
title: "simulate_request_to_service"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "function"
  language: "python"
  qualified_name: "signalwire.cli.core.service_loader.simulate_request_to_service"
  parent: "signalwire.cli.core.service_loader"
  module: "signalwire.cli.core.service_loader"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/core/service_loader.py"
---
# `simulate_request_to_service`

Simulate a request to a SWMLService instance

**Modifiers:** `async`

## Signature

```python
async simulate_request_to_service(
    service: SWMLService,
    method: str = 'POST',
    body: Optional[dict] = None,
    query_params: Optional[dict] = None,
    headers: Optional[dict] = None
) -> dict
```

## Parameters

| Name           | Type             | Required | Default  | Description                    |
| -------------- | ---------------- | -------- | -------- | ------------------------------ |
| `service`      | `SWMLService`    | yes      | —        | The SWMLService instance       |
| `method`       | `str`            | no       | `'POST'` | HTTP method (GET or POST)      |
| `body`         | `Optional[dict]` | no       | `None`   | Request body for POST requests |
| `query_params` | `Optional[dict]` | no       | `None`   | Query parameters               |
| `headers`      | `Optional[dict]` | no       | `None`   | Request headers                |

## Returns

`dict` — The service's response as a dict

## Source

[`/src/signalwire/signalwire/cli/core/service_loader.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/core/service_loader.py)

Line 135.
