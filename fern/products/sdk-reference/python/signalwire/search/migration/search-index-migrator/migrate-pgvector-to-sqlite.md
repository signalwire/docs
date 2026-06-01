---
slug: "/reference/python/signalwire/search/migration/search-index-migrator/migrate-pgvector-to-sqlite"
title: "migrate_pgvector_to_sqlite"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.search.migration.SearchIndexMigrator.migrate_pgvector_to_sqlite"
  parent: "signalwire.search.migration.SearchIndexMigrator"
  module: "signalwire.search.migration"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/migration.py"
---
# `migrate_pgvector_to_sqlite`

Migrate a pgvector collection to SQLite .swsearch format

## Signature

```python
migrate_pgvector_to_sqlite(
    connection_string: str,
    collection_name: str,
    output_path: str,
    batch_size: int = 100
) -> Dict[str, Any]
```

## Parameters

| Name                | Type  | Required | Default | Description                       |
| ------------------- | ----- | -------- | ------- | --------------------------------- |
| `connection_string` | `str` | yes      | —       | PostgreSQL connection string      |
| `collection_name`   | `str` | yes      | —       | Name of the pgvector collection   |
| `output_path`       | `str` | yes      | —       | Output .swsearch file path        |
| `batch_size`        | `int` | no       | `100`   | Number of chunks to fetch at once |

## Returns

`Dict[str, Any]` — Migration statistics

## Source

[`/src/signalwire/signalwire/search/migration.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/migration.py)

Line 237.
