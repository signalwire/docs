---
slug: "/reference/python/signalwire/skills/spider/skill/spider-skill"
title: "SpiderSkill"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.skills.spider.skill.SpiderSkill"
  parent: "signalwire.skills.spider.skill"
  module: "signalwire.skills.spider.skill"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/spider/skill.py"
---
# `SpiderSkill`

Fast web scraping skill optimized for speed and token efficiency.

## Signature

```python
class SpiderSkill(SkillBase)
```

## Inheritance

**Extends:** [SkillBase](/reference/python/signalwire/core/skill-base/skill-base)

## Properties

| Name                          | Type                          | Required | Default | Description |
| ----------------------------- | ----------------------------- | -------- | ------- | ----------- |
| `cache`                       | `cache`                       | yes      | —       | —           |
| `cache_enabled`               | `cache_enabled`               | yes      | —       | —           |
| `clean_text`                  | `clean_text`                  | yes      | —       | —           |
| `concurrent_requests`         | `concurrent_requests`         | yes      | —       | —           |
| `delay`                       | `delay`                       | yes      | —       | —           |
| `extract_type`                | `extract_type`                | yes      | —       | —           |
| `follow_robots_txt`           | `follow_robots_txt`           | yes      | —       | —           |
| `headers`                     | `headers`                     | yes      | —       | —           |
| `max_depth`                   | `max_depth`                   | yes      | —       | —           |
| `max_pages`                   | `max_pages`                   | yes      | —       | —           |
| `max_text_length`             | `max_text_length`             | yes      | —       | —           |
| `remove_xpaths`               | `remove_xpaths`               | yes      | —       | —           |
| `REQUIRED_ENV_VARS`           | `REQUIRED_ENV_VARS`           | yes      | —       | —           |
| `REQUIRED_PACKAGES`           | `REQUIRED_PACKAGES`           | yes      | —       | —           |
| `session`                     | `session`                     | yes      | —       | —           |
| `SKILL_DESCRIPTION`           | `SKILL_DESCRIPTION`           | yes      | —       | —           |
| `SKILL_NAME`                  | `SKILL_NAME`                  | yes      | —       | —           |
| `SKILL_VERSION`               | `SKILL_VERSION`               | yes      | —       | —           |
| `SUPPORTS_MULTIPLE_INSTANCES` | `SUPPORTS_MULTIPLE_INSTANCES` | yes      | —       | —           |
| `timeout`                     | `timeout`                     | yes      | —       | —           |
| `user_agent`                  | `user_agent`                  | yes      | —       | —           |
| `WHITESPACE_REGEX`            | `WHITESPACE_REGEX`            | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/skills/spider/skill/spider-skill/init) — Initialize the spider skill with configuration parameters.
- [`cleanup`](/reference/python/signalwire/skills/spider/skill/spider-skill/cleanup) — Clean up resources when skill is unloaded.
- [`get_hints`](/reference/python/signalwire/skills/spider/skill/spider-skill/get-hints) — Return speech recognition hints for this skill.
- [`get_instance_key`](/reference/python/signalwire/skills/spider/skill/spider-skill/get-instance-key) — Return unique key for this skill instance.
- [`get_parameter_schema`](/reference/python/signalwire/skills/spider/skill/spider-skill/get-parameter-schema) — Get parameter schema for Spider skill
- [`register_tools`](/reference/python/signalwire/skills/spider/skill/spider-skill/register-tools) — Register the web scraping tools with the agent.
- [`setup`](/reference/python/signalwire/skills/spider/skill/spider-skill/setup) — Validate configuration and setup the skill.

## Source

[`/src/signalwire/signalwire/skills/spider/skill.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/spider/skill.py)

Line 24.
