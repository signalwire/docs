---
slug: "/reference/python/signalwire/search/index-builder/index-builder"
title: "IndexBuilder"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.search.index_builder.IndexBuilder"
  parent: "signalwire.search.index_builder"
  module: "signalwire.search.index_builder"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/index_builder.py"
---
# `IndexBuilder`

Build searchable indexes from document directories

## Signature

```python
class IndexBuilder
```

## Properties

| Name                      | Type                      | Required | Default | Description |
| ------------------------- | ------------------------- | -------- | ------- | ----------- |
| `backend`                 | `backend`                 | yes      | —       | —           |
| `chunk_overlap`           | `chunk_overlap`           | yes      | —       | —           |
| `chunk_size`              | `chunk_size`              | yes      | —       | —           |
| `chunking_strategy`       | `chunking_strategy`       | yes      | —       | —           |
| `connection_string`       | `connection_string`       | yes      | —       | —           |
| `doc_processor`           | `doc_processor`           | yes      | —       | —           |
| `index_nlp_backend`       | `index_nlp_backend`       | yes      | —       | —           |
| `max_sentences_per_chunk` | `max_sentences_per_chunk` | yes      | —       | —           |
| `model`                   | `model`                   | yes      | —       | —           |
| `model_name`              | `model_name`              | yes      | —       | —           |
| `semantic_threshold`      | `semantic_threshold`      | yes      | —       | —           |
| `split_newlines`          | `split_newlines`          | yes      | —       | —           |
| `topic_threshold`         | `topic_threshold`         | yes      | —       | —           |
| `verbose`                 | `verbose`                 | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/search/index-builder/index-builder/init) — Initialize the index builder
- [`build_index`](/reference/python/signalwire/search/index-builder/index-builder/build-index) — Build complete search index from a single directory
- [`build_index_from_sources`](/reference/python/signalwire/search/index-builder/index-builder/build-index-from-sources) — Build complete search index from multiple sources (files and directories)
- [`validate_index`](/reference/python/signalwire/search/index-builder/index-builder/validate-index) — Validate an existing search index

## Source

[`/src/signalwire/signalwire/search/index_builder.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/index_builder.py)

Line 35.
