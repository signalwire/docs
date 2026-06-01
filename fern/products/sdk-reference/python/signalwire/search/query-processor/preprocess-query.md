---
slug: "/reference/python/signalwire/search/query-processor/preprocess-query"
title: "preprocess_query"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "function"
  language: "python"
  qualified_name: "signalwire.search.query_processor.preprocess_query"
  parent: "signalwire.search.query_processor"
  module: "signalwire.search.query_processor"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/query_processor.py"
---
# `preprocess_query`

Advanced query preprocessing with language detection, POS tagging, synonym expansion, and vectorization

## Signature

```python
preprocess_query(
    query: str,
    language: str = 'en',
    pos_to_expand: Optional[List[str]] = None,
    max_synonyms: int = 5,
    debug: bool = False,
    vector: bool = False,
    vectorize_query_param: bool = False,
    nlp_backend: str = None,
    query_nlp_backend: str = 'nltk',
    model_name: str = None,
    preserve_original: bool = True
) -> Dict[str, Any]
```

## Parameters

| Name                    | Type                  | Required | Default  | Description                                                                    |
| ----------------------- | --------------------- | -------- | -------- | ------------------------------------------------------------------------------ |
| `query`                 | `str`                 | yes      | —        | Input query string                                                             |
| `language`              | `str`                 | no       | `'en'`   | Language code ('en', 'es', etc.) or 'auto' for detection                       |
| `pos_to_expand`         | `Optional[List[str]]` | no       | `None`   | List of POS tags to expand with synonyms                                       |
| `max_synonyms`          | `int`                 | no       | `5`      | Maximum synonyms per word                                                      |
| `debug`                 | `bool`                | no       | `False`  | Enable debug output                                                            |
| `vector`                | `bool`                | no       | `False`  | Include vector embedding in output                                             |
| `vectorize_query_param` | `bool`                | no       | `False`  | If True, just vectorize without other processing                               |
| `nlp_backend`           | `str`                 | no       | `None`   | DEPRECATED - use query\_nlp\_backend instead                                   |
| `query_nlp_backend`     | `str`                 | no       | `'nltk'` | NLP backend for query processing ('nltk' for fast, 'spacy' for better quality) |
| `model_name`            | `str`                 | no       | `None`   | —                                                                              |
| `preserve_original`     | `bool`                | no       | `True`   | —                                                                              |

## Returns

`Dict[str, Any]` — Dict containing processed query, language, POS tags, and optionally vector

## Source

[`/src/signalwire/signalwire/search/query_processor.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/query_processor.py)

Line 276.
