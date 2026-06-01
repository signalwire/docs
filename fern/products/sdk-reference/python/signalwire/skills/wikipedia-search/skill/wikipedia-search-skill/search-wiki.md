---
slug: "/reference/python/signalwire/skills/wikipedia-search/skill/wikipedia-search-skill/search-wiki"
title: "search_wiki"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.skills.wikipedia_search.skill.WikipediaSearchSkill.search_wiki"
  parent: "signalwire.skills.wikipedia_search.skill.WikipediaSearchSkill"
  module: "signalwire.skills.wikipedia_search.skill"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/wikipedia_search/skill.py"
---
# `search_wiki`

Search Wikipedia for articles matching the query.

## Signature

```python
search_wiki(query: str) -> str
```

## Parameters

| Name    | Type  | Required | Default | Description                |
| ------- | ----- | -------- | ------- | -------------------------- |
| `query` | `str` | yes      | —       | The search term to look up |

## Returns

`str` — String containing the Wikipedia article content or error message

## Source

[`/src/signalwire/signalwire/skills/wikipedia_search/skill.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/wikipedia_search/skill.py)

Line 110.
