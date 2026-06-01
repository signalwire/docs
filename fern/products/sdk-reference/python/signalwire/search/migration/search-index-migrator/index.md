---
slug: "/reference/python/signalwire/search/migration/search-index-migrator"
title: "SearchIndexMigrator"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.search.migration.SearchIndexMigrator"
  parent: "signalwire.search.migration"
  module: "signalwire.search.migration"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/migration.py"
---
# `SearchIndexMigrator`

Migrate search indexes between different backends

## Signature

```python
class SearchIndexMigrator
```

## Properties

| Name      | Type      | Required | Default | Description |
| --------- | --------- | -------- | ------- | ----------- |
| `verbose` | `verbose` | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/search/migration/search-index-migrator/init) — Initialize the migrator
- [`get_index_info`](/reference/python/signalwire/search/migration/search-index-migrator/get-index-info) — Get information about a search index
- [`migrate_pgvector_to_sqlite`](/reference/python/signalwire/search/migration/search-index-migrator/migrate-pgvector-to-sqlite) — Migrate a pgvector collection to SQLite .swsearch format
- [`migrate_sqlite_to_pgvector`](/reference/python/signalwire/search/migration/search-index-migrator/migrate-sqlite-to-pgvector) — Migrate a .swsearch SQLite index to pgvector

## Source

[`/src/signalwire/signalwire/search/migration.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/migration.py)

Line 26.
