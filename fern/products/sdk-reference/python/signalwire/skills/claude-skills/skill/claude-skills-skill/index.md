---
slug: "/reference/python/signalwire/skills/claude-skills/skill/claude-skills-skill"
title: "ClaudeSkillsSkill"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.skills.claude_skills.skill.ClaudeSkillsSkill"
  parent: "signalwire.skills.claude_skills.skill"
  module: "signalwire.skills.claude_skills.skill"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/claude_skills/skill.py"
---
# `ClaudeSkillsSkill`

Load Claude-style SKILL.md files as SignalWire agent tools.

This skill parses Claude Code skill directories and makes them available
as SWAIG tools that the AI can call. Each Claude skill becomes a tool
that returns the skill's instructions when invoked.

> ## \[!NOTE]
>
> name: skill-name
> description: When to use this skill
> -----------------------------------
>
> Markdown instructions here...
> Use $ARGUMENTS for passed args.

## Signature

```python
class ClaudeSkillsSkill(SkillBase)
```

## Inheritance

**Extends:** [SkillBase](/reference/python/signalwire/core/skill-base/skill-base)

## Examples

```python
Markdown instructions here...
Use $ARGUMENTS for passed args.
```

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

- [`get_hints`](/reference/python/signalwire/skills/claude-skills/skill/claude-skills-skill/get-hints) — Return speech recognition hints based on loaded skills.
- [`get_instance_key`](/reference/python/signalwire/skills/claude-skills/skill/claude-skills-skill/get-instance-key) — Return unique key for this skill instance.
- [`get_parameter_schema`](/reference/python/signalwire/skills/claude-skills/skill/claude-skills-skill/get-parameter-schema) — Get the parameter schema for the Claude skills loader.
- [`register_tools`](/reference/python/signalwire/skills/claude-skills/skill/claude-skills-skill/register-tools) — Register a SWAIG tool for each discovered Claude skill.
- [`setup`](/reference/python/signalwire/skills/claude-skills/skill/claude-skills-skill/setup) — Setup the Claude skills loader.

## Source

[`/src/signalwire/signalwire/skills/claude_skills/skill.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/claude_skills/skill.py)

Line 38.
