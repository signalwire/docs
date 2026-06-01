---
slug: "/reference/python/signalwire/cli/simulation/mock-env/serverless-simulator"
title: "ServerlessSimulator"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.cli.simulation.mock_env.ServerlessSimulator"
  parent: "signalwire.cli.simulation.mock_env"
  module: "signalwire.cli.simulation.mock_env"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/simulation/mock_env.py"
---
# `ServerlessSimulator`

Manages serverless environment simulation for different platforms

## Signature

```python
class ServerlessSimulator
```

## Properties

| Name               | Type               | Required | Default | Description |
| ------------------ | ------------------ | -------- | ------- | ----------- |
| `active`           | `active`           | yes      | —       | —           |
| `original_env`     | `original_env`     | yes      | —       | —           |
| `overrides`        | `overrides`        | yes      | —       | —           |
| `platform`         | `platform`         | yes      | —       | —           |
| `PLATFORM_PRESETS` | `PLATFORM_PRESETS` | yes      | —       | —           |
| `preset_env`       | `preset_env`       | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/cli/simulation/mock-env/serverless-simulator/init)
- [`activate`](/reference/python/signalwire/cli/simulation/mock-env/serverless-simulator/activate) — Apply serverless environment simulation
- [`add_override`](/reference/python/signalwire/cli/simulation/mock-env/serverless-simulator/add-override) — Add an environment variable override
- [`deactivate`](/reference/python/signalwire/cli/simulation/mock-env/serverless-simulator/deactivate) — Restore original environment
- [`get_current_env`](/reference/python/signalwire/cli/simulation/mock-env/serverless-simulator/get-current-env) — Get the current environment that would be applied

## Source

[`/src/signalwire/signalwire/cli/simulation/mock_env.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/simulation/mock_env.py)

Line 139.
