---
slug: "/reference/python/signalwire/core/swml-service/swml-service/serve"
title: "serve"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.swml_service.SWMLService.serve"
  parent: "signalwire.core.swml_service.SWMLService"
  module: "signalwire.core.swml_service"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_service.py"
---
# `serve`

Start a web server for this service

## Signature

```python
serve(
    host: Optional[str] = None,
    port: Optional[int] = None,
    ssl_cert: Optional[str] = None,
    ssl_key: Optional[str] = None,
    ssl_enabled: Optional[bool] = None,
    domain: Optional[str] = None
) -> None
```

## Parameters

| Name          | Type             | Required | Default | Description                             |
| ------------- | ---------------- | -------- | ------- | --------------------------------------- |
| `host`        | `Optional[str]`  | no       | `None`  | Host to bind to (defaults to self.host) |
| `port`        | `Optional[int]`  | no       | `None`  | Port to bind to (defaults to self.port) |
| `ssl_cert`    | `Optional[str]`  | no       | `None`  | Path to SSL certificate file            |
| `ssl_key`     | `Optional[str]`  | no       | `None`  | Path to SSL key file                    |
| `ssl_enabled` | `Optional[bool]` | no       | `None`  | Whether to enable SSL                   |
| `domain`      | `Optional[str]`  | no       | `None`  | Domain name for SSL certificate         |

## Returns

`None`

## Source

[`/src/signalwire/signalwire/core/swml_service.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_service.py)

Line 957.
