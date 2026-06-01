---
slug: "/reference/python/signalwire/search/search-engine/search-engine"
title: "SearchEngine"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.search.search_engine.SearchEngine"
  parent: "signalwire.search.search_engine"
  module: "signalwire.search.search_engine"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/search_engine.py"
---
# `SearchEngine`

Hybrid search engine for vector and keyword search

## Signature

```python
class SearchEngine
```

## Properties

| Name            | Type            | Required | Default | Description |
| --------------- | --------------- | -------- | ------- | ----------- |
| `backend`       | `backend`       | yes      | —       | —           |
| `config`        | `config`        | yes      | —       | —           |
| `embedding_dim` | `embedding_dim` | yes      | —       | —           |
| `index_path`    | `index_path`    | yes      | —       | —           |
| `model`         | `model`         | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/search/search-engine/search-engine/init) — Initialize search engine
- [`get_stats`](/reference/python/signalwire/search/search-engine/search-engine/get-stats) — Get statistics about the search index
- [`search`](/reference/python/signalwire/search/search-engine/search-engine/search) — Unified hybrid search: backends fetch candidates, SearchEngine post-processes.

## Source

[`/src/signalwire/signalwire/search/search_engine.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/search_engine.py)

Line 27.
