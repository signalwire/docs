---
slug: "/reference/python/signalwire/search/pgvector-backend/pg-vector-backend/store-chunks"
title: "store_chunks"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.search.pgvector_backend.PgVectorBackend.store_chunks"
  parent: "signalwire.search.pgvector_backend.PgVectorBackend"
  module: "signalwire.search.pgvector_backend"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/pgvector_backend.py"
---
# `store_chunks`

Store document chunks in the database

## Signature

```python
store_chunks(
    chunks: List[Dict[str, Any]],
    collection_name: str,
    config: Dict[str, Any]
)
```

## Parameters

| Name              | Type                   | Required | Default | Description                              |
| ----------------- | ---------------------- | -------- | ------- | ---------------------------------------- |
| `chunks`          | `List[Dict[str, Any]]` | yes      | —       | List of processed chunks with embeddings |
| `collection_name` | `str`                  | yes      | —       | Name of the collection                   |
| `config`          | `Dict[str, Any]`       | yes      | —       | Configuration metadata                   |

## Source

[`/src/signalwire/signalwire/search/pgvector_backend.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/pgvector_backend.py)

Line 209.
