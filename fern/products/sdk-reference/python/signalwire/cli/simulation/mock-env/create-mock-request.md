---
slug: "/reference/python/signalwire/cli/simulation/mock-env/create-mock-request"
title: "create_mock_request"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "function"
  language: "python"
  qualified_name: "signalwire.cli.simulation.mock_env.create_mock_request"
  parent: "signalwire.cli.simulation.mock_env"
  module: "signalwire.cli.simulation.mock_env"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/simulation/mock_env.py"
---
# `create_mock_request`

Factory function to create a mock FastAPI Request object

## Signature

```python
create_mock_request(
    method: str = 'POST',
    url: str = 'http://localhost:8080/swml',
    headers: Optional[Dict[str, str]] = None,
    query_params: Optional[Dict[str, str]] = None,
    body: Optional[Dict[str, Any]] = None
) -> MockRequest
```

## Parameters

| Name           | Type                       | Required | Default                        | Description |
| -------------- | -------------------------- | -------- | ------------------------------ | ----------- |
| `method`       | `str`                      | no       | `'POST'`                       | —           |
| `url`          | `str`                      | no       | `'http://localhost:8080/swml'` | —           |
| `headers`      | `Optional[Dict[str, str]]` | no       | `None`                         | —           |
| `query_params` | `Optional[Dict[str, str]]` | no       | `None`                         | —           |
| `body`         | `Optional[Dict[str, Any]]` | no       | `None`                         | —           |

## Returns

`MockRequest`

## Source

[`/src/signalwire/signalwire/cli/simulation/mock_env.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/simulation/mock_env.py)

Line 128.
