---
slug: "/reference/python/signalwire/cli/core/agent-loader"
title: "agent_loader"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "module"
  language: "python"
  qualified_name: "signalwire.cli.core.agent_loader"
  parent: "signalwire.cli.core"
  module: "signalwire.cli.core"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/core/agent_loader.py"
---
# `agent_loader`

Copyright (c) 2025 SignalWire

This file is part of the SignalWire SDK.

Licensed under the MIT License.
See LICENSE file in the project root for full license information.

## Signature

```python
module agent_loader
```

## Constants

| Name                     | Type                     | Required | Default | Description |
| ------------------------ | ------------------------ | -------- | ------- | ----------- |
| `AGENT_BASE_AVAILABLE`   | `AGENT_BASE_AVAILABLE`   | yes      | —       | —           |
| `NEW_LOADER_AVAILABLE`   | `NEW_LOADER_AVAILABLE`   | yes      | —       | —           |
| `SWML_SERVICE_AVAILABLE` | `SWML_SERVICE_AVAILABLE` | yes      | —       | —           |

## Functions

- [`discover_agents_in_file`](/reference/python/signalwire/cli/core/agent-loader/discover-agents-in-file) — Backward compatibility wrapper - discovers agents in a file
- [`discover_services_in_file`](/reference/python/signalwire/cli/core/agent-loader/discover-services-in-file) — Discover all available SWML services (including agents) in a Python file without instantiating them
- [`load_agent_from_file`](/reference/python/signalwire/cli/core/agent-loader/load-agent-from-file) — Load an agent from a Python file
- [`load_service_from_file`](/reference/python/signalwire/cli/core/agent-loader/load-service-from-file) — Load a SWML service from a Python file

## Source

[`/src/signalwire/signalwire/cli/core/agent_loader.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/core/agent_loader.py)
