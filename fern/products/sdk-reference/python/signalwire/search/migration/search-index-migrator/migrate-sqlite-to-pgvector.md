---
slug: "/reference/python/signalwire/search/migration/search-index-migrator/migrate-sqlite-to-pgvector"
title: "migrate_sqlite_to_pgvector"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.search.migration.SearchIndexMigrator.migrate_sqlite_to_pgvector"
  parent: "signalwire.search.migration.SearchIndexMigrator"
  module: "signalwire.search.migration"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/migration.py"
---
# `migrate_sqlite_to_pgvector`

Migrate a .swsearch SQLite index to pgvector

## Signature

```python
migrate_sqlite_to_pgvector(
    sqlite_path: str,
    connection_string: str,
    collection_name: str,
    overwrite: bool = False,
    batch_size: int = 100
) -> Dict[str, Any]
```

## Parameters

| Name                | Type   | Required | Default | Description                              |
| ------------------- | ------ | -------- | ------- | ---------------------------------------- |
| `sqlite_path`       | `str`  | yes      | —       | Path to .swsearch file                   |
| `connection_string` | `str`  | yes      | —       | PostgreSQL connection string             |
| `collection_name`   | `str`  | yes      | —       | Name for the pgvector collection         |
| `overwrite`         | `bool` | no       | `False` | Whether to overwrite existing collection |
| `batch_size`        | `int`  | no       | `100`   | Number of chunks to insert at once       |

## Returns

`Dict[str, Any]` — Migration statistics

## Source

[`/src/signalwire/signalwire/search/migration.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/migration.py)

Line 38.
