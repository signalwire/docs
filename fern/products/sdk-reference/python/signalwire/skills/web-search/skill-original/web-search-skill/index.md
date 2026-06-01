---
slug: "/reference/python/signalwire/skills/web-search/skill-original/web-search-skill"
title: "WebSearchSkill"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.skills.web_search.skill_original.WebSearchSkill"
  parent: "signalwire.skills.web_search.skill_original"
  module: "signalwire.skills.web_search.skill_original"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/web_search/skill_original.py"
---
# `WebSearchSkill`

Web search capability using Google Custom Search API

## Signature

```python
class WebSearchSkill(SkillBase)
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

- [`get_global_data`](/reference/python/signalwire/skills/web-search/skill-original/web-search-skill/get-global-data) — Return global data for agent context
- [`get_hints`](/reference/python/signalwire/skills/web-search/skill-original/web-search-skill/get-hints) — Return speech recognition hints
- [`get_instance_key`](/reference/python/signalwire/skills/web-search/skill-original/web-search-skill/get-instance-key) — Get the key used to track this skill instance
- [`get_parameter_schema`](/reference/python/signalwire/skills/web-search/skill-original/web-search-skill/get-parameter-schema) — Get the parameter schema for the web search skill
- [`get_prompt_sections`](/reference/python/signalwire/skills/web-search/skill-original/web-search-skill/get-prompt-sections) — Return prompt sections to add to agent
- [`register_tools`](/reference/python/signalwire/skills/web-search/skill-original/web-search-skill/register-tools) — Register web search tool with the agent
- [`setup`](/reference/python/signalwire/skills/web-search/skill-original/web-search-skill/setup) — Setup the web search skill

## Source

[`/src/signalwire/signalwire/skills/web_search/skill_original.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/web_search/skill_original.py)

Line 146.
