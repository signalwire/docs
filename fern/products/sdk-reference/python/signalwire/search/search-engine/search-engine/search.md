---
slug: "/reference/python/signalwire/search/search-engine/search-engine/search"
title: "search"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.search.search_engine.SearchEngine.search"
  parent: "signalwire.search.search_engine.SearchEngine"
  module: "signalwire.search.search_engine"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/search_engine.py"
---
# `search`

Unified hybrid search: backends fetch candidates, SearchEngine post-processes.

> \[!NOTE]
>
> 1. fetch\_candidates(k = count \* search\_multiplier)  — per-source signals
> 2. \_process\_candidates                              — score / boost / dedupe / diversity
> 3. return top `count`

Backends (sqlite, pgvector, future) only implement candidate fetching.
All quality logic (max-signal scoring with agreement boost, exact-match
boosting, content dedup, filename diversity, match-type diversity) runs
once here and therefore applies to every backend uniformly.

## Signature

```python
search(
    query_vector: List[float],
    enhanced_text: str,
    count: int = 3,
    similarity_threshold: float = 0.0,
    tags: Optional[List[str]] = None,
    keyword_weight: Optional[float] = None,
    original_query: Optional[str] = None
) -> List[Dict[str, Any]]
```

## Parameters

| Name                   | Type                  | Required | Default | Description                                                                                             |
| ---------------------- | --------------------- | -------- | ------- | ------------------------------------------------------------------------------------------------------- |
| `query_vector`         | `List[float]`         | yes      | —       | Embedding vector for the query                                                                          |
| `enhanced_text`        | `str`                 | yes      | —       | Processed query text for keyword search                                                                 |
| `count`                | `int`                 | no       | `3`     | Number of results to return                                                                             |
| `similarity_threshold` | `float`               | no       | `0.0`   | Minimum similarity score (applied to raw vector pre-merge so the threshold is intuitive)                |
| `tags`                 | `Optional[List[str]]` | no       | `None`  | Filter by tags                                                                                          |
| `keyword_weight`       | `Optional[float]`     | no       | `None`  | Accepted for API stability; scoring is max-signal-wins with agreement boost, so this is no-op currently |
| `original_query`       | `Optional[str]`       | no       | `None`  | Original query for exact matching / filename match                                                      |

## Returns

`List[Dict[str, Any]]` — List of search results with scores and metadata

## Source

[`/src/signalwire/signalwire/search/search_engine.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/search/search_engine.py)

Line 79.
