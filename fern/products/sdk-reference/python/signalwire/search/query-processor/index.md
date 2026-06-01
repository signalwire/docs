---
slug: "/reference/python/signalwire/search/query-processor"
title: "query_processor"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "module"
  language: "python"
  qualified_name: "signalwire.search.query_processor"
  parent: "signalwire.search"
  module: "signalwire.search"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/query_processor.py"
---
# `query_processor`

Copyright (c) 2025 SignalWire

This file is part of the SignalWire SDK.

Licensed under the MIT License.
See LICENSE file in the project root for full license information.

## Signature

```python
module query_processor
```

## Properties

| Name                     | Type                     | Required | Default | Description |
| ------------------------ | ------------------------ | -------- | ------- | ----------- |
| `logger`                 | `logger`                 | yes      | —       | —           |
| `pos_mapping`            | `pos_mapping`            | yes      | —       | —           |
| `stopwords_language_map` | `stopwords_language_map` | yes      | —       | —           |

## Functions

- [`detect_language`](/reference/python/signalwire/search/query-processor/detect-language) — Detect language of input text Simple implementation - can be enhanced with langdetect library
- [`ensure_nltk_resources`](/reference/python/signalwire/search/query-processor/ensure-nltk-resources) — Download required NLTK resources if not already present
- [`get_synonyms`](/reference/python/signalwire/search/query-processor/get-synonyms) — Get synonyms for a word using WordNet
- [`get_wordnet_pos`](/reference/python/signalwire/search/query-processor/get-wordnet-pos) — Map spaCy POS tags to WordNet POS tags.
- [`load_spacy_model`](/reference/python/signalwire/search/query-processor/load-spacy-model) — Load spaCy model for the given language Returns None if spaCy is not available or model not found
- [`preprocess_document_content`](/reference/python/signalwire/search/query-processor/preprocess-document-content) — Preprocess document content for better searchability
- [`preprocess_query`](/reference/python/signalwire/search/query-processor/preprocess-query) — Advanced query preprocessing with language detection, POS tagging, synonym expansion, and vectorization
- [`remove_duplicate_words`](/reference/python/signalwire/search/query-processor/remove-duplicate-words) — Remove duplicate words from the input string while preserving the order and punctuation.
- [`set_global_model`](/reference/python/signalwire/search/query-processor/set-global-model) — Legacy function - adds model to cache instead of setting globally
- [`vectorize_query`](/reference/python/signalwire/search/query-processor/vectorize-query) — Vectorize query using sentence transformers Returns numpy array of embeddings

## Source

[`/src/signalwire/signalwire/search/query_processor.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/query_processor.py)
