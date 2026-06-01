---
slug: "/reference/python/signalwire/skills/web-search/skill-original/google-search-scraper"
title: "GoogleSearchScraper"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.skills.web_search.skill_original.GoogleSearchScraper"
  parent: "signalwire.skills.web_search.skill_original"
  module: "signalwire.skills.web_search.skill_original"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/web_search/skill_original.py"
---
# `GoogleSearchScraper`

Google Search and Web Scraping functionality

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

- [`__init__`](/reference/python/signalwire/skills/web-search/skill-original/google-search-scraper/init)
- [`extract_text_from_url`](/reference/python/signalwire/skills/web-search/skill-original/google-search-scraper/extract-text-from-url) — Scrape a URL and extract readable text content
- [`search_and_scrape`](/reference/python/signalwire/skills/web-search/skill-original/google-search-scraper/search-and-scrape) — Main function: search Google and scrape the resulting pages
- [`search_google`](/reference/python/signalwire/skills/web-search/skill-original/google-search-scraper/search-google) — Search Google using Custom Search JSON API

## Source

[`/src/signalwire/signalwire/skills/web_search/skill_original.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/web_search/skill_original.py)

Line 21.
