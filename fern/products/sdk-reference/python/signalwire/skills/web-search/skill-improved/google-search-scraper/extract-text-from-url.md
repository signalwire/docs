---
slug: "/reference/python/signalwire/skills/web-search/skill-improved/google-search-scraper/extract-text-from-url"
title: "extract_text_from_url"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.skills.web_search.skill_improved.GoogleSearchScraper.extract_text_from_url"
  parent: "signalwire.skills.web_search.skill_improved.GoogleSearchScraper"
  module: "signalwire.skills.web_search.skill_improved"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/web_search/skill_improved.py"
---
# `extract_text_from_url`

Scrape a URL and extract readable text content with quality metrics

## Signature

```python
extract_text_from_url(
    url: str,
    content_limit: int = None,
    timeout: int = 10
) -> Tuple[str, Dict[str, Any]]
```

## Parameters

| Name            | Type  | Required | Default | Description |
| --------------- | ----- | -------- | ------- | ----------- |
| `url`           | `str` | yes      | —       | —           |
| `content_limit` | `int` | no       | `None`  | —           |
| `timeout`       | `int` | no       | `10`    | —           |

## Returns

`Tuple[str, Dict[str, Any]]` — Tuple of (text\_content, quality\_metrics)

## Source

[`/src/signalwire/signalwire/skills/web_search/skill_improved.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/web_search/skill_improved.py)

Line 66.
