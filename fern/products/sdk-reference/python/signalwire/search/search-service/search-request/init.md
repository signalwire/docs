---
slug: "/reference/python/signalwire/search/search-service/search-request/init"
title: "__init__"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.search.search_service.SearchRequest.__init__"
  parent: "signalwire.search.search_service.SearchRequest"
  module: "signalwire.search.search_service"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/search_service.py"
---
# `__init__`

## Signature

```python
__init__(
    query: str,
    index_name: str = 'default',
    count: int = 3,
    similarity_threshold: float = 0.0,
    tags: Optional[List[str]] = None,
    language: Optional[str] = None
)
```

## Parameters

| Name                   | Type                  | Required | Default     | Description |
| ---------------------- | --------------------- | -------- | ----------- | ----------- |
| `query`                | `str`                 | yes      | —           | —           |
| `index_name`           | `str`                 | no       | `'default'` | —           |
| `count`                | `int`                 | no       | `3`         | —           |
| `similarity_threshold` | `float`               | no       | `0.0`       | —           |
| `tags`                 | `Optional[List[str]]` | no       | `None`      | —           |
| `language`             | `Optional[str]`       | no       | `None`      | —           |

## Source

[`/src/signalwire/signalwire/search/search_service.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/search_service.py)

Line 68.
