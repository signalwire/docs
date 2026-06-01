---
slug: "/reference/python/signalwire/web/web-service/web-service"
title: "WebService"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.web.web_service.WebService"
  parent: "signalwire.web.web_service"
  module: "signalwire.web.web_service"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/web/web_service.py"
---
# `WebService`

Static file serving service with HTTP API

## Signature

```python
class WebService
```

## Properties

| Name                        | Type                        | Required | Default | Description |
| --------------------------- | --------------------------- | -------- | ------- | ----------- |
| `allowed_extensions`        | `allowed_extensions`        | yes      | —       | —           |
| `app`                       | `app`                       | yes      | —       | —           |
| `blocked_extensions`        | `blocked_extensions`        | yes      | —       | —           |
| `directories`               | `directories`               | yes      | —       | —           |
| `enable_cors`               | `enable_cors`               | yes      | —       | —           |
| `enable_directory_browsing` | `enable_directory_browsing` | yes      | —       | —           |
| `max_file_size`             | `max_file_size`             | yes      | —       | —           |
| `port`                      | `port`                      | yes      | —       | —           |
| `security`                  | `security`                  | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/web/web-service/web-service/init) — Initialize WebService
- [`add_directory`](/reference/python/signalwire/web/web-service/web-service/add-directory) — Add a new directory to serve
- [`remove_directory`](/reference/python/signalwire/web/web-service/web-service/remove-directory) — Remove a directory from being served
- [`start`](/reference/python/signalwire/web/web-service/web-service/start) — Start the service with optional HTTPS support
- [`stop`](/reference/python/signalwire/web/web-service/web-service/stop) — Stop the service (placeholder for cleanup)

## Source

[`/src/signalwire/signalwire/web/web_service.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/web/web_service.py)

Line 41.
