---
slug: "/reference/python/signalwire/cli/core/service-loader/service-capture"
title: "ServiceCapture"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.cli.core.service_loader.ServiceCapture"
  parent: "signalwire.cli.core.service_loader"
  module: "signalwire.cli.core.service_loader"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/core/service_loader.py"
---
# `ServiceCapture`

Captures SWMLService instances when they try to run/serve

## Signature

```python
class ServiceCapture
```

## Properties

| Name                | Type                | Required | Default | Description |
| ------------------- | ------------------- | -------- | ------- | ----------- |
| `captured_services` | `List[SWMLService]` | yes      | —       | —           |
| `original_methods`  | `original_methods`  | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/cli/core/service-loader/service-capture/init)
- [`capture`](/reference/python/signalwire/cli/core/service-loader/service-capture/capture) — Execute a service file and capture any services that try to run

## Source

[`/src/signalwire/signalwire/cli/core/service_loader.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/core/service_loader.py)

Line 37.
