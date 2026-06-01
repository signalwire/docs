---
slug: "/reference/python/signalwire/skills/web-search/skill/google-search-scraper/search-and-scrape-best"
title: "search_and_scrape_best"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.skills.web_search.skill.GoogleSearchScraper.search_and_scrape_best"
  parent: "signalwire.skills.web_search.skill.GoogleSearchScraper"
  module: "signalwire.skills.web_search.skill"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/web_search/skill.py"
---
# `search_and_scrape_best`

Search and scrape with quality filtering and source diversity

## Signature

```python
search_and_scrape_best(
    query: str,
    num_results: int = 3,
    oversample_factor: float = 4.0,
    delay: float = 0.5,
    min_quality_score: float = 0.2
) -> str
```

## Parameters

| Name                | Type    | Required | Default | Description                                            |
| ------------------- | ------- | -------- | ------- | ------------------------------------------------------ |
| `query`             | `str`   | yes      | —       | Search query                                           |
| `num_results`       | `int`   | no       | `3`     | Number of best results to return                       |
| `oversample_factor` | `float` | no       | `4.0`   | How many extra results to fetch (e.g., 4.0 = fetch 4x) |
| `delay`             | `float` | no       | `0.5`   | Delay between requests                                 |
| `min_quality_score` | `float` | no       | `0.2`   | Minimum quality score to include a result              |

## Returns

`str` — Formatted string with the best N results from diverse sources

## Source

[`/src/signalwire/signalwire/skills/web_search/skill.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/web_search/skill.py)

Line 416.
