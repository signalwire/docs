---
slug: "/reference/python/signalwire/cli/core/service-loader"
title: "service_loader"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "module"
  language: "python"
  qualified_name: "signalwire.cli.core.service_loader"
  parent: "signalwire.cli.core"
  module: "signalwire.cli.core"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/core/service_loader.py"
---
# `service_loader`

Copyright (c) 2025 SignalWire

This file is part of the SignalWire SDK.

Licensed under the MIT License.
See LICENSE file in the project root for full license information.

## Signature

```python
module service_loader
```

## Constants

| Name                     | Type                     | Required | Default | Description |
| ------------------------ | ------------------------ | -------- | ------- | ----------- |
| `DEPENDENCIES_AVAILABLE` | `DEPENDENCIES_AVAILABLE` | yes      | —       | —           |

## Functions

- [`discover_agents_in_file`](/reference/python/signalwire/cli/core/service-loader/discover-agents-in-file) — Backward compatibility wrapper
- [`load_agent_from_file`](/reference/python/signalwire/cli/core/service-loader/load-agent-from-file) — Backward compatibility wrapper
- [`load_and_simulate_service`](/reference/python/signalwire/cli/core/service-loader/load-and-simulate-service) — Load a service file and simulate a request to it
- [`simulate_request_to_service`](/reference/python/signalwire/cli/core/service-loader/simulate-request-to-service) — Simulate a request to a SWMLService instance

## Classes

- [`ServiceCapture`](/reference/python/signalwire/cli/core/service-loader/service-capture) — Captures SWMLService instances when they try to run/serve

## Source

[`/src/signalwire/signalwire/cli/core/service_loader.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/core/service_loader.py)
