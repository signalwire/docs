---
slug: "/reference/python/signalwire/core/swml-service/swml-service/init"
title: "__init__"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.swml_service.SWMLService.__init__"
  parent: "signalwire.core.swml_service.SWMLService"
  module: "signalwire.core.swml_service"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_service.py"
---
# `__init__`

Initialize a new SWML service

## Signature

```python
__init__(
    name: str,
    route: str = '/',
    host: str = '0.0.0.0',
    port: Optional[int] = None,
    basic_auth: Optional[Tuple[str, str]] = None,
    schema_path: Optional[str] = None,
    config_file: Optional[str] = None,
    schema_validation: bool = True
)
```

## Parameters

| Name                | Type                        | Required | Default     | Description                                                                                                |
| ------------------- | --------------------------- | -------- | ----------- | ---------------------------------------------------------------------------------------------------------- |
| `name`              | `str`                       | yes      | —           | Service name/identifier                                                                                    |
| `route`             | `str`                       | no       | `'/'`       | HTTP route path for this service                                                                           |
| `host`              | `str`                       | no       | `'0.0.0.0'` | Host to bind the web server to                                                                             |
| `port`              | `Optional[int]`             | no       | `None`      | Port to bind the web server to                                                                             |
| `basic_auth`        | `Optional[Tuple[str, str]]` | no       | `None`      | Optional (username, password) tuple for basic auth                                                         |
| `schema_path`       | `Optional[str]`             | no       | `None`      | Optional path to the schema file                                                                           |
| `config_file`       | `Optional[str]`             | no       | `None`      | Optional path to configuration file                                                                        |
| `schema_validation` | `bool`                      | no       | `True`      | Enable schema validation. Default True. Can also be disabled via SWML\_SKIP\_SCHEMA\_VALIDATION=1 env var. |

## Source

[`/src/signalwire/signalwire/core/swml_service.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swml_service.py)

Line 70.
