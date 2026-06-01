---
slug: "/reference/python/signalwire/search/search-service/search-service/search-direct"
title: "search_direct"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.search.search_service.SearchService.search_direct"
  parent: "signalwire.search.search_service.SearchService"
  module: "signalwire.search.search_service"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/search_service.py"
---
# `search_direct`

Direct search method (non-async) for programmatic use

## Signature

```python
search_direct(
    query: str,
    index_name: str = 'default',
    count: int = 3,
    distance: float = 0.0,
    tags: Optional[List[str]] = None,
    language: Optional[str] = None
) -> Dict[str, Any]
```

## Parameters

| Name         | Type                  | Required | Default     | Description |
| ------------ | --------------------- | -------- | ----------- | ----------- |
| `query`      | `str`                 | yes      | —           | —           |
| `index_name` | `str`                 | no       | `'default'` | —           |
| `count`      | `int`                 | no       | `3`         | —           |
| `distance`   | `float`               | no       | `0.0`       | —           |
| `tags`       | `Optional[List[str]]` | no       | `None`      | —           |
| `language`   | `Optional[str]`       | no       | `None`      | —           |

## Returns

`Dict[str, Any]`

## Source

[`/src/signalwire/signalwire/search/search_service.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/search_service.py)

Line 483.
