---
slug: "/reference/python/signalwire/skills/web-search/skill-improved/google-search-scraper/search-and-scrape-best"
title: "search_and_scrape_best"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.skills.web_search.skill_improved.GoogleSearchScraper.search_and_scrape_best"
  parent: "signalwire.skills.web_search.skill_improved.GoogleSearchScraper"
  module: "signalwire.skills.web_search.skill_improved"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/web_search/skill_improved.py"
---
# `search_and_scrape_best`

Search and scrape with quality filtering

## Signature

```python
search_and_scrape_best(
    query: str,
    num_results: int = 3,
    oversample_factor: float = 2.5,
    delay: float = 0.5,
    min_quality_score: float = 0.3
) -> str
```

## Parameters

| Name                | Type    | Required | Default | Description                                              |
| ------------------- | ------- | -------- | ------- | -------------------------------------------------------- |
| `query`             | `str`   | yes      | —       | Search query                                             |
| `num_results`       | `int`   | no       | `3`     | Number of best results to return                         |
| `oversample_factor` | `float` | no       | `2.5`   | How many extra results to fetch (e.g., 2.5 = fetch 2.5x) |
| `delay`             | `float` | no       | `0.5`   | Delay between requests                                   |
| `min_quality_score` | `float` | no       | `0.3`   | Minimum quality score to include a result                |

## Returns

`str` — Formatted string with the best N results

## Source

[`/src/signalwire/signalwire/skills/web_search/skill_improved.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/web_search/skill_improved.py)

Line 243.
