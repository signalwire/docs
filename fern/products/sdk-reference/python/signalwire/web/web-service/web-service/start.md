---
slug: "/reference/python/signalwire/web/web-service/web-service/start"
title: "start"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.web.web_service.WebService.start"
  parent: "signalwire.web.web_service.WebService"
  module: "signalwire.web.web_service"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/web/web_service.py"
---
# `start`

Start the service with optional HTTPS support

## Signature

```python
start(
    host: str = '0.0.0.0',
    port: Optional[int] = None,
    ssl_cert: Optional[str] = None,
    ssl_key: Optional[str] = None
)
```

## Parameters

| Name       | Type            | Required | Default     | Description                                          |
| ---------- | --------------- | -------- | ----------- | ---------------------------------------------------- |
| `host`     | `str`           | no       | `'0.0.0.0'` | Host to bind to (default: "0.0.0.0")                 |
| `port`     | `Optional[int]` | no       | `None`      | Port to bind to (default: self.port)                 |
| `ssl_cert` | `Optional[str]` | no       | `None`      | Path to SSL certificate file (overrides environment) |
| `ssl_key`  | `Optional[str]` | no       | `None`      | Path to SSL key file (overrides environment)         |

## Source

[`/src/signalwire/signalwire/web/web_service.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/web/web_service.py)

Line 501.
