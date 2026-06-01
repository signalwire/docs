---
slug: "/reference/python/signalwire/search/query-processor/preprocess-document-content"
title: "preprocess_document_content"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "function"
  language: "python"
  qualified_name: "signalwire.search.query_processor.preprocess_document_content"
  parent: "signalwire.search.query_processor"
  module: "signalwire.search.query_processor"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/query_processor.py"
---
# `preprocess_document_content`

Preprocess document content for better searchability

## Signature

```python
preprocess_document_content(
    content: str,
    language: str = 'en',
    nlp_backend: str = None,
    index_nlp_backend: str = 'nltk'
) -> Dict[str, Any]
```

## Parameters

| Name                | Type  | Required | Default  | Description                                                                       |
| ------------------- | ----- | -------- | -------- | --------------------------------------------------------------------------------- |
| `content`           | `str` | yes      | —        | Document content to process                                                       |
| `language`          | `str` | no       | `'en'`   | Language code for processing                                                      |
| `nlp_backend`       | `str` | no       | `None`   | DEPRECATED - use index\_nlp\_backend instead                                      |
| `index_nlp_backend` | `str` | no       | `'nltk'` | NLP backend for document processing ('nltk' for fast, 'spacy' for better quality) |

## Returns

`Dict[str, Any]` — Dict containing enhanced text and extracted keywords

## Source

[`/src/signalwire/signalwire/search/query_processor.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/query_processor.py)

Line 462.
