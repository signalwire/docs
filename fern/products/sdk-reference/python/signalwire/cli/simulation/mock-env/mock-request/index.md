---
slug: "/reference/python/signalwire/cli/simulation/mock-env/mock-request"
title: "MockRequest"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.cli.simulation.mock_env.MockRequest"
  parent: "signalwire.cli.simulation.mock_env"
  module: "signalwire.cli.simulation.mock_env"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/simulation/mock_env.py"
---
# `MockRequest`

Mock FastAPI Request object for dynamic agent testing

## Signature

```python
class MockRequest
```

## Properties

| Name           | Type           | Required | Default | Description |
| -------------- | -------------- | -------- | ------- | ----------- |
| `headers`      | `headers`      | yes      | —       | —           |
| `method`       | `method`       | yes      | —       | —           |
| `query_params` | `query_params` | yes      | —       | —           |
| `state`        | `state`        | yes      | —       | —           |
| `url`          | `url`          | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/cli/simulation/mock-env/mock-request/init)
- [`body`](/reference/python/signalwire/cli/simulation/mock-env/mock-request/body) — Return the raw body bytes
- [`client`](/reference/python/signalwire/cli/simulation/mock-env/mock-request/client) — Mock client property
- [`json`](/reference/python/signalwire/cli/simulation/mock-env/mock-request/json) — Return the JSON body

## Source

[`/src/signalwire/signalwire/cli/simulation/mock_env.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/simulation/mock_env.py)

Line 100.
