---
slug: "/reference/python/signalwire/search/pgvector-backend/pg-vector-backend"
title: "PgVectorBackend"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.search.pgvector_backend.PgVectorBackend"
  parent: "signalwire.search.pgvector_backend"
  module: "signalwire.search.pgvector_backend"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/pgvector_backend.py"
---
# `PgVectorBackend`

PostgreSQL pgvector backend for search indexing and retrieval

## Signature

```python
class PgVectorBackend
```

## Properties

| Name                | Type                | Required | Default | Description |
| ------------------- | ------------------- | -------- | ------- | ----------- |
| `conn`              | `conn`              | yes      | —       | —           |
| `connection_string` | `connection_string` | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/search/pgvector-backend/pg-vector-backend/init) — Initialize pgvector backend
- [`close`](/reference/python/signalwire/search/pgvector-backend/pg-vector-backend/close) — Close database connection
- [`create_schema`](/reference/python/signalwire/search/pgvector-backend/pg-vector-backend/create-schema) — Create database schema for a collection
- [`delete_collection`](/reference/python/signalwire/search/pgvector-backend/pg-vector-backend/delete-collection) — Delete a collection and its data
- [`get_stats`](/reference/python/signalwire/search/pgvector-backend/pg-vector-backend/get-stats) — Get statistics for a collection
- [`list_collections`](/reference/python/signalwire/search/pgvector-backend/pg-vector-backend/list-collections) — List all collections in the database
- [`store_chunks`](/reference/python/signalwire/search/pgvector-backend/pg-vector-backend/store-chunks) — Store document chunks in the database

## Source

[`/src/signalwire/signalwire/search/pgvector_backend.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/pgvector_backend.py)

Line 42.
