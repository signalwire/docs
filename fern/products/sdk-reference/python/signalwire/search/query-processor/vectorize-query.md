---
slug: "/reference/python/signalwire/search/query-processor/vectorize-query"
title: "vectorize_query"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "function"
  language: "python"
  qualified_name: "signalwire.search.query_processor.vectorize_query"
  parent: "signalwire.search.query_processor"
  module: "signalwire.search.query_processor"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/query_processor.py"
---
# `vectorize_query`

Vectorize query using sentence transformers
Returns numpy array of embeddings

## Signature

```python
vectorize_query(query: str, model = None, model_name: str = None)
```

## Parameters

| Name         | Type  | Required | Default | Description                                                             |
| ------------ | ----- | -------- | ------- | ----------------------------------------------------------------------- |
| `query`      | `str` | yes      | —       | Query string to vectorize                                               |
| `model`      | —     | no       | `None`  | Optional pre-loaded model instance. If not provided, uses cached model. |
| `model_name` | `str` | no       | `None`  | Optional model name to use if loading a new model                       |

## Source

[`/src/signalwire/signalwire/search/query_processor.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/query_processor.py)

Line 145.
