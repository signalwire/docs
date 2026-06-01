---
slug: "/reference/python/signalwire/search/migration/search-index-migrator/get-index-info"
title: "get_index_info"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.search.migration.SearchIndexMigrator.get_index_info"
  parent: "signalwire.search.migration.SearchIndexMigrator"
  module: "signalwire.search.migration"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/migration.py"
---
# `get_index_info`

Get information about a search index

## Signature

```python
get_index_info(index_path: str) -> Dict[str, Any]
```

## Parameters

| Name         | Type  | Required | Default | Description                                          |
| ------------ | ----- | -------- | ------- | ---------------------------------------------------- |
| `index_path` | `str` | yes      | —       | Path to index file or pgvector collection identifier |

## Returns

`Dict[str, Any]` — Index information including type, config, and statistics

## Source

[`/src/signalwire/signalwire/search/migration.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/migration.py)

Line 382.
