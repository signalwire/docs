---
slug: "/reference/python/signalwire/core/skill-base/skill-base"
title: "SkillBase"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.core.skill_base.SkillBase"
  parent: "signalwire.core.skill_base"
  module: "signalwire.core.skill_base"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/skill_base.py"
---
# `SkillBase`

Abstract base class for all agent skills

## Signature

```python
class SkillBase(ABC)
```

## Inheritance

**Extends:** `ABC`

## Properties

| Name                          | Type           | Required | Default | Description |
| ----------------------------- | -------------- | -------- | ------- | ----------- |
| `agent`                       | `agent`        | yes      | —       | —           |
| `logger`                      | `logger`       | yes      | —       | —           |
| `params`                      | `params`       | yes      | —       | —           |
| `REQUIRED_ENV_VARS`           | `List[str]`    | yes      | —       | —           |
| `REQUIRED_PACKAGES`           | `List[str]`    | yes      | —       | —           |
| `SKILL_DESCRIPTION`           | `str`          | yes      | —       | —           |
| `SKILL_NAME`                  | `str`          | yes      | —       | —           |
| `SKILL_VERSION`               | `str`          | yes      | —       | —           |
| `SUPPORTS_MULTIPLE_INSTANCES` | `bool`         | yes      | —       | —           |
| `swaig_fields`                | `swaig_fields` | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/core/skill-base/skill-base/init)
- [`cleanup`](/reference/python/signalwire/core/skill-base/skill-base/cleanup) — Cleanup when skill is removed or agent shuts down
- [`define_tool`](/reference/python/signalwire/core/skill-base/skill-base/define-tool) — Wrapper method that automatically includes swaig\_fields when defining tools.
- [`get_global_data`](/reference/python/signalwire/core/skill-base/skill-base/get-global-data) — Return data to add to agent's global context
- [`get_hints`](/reference/python/signalwire/core/skill-base/skill-base/get-hints) — Return speech recognition hints for this skill
- [`get_instance_key`](/reference/python/signalwire/core/skill-base/skill-base/get-instance-key) — Get the key used to track this skill instance
- [`get_parameter_schema`](/reference/python/signalwire/core/skill-base/skill-base/get-parameter-schema) — Get the parameter schema for this skill
- [`get_prompt_sections`](/reference/python/signalwire/core/skill-base/skill-base/get-prompt-sections) — Return prompt sections to add to agent. Returns empty list if skip\_prompt is set to True in params.
- [`get_skill_data`](/reference/python/signalwire/core/skill-base/skill-base/get-skill-data) — Read this skill instance's namespaced data from raw\_data global\_data.
- [`register_tools`](/reference/python/signalwire/core/skill-base/skill-base/register-tools) — Register SWAIG tools with the agent
- [`setup`](/reference/python/signalwire/core/skill-base/skill-base/setup) — Setup the skill (validate env vars, initialize APIs, etc.) Returns True if setup successful, False otherwise
- [`update_skill_data`](/reference/python/signalwire/core/skill-base/skill-base/update-skill-data) — Write this skill instance's namespaced data into a FunctionResult.
- [`validate_env_vars`](/reference/python/signalwire/core/skill-base/skill-base/validate-env-vars) — Check if all required environment variables are set
- [`validate_packages`](/reference/python/signalwire/core/skill-base/skill-base/validate-packages) — Check if all required packages are available

## Source

[`/src/signalwire/signalwire/core/skill_base.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/skill_base.py)

Line 19.
