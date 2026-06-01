---
slug: "/reference/python/signalwire/search/pgvector-backend/pg-vector-search-backend"
title: "PgVectorSearchBackend"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.search.pgvector_backend.PgVectorSearchBackend"
  parent: "signalwire.search.pgvector_backend"
  module: "signalwire.search.pgvector_backend"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/pgvector_backend.py"
---
# `PgVectorSearchBackend`

PostgreSQL pgvector backend for search operations

## Signature

```python
class PgVectorSearchBackend
```

## Properties

| Name                | Type                | Required | Default | Description |
| ------------------- | ------------------- | -------- | ------- | ----------- |
| `collection_name`   | `collection_name`   | yes      | —       | —           |
| `config`            | `config`            | yes      | —       | —           |
| `conn`              | `conn`              | yes      | —       | —           |
| `connection_string` | `connection_string` | yes      | —       | —           |
| `table_name`        | `table_name`        | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/search/pgvector-backend/pg-vector-search-backend/init) — Initialize search backend
- [`close`](/reference/python/signalwire/search/pgvector-backend/pg-vector-search-backend/close) — Close database connection
- [`fetch_candidates`](/reference/python/signalwire/search/pgvector-backend/pg-vector-search-backend/fetch-candidates) — Fetch raw candidates with per-source signal scores.
- [`get_stats`](/reference/python/signalwire/search/pgvector-backend/pg-vector-search-backend/get-stats) — Get statistics for the collection
- [`search`](/reference/python/signalwire/search/pgvector-backend/pg-vector-search-backend/search) — Perform hybrid search (vector + keyword + metadata).

## Source

[`/src/signalwire/signalwire/search/pgvector_backend.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/pgvector_backend.py)

Line 403.
