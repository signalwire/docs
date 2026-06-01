---
slug: "/reference/python/signalwire/skills/web-search/skill-improved/google-search-scraper"
title: "GoogleSearchScraper"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.skills.web_search.skill_improved.GoogleSearchScraper"
  parent: "signalwire.skills.web_search.skill_improved"
  module: "signalwire.skills.web_search.skill_improved"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/web_search/skill_improved.py"
---
# `GoogleSearchScraper`

Google Search and Web Scraping functionality with quality scoring

## Signature

```python
class GoogleSearchScraper
```

## Properties

| Name                 | Type                 | Required | Default | Description |
| -------------------- | -------------------- | -------- | ------- | ----------- |
| `api_key`            | `api_key`            | yes      | —       | —           |
| `max_content_length` | `max_content_length` | yes      | —       | —           |
| `search_engine_id`   | `search_engine_id`   | yes      | —       | —           |
| `session`            | `session`            | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/skills/web-search/skill-improved/google-search-scraper/init)
- [`extract_text_from_url`](/reference/python/signalwire/skills/web-search/skill-improved/google-search-scraper/extract-text-from-url) — Scrape a URL and extract readable text content with quality metrics
- [`search_and_scrape`](/reference/python/signalwire/skills/web-search/skill-improved/google-search-scraper/search-and-scrape) — Backward compatible method that uses the improved search
- [`search_and_scrape_best`](/reference/python/signalwire/skills/web-search/skill-improved/google-search-scraper/search-and-scrape-best) — Search and scrape with quality filtering
- [`search_google`](/reference/python/signalwire/skills/web-search/skill-improved/google-search-scraper/search-google) — Search Google using Custom Search JSON API

## Source

[`/src/signalwire/signalwire/skills/web_search/skill_improved.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/web_search/skill_improved.py)

Line 22.
