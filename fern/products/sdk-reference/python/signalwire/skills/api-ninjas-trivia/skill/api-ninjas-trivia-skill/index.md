---
slug: "/reference/python/signalwire/skills/api-ninjas-trivia/skill/api-ninjas-trivia-skill"
title: "ApiNinjasTriviaSkill"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.skills.api_ninjas_trivia.skill.ApiNinjasTriviaSkill"
  parent: "signalwire.skills.api_ninjas_trivia.skill"
  module: "signalwire.skills.api_ninjas_trivia.skill"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/api_ninjas_trivia/skill.py"
---
# `ApiNinjasTriviaSkill`

Skill for getting trivia questions from API Ninjas with configurable categories.

Supports multiple instances with different tool names and category combinations.
Uses DataMap for serverless execution with dynamic enum generation.

Configuration:

- tool\_name: Custom name for the generated SWAIG function
- api\_key: API Ninjas API key
- categories: Array of category strings to enable

Available categories:

- artliterature: Art and Literature
- language: Language
- sciencenature: Science and Nature
- general: General Knowledge
- fooddrink: Food and Drink
- peopleplaces: People and Places
- geography: Geography
- historyholidays: History and Holidays
- entertainment: Entertainment
- toysgames: Toys and Games
- music: Music
- mathematics: Mathematics
- religionmythology: Religion and Mythology
- sportsleisure: Sports and Leisure

> \[!NOTE]
> agent.add\_skill("api\_ninjas\_trivia", {
> "tool\_name": "get\_science\_trivia",
> "api\_key": "your\_api\_key",
> "categories": \["sciencenature", "mathematics", "general"]
> })

## Signature

```python
class ApiNinjasTriviaSkill(SkillBase)
```

## Inheritance

**Extends:** [SkillBase](/reference/python/signalwire/core/skill-base/skill-base)

## Properties

| Name                          | Type                          | Required | Default | Description |
| ----------------------------- | ----------------------------- | -------- | ------- | ----------- |
| `api_key`                     | `api_key`                     | yes      | —       | —           |
| `categories`                  | `categories`                  | yes      | —       | —           |
| `REQUIRED_ENV_VARS`           | `REQUIRED_ENV_VARS`           | yes      | —       | —           |
| `SKILL_DESCRIPTION`           | `SKILL_DESCRIPTION`           | yes      | —       | —           |
| `SKILL_NAME`                  | `SKILL_NAME`                  | yes      | —       | —           |
| `SUPPORTS_MULTIPLE_INSTANCES` | `SUPPORTS_MULTIPLE_INSTANCES` | yes      | —       | —           |
| `tool_name`                   | `tool_name`                   | yes      | —       | —           |
| `VALID_CATEGORIES`            | `VALID_CATEGORIES`            | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/skills/api-ninjas-trivia/skill/api-ninjas-trivia-skill/init) — Initialize the skill with configuration parameters.
- [`get_instance_key`](/reference/python/signalwire/skills/api-ninjas-trivia/skill/api-ninjas-trivia-skill/get-instance-key) — Generate a unique instance key for this skill configuration.
- [`get_parameter_schema`](/reference/python/signalwire/skills/api-ninjas-trivia/skill/api-ninjas-trivia-skill/get-parameter-schema) — Get the parameter schema for the API Ninjas Trivia skill.
- [`get_tools`](/reference/python/signalwire/skills/api-ninjas-trivia/skill/api-ninjas-trivia-skill/get-tools) — Generate the SWAIG tool with DataMap webhook.
- [`register_tools`](/reference/python/signalwire/skills/api-ninjas-trivia/skill/api-ninjas-trivia-skill/register-tools) — Register SWAIG tools with the agent
- [`setup`](/reference/python/signalwire/skills/api-ninjas-trivia/skill/api-ninjas-trivia-skill/setup) — Setup the skill - validates API key is available.

## Source

[`/src/signalwire/signalwire/skills/api_ninjas_trivia/skill.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/api_ninjas_trivia/skill.py)

Line 22.
