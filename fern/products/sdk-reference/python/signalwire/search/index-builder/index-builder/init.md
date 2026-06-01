---
slug: "/reference/python/signalwire/search/index-builder/index-builder/init"
title: "__init__"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.search.index_builder.IndexBuilder.__init__"
  parent: "signalwire.search.index_builder.IndexBuilder"
  module: "signalwire.search.index_builder"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/index_builder.py"
---
# `__init__`

Initialize the index builder

## Signature

```python
__init__(
    model_name: str = 'sentence-transformers/all-mpnet-base-v2',
    chunking_strategy: str = 'sentence',
    max_sentences_per_chunk: int = 5,
    chunk_size: int = 50,
    chunk_overlap: int = 10,
    split_newlines: Optional[int] = None,
    index_nlp_backend: str = 'nltk',
    verbose: bool = False,
    semantic_threshold: float = 0.5,
    topic_threshold: float = 0.3,
    backend: str = 'sqlite',
    connection_string: Optional[str] = None
)
```

## Parameters

| Name                      | Type            | Required | Default                                     | Description                                                                                                     |
| ------------------------- | --------------- | -------- | ------------------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| `model_name`              | `str`           | no       | `'sentence-transformers/all-mpnet-base-v2'` | Name of the sentence transformer model to use                                                                   |
| `chunking_strategy`       | `str`           | no       | `'sentence'`                                | Strategy for chunking documents ('sentence', 'sliding', 'paragraph', 'page', 'semantic', 'topic', 'qa', 'json') |
| `max_sentences_per_chunk` | `int`           | no       | `5`                                         | For sentence strategy (default: 5)                                                                              |
| `chunk_size`              | `int`           | no       | `50`                                        | For sliding strategy - words per chunk (default: 50)                                                            |
| `chunk_overlap`           | `int`           | no       | `10`                                        | For sliding strategy - overlap in words (default: 10)                                                           |
| `split_newlines`          | `Optional[int]` | no       | `None`                                      | For sentence strategy - split on multiple newlines (optional)                                                   |
| `index_nlp_backend`       | `str`           | no       | `'nltk'`                                    | NLP backend for indexing (default: 'nltk')                                                                      |
| `verbose`                 | `bool`          | no       | `False`                                     | Whether to enable verbose logging (default: False)                                                              |
| `semantic_threshold`      | `float`         | no       | `0.5`                                       | Similarity threshold for semantic chunking (default: 0.5)                                                       |
| `topic_threshold`         | `float`         | no       | `0.3`                                       | Similarity threshold for topic chunking (default: 0.3)                                                          |
| `backend`                 | `str`           | no       | `'sqlite'`                                  | Storage backend ('sqlite' or 'pgvector') (default: 'sqlite')                                                    |
| `connection_string`       | `Optional[str]` | no       | `None`                                      | PostgreSQL connection string for pgvector backend                                                               |

## Source

[`/src/signalwire/signalwire/search/index_builder.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/index_builder.py)

Line 38.
