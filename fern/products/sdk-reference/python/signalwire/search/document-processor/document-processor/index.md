---
slug: "/reference/python/signalwire/search/document-processor/document-processor"
title: "DocumentProcessor"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.search.document_processor.DocumentProcessor"
  parent: "signalwire.search.document_processor"
  module: "signalwire.search.document_processor"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/document_processor.py"
---
# `DocumentProcessor`

Enhanced document processor with smart chunking capabilities

## Signature

```python
class DocumentProcessor
```

## Properties

| Name                      | Type                      | Required | Default | Description |
| ------------------------- | ------------------------- | -------- | ------- | ----------- |
| `chunk_overlap`           | `chunk_overlap`           | yes      | —       | —           |
| `chunk_size`              | `chunk_size`              | yes      | —       | —           |
| `chunking_strategy`       | `chunking_strategy`       | yes      | —       | —           |
| `max_sentences_per_chunk` | `max_sentences_per_chunk` | yes      | —       | —           |
| `semantic_threshold`      | `semantic_threshold`      | yes      | —       | —           |
| `split_newlines`          | `split_newlines`          | yes      | —       | —           |
| `topic_threshold`         | `topic_threshold`         | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/search/document-processor/document-processor/init) — Initialize document processor
- [`create_chunks`](/reference/python/signalwire/search/document-processor/document-processor/create-chunks) — Create chunks from document content using specified chunking strategy

## Source

[`/src/signalwire/signalwire/search/document_processor.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/document_processor.py)

Line 79.
