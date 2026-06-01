---
slug: "/reference/python/signalwire/search/search-engine/search-engine/init"
title: "__init__"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.search.search_engine.SearchEngine.__init__"
  parent: "signalwire.search.search_engine.SearchEngine"
  module: "signalwire.search.search_engine"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/search_engine.py"
---
# `__init__`

Initialize search engine

## Signature

```python
__init__(
    backend: str = 'sqlite',
    index_path: Optional[str] = None,
    connection_string: Optional[str] = None,
    collection_name: Optional[str] = None,
    model = None
)
```

## Parameters

| Name                | Type            | Required | Default    | Description                                         |
| ------------------- | --------------- | -------- | ---------- | --------------------------------------------------- |
| `backend`           | `str`           | no       | `'sqlite'` | Storage backend ('sqlite' or 'pgvector')            |
| `index_path`        | `Optional[str]` | no       | `None`     | Path to .swsearch file (for sqlite backend)         |
| `connection_string` | `Optional[str]` | no       | `None`     | PostgreSQL connection string (for pgvector backend) |
| `collection_name`   | `Optional[str]` | no       | `None`     | Collection name (for pgvector backend)              |
| `model`             | —               | no       | `None`     | Optional sentence transformer model                 |

## Source

[`/src/signalwire/signalwire/search/search_engine.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/search_engine.py)

Line 30.
