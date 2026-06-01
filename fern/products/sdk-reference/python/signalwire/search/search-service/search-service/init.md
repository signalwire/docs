---
slug: "/reference/python/signalwire/search/search-service/search-service/init"
title: "__init__"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.search.search_service.SearchService.__init__"
  parent: "signalwire.search.search_service.SearchService"
  module: "signalwire.search.search_service"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/search_service.py"
---
# `__init__`

## Signature

```python
__init__(
    port: int = 8001,
    indexes: Dict[str, str] = None,
    basic_auth: Optional[Tuple[str, str]] = None,
    config_file: Optional[str] = None,
    backend: str = 'sqlite',
    connection_string: Optional[str] = None
)
```

## Parameters

| Name                | Type                        | Required | Default    | Description |
| ------------------- | --------------------------- | -------- | ---------- | ----------- |
| `port`              | `int`                       | no       | `8001`     | —           |
| `indexes`           | `Dict[str, str]`            | no       | `None`     | —           |
| `basic_auth`        | `Optional[Tuple[str, str]]` | no       | `None`     | —           |
| `config_file`       | `Optional[str]`             | no       | `None`     | —           |
| `backend`           | `str`                       | no       | `'sqlite'` | —           |
| `connection_string` | `Optional[str]`             | no       | `None`     | —           |

## Source

[`/src/signalwire/signalwire/search/search_service.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/search_service.py)

Line 103.
