---
slug: "/reference/python/signalwire/skills/wikipedia-search/skill/wikipedia-search-skill"
title: "WikipediaSearchSkill"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.skills.wikipedia_search.skill.WikipediaSearchSkill"
  parent: "signalwire.skills.wikipedia_search.skill"
  module: "signalwire.skills.wikipedia_search.skill"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/wikipedia_search/skill.py"
---
# `WikipediaSearchSkill`

Skill for searching Wikipedia articles and retrieving content.

This skill uses the Wikipedia API to search for articles and retrieve
their introductory content, similar to getting a summary of a topic.

## Signature

```python
class WikipediaSearchSkill(SkillBase)
```

## Inheritance

**Extends:** [SkillBase](/reference/python/signalwire/core/skill-base/skill-base)

## Properties

| Name                          | Type                          | Required | Default | Description |
| ----------------------------- | ----------------------------- | -------- | ------- | ----------- |
| `REQUIRED_ENV_VARS`           | `REQUIRED_ENV_VARS`           | yes      | —       | —           |
| `REQUIRED_PACKAGES`           | `REQUIRED_PACKAGES`           | yes      | —       | —           |
| `SKILL_DESCRIPTION`           | `SKILL_DESCRIPTION`           | yes      | —       | —           |
| `SKILL_NAME`                  | `SKILL_NAME`                  | yes      | —       | —           |
| `SKILL_VERSION`               | `SKILL_VERSION`               | yes      | —       | —           |
| `SUPPORTS_MULTIPLE_INSTANCES` | `SUPPORTS_MULTIPLE_INSTANCES` | yes      | —       | —           |

## Methods

- [`get_hints`](/reference/python/signalwire/skills/wikipedia-search/skill/wikipedia-search-skill/get-hints) — Return speech recognition hints for better accuracy.
- [`get_parameter_schema`](/reference/python/signalwire/skills/wikipedia-search/skill/wikipedia-search-skill/get-parameter-schema) — Get parameter schema for Wikipedia search skill
- [`get_prompt_sections`](/reference/python/signalwire/skills/wikipedia-search/skill/wikipedia-search-skill/get-prompt-sections) — Return additional context for the agent prompt.
- [`register_tools`](/reference/python/signalwire/skills/wikipedia-search/skill/wikipedia-search-skill/register-tools) — Register the SWAIG tool for Wikipedia search.
- [`search_wiki`](/reference/python/signalwire/skills/wikipedia-search/skill/wikipedia-search-skill/search-wiki) — Search Wikipedia for articles matching the query.
- [`setup`](/reference/python/signalwire/skills/wikipedia-search/skill/wikipedia-search-skill/setup) — Setup the Wikipedia search skill.

## Source

[`/src/signalwire/signalwire/skills/wikipedia_search/skill.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/wikipedia_search/skill.py)

Line 22.
