---
slug: "/reference/python/signalwire/web/web-service/web-service/init"
title: "__init__"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.web.web_service.WebService.__init__"
  parent: "signalwire.web.web_service.WebService"
  module: "signalwire.web.web_service"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/web/web_service.py"
---
# `__init__`

Initialize WebService

## Signature

```python
__init__(
    port: int = 8002,
    directories: Dict[str, str] = None,
    basic_auth: Optional[Tuple[str, str]] = None,
    config_file: Optional[str] = None,
    enable_directory_browsing: bool = False,
    allowed_extensions: Optional[list] = None,
    blocked_extensions: Optional[list] = None,
    max_file_size: int = 100 * 1024 * 1024,
    enable_cors: bool = True
)
```

## Parameters

| Name                        | Type                        | Required | Default           | Description                                                |
| --------------------------- | --------------------------- | -------- | ----------------- | ---------------------------------------------------------- |
| `port`                      | `int`                       | no       | `8002`            | Port to bind to (default: 8002)                            |
| `directories`               | `Dict[str, str]`            | no       | `None`            | Dict mapping URL paths to local directories                |
| `basic_auth`                | `Optional[Tuple[str, str]]` | no       | `None`            | Optional tuple of (username, password)                     |
| `config_file`               | `Optional[str]`             | no       | `None`            | Optional configuration file path                           |
| `enable_directory_browsing` | `bool`                      | no       | `False`           | Allow directory listing                                    |
| `allowed_extensions`        | `Optional[list]`            | no       | `None`            | List of allowed file extensions (e.g., \['.html', '.css']) |
| `blocked_extensions`        | `Optional[list]`            | no       | `None`            | List of blocked extensions (e.g., \['.env', '.git'])       |
| `max_file_size`             | `int`                       | no       | `[object Object]` | Maximum file size in bytes to serve                        |
| `enable_cors`               | `bool`                      | no       | `True`            | Enable CORS support                                        |

## Source

[`/src/signalwire/signalwire/web/web_service.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/web/web_service.py)

Line 44.
