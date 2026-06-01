---
slug: "/reference/python/signalwire/skills/play-background-file/skill/play-background-file-skill"
title: "PlayBackgroundFileSkill"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.skills.play_background_file.skill.PlayBackgroundFileSkill"
  parent: "signalwire.skills.play_background_file.skill"
  module: "signalwire.skills.play_background_file.skill"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/play_background_file/skill.py"
---
# `PlayBackgroundFileSkill`

Skill for playing background files (audio/video) with configurable tool names.

Supports multiple instances with different tool names and file collections.
Uses DataMap for serverless execution with dynamic enum generation.

Configuration:

- tool\_name: Custom name for the generated SWAIG function
- files: Array of file objects with key, description, url, and optional wait

> \[!NOTE]
> agent.add\_skill("play\_background\_file", {
> "tool\_name": "play\_testimonial",
> "files": \[
> {
> "key": "massey",
> "description": "Customer success story from Massey Energy",
> "url": "https://example.com/massey.mp4",
> "wait": True
> }
> ]
> })

## Signature

```python
class PlayBackgroundFileSkill(SkillBase)
```

## Inheritance

**Extends:** [SkillBase](/reference/python/signalwire/core/skill-base/skill-base)

## Properties

| Name                          | Type                          | Required | Default | Description |
| ----------------------------- | ----------------------------- | -------- | ------- | ----------- |
| `files`                       | `files`                       | yes      | —       | —           |
| `SKILL_DESCRIPTION`           | `SKILL_DESCRIPTION`           | yes      | —       | —           |
| `SKILL_NAME`                  | `SKILL_NAME`                  | yes      | —       | —           |
| `SUPPORTS_MULTIPLE_INSTANCES` | `SUPPORTS_MULTIPLE_INSTANCES` | yes      | —       | —           |
| `tool_name`                   | `tool_name`                   | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/skills/play-background-file/skill/play-background-file-skill/init) — Initialize the skill with configuration parameters.
- [`get_instance_key`](/reference/python/signalwire/skills/play-background-file/skill/play-background-file-skill/get-instance-key) — Generate a unique instance key for this skill configuration.
- [`get_parameter_schema`](/reference/python/signalwire/skills/play-background-file/skill/play-background-file-skill/get-parameter-schema) — Get parameter schema for Play Background File skill
- [`get_tools`](/reference/python/signalwire/skills/play-background-file/skill/play-background-file-skill/get-tools) — Generate the SWAIG tool with DataMap expressions.
- [`register_tools`](/reference/python/signalwire/skills/play-background-file/skill/play-background-file-skill/register-tools) — Register SWAIG tools with the agent
- [`setup`](/reference/python/signalwire/skills/play-background-file/skill/play-background-file-skill/setup) — Setup the skill - no external dependencies needed.

## Source

[`/src/signalwire/signalwire/skills/play_background_file/skill.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/play_background_file/skill.py)

Line 22.
