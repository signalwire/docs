---
slug: "/reference/python/signalwire/skills/mcp-gateway/skill/mcp-gateway-skill"
title: "MCPGatewaySkill"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.skills.mcp_gateway.skill.MCPGatewaySkill"
  parent: "signalwire.skills.mcp_gateway.skill"
  module: "signalwire.skills.mcp_gateway.skill"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/mcp_gateway/skill.py"
---
# `MCPGatewaySkill`

MCP Gateway Skill - Bridge MCP servers with SWAIG functions

This skill connects SignalWire agents to MCP (Model Context Protocol) servers
through a gateway service, dynamically creating SWAIG functions for MCP tools.

## Signature

```python
class MCPGatewaySkill(SkillBase)
```

## Inheritance

**Extends:** [SkillBase](/reference/python/signalwire/core/skill-base/skill-base)

## Properties

| Name                | Type                | Required | Default | Description |
| ------------------- | ------------------- | -------- | ------- | ----------- |
| `REQUIRED_ENV_VARS` | `REQUIRED_ENV_VARS` | yes      | —       | —           |
| `REQUIRED_PACKAGES` | `REQUIRED_PACKAGES` | yes      | —       | —           |
| `SKILL_DESCRIPTION` | `SKILL_DESCRIPTION` | yes      | —       | —           |
| `SKILL_NAME`        | `SKILL_NAME`        | yes      | —       | —           |
| `SKILL_VERSION`     | `SKILL_VERSION`     | yes      | —       | —           |

## Methods

- [`get_global_data`](/reference/python/signalwire/skills/mcp-gateway/skill/mcp-gateway-skill/get-global-data) — Return global data for DataMap variables
- [`get_hints`](/reference/python/signalwire/skills/mcp-gateway/skill/mcp-gateway-skill/get-hints) — Return speech recognition hints
- [`get_parameter_schema`](/reference/python/signalwire/skills/mcp-gateway/skill/mcp-gateway-skill/get-parameter-schema) — Get parameter schema for MCP Gateway skill
- [`get_prompt_sections`](/reference/python/signalwire/skills/mcp-gateway/skill/mcp-gateway-skill/get-prompt-sections) — Return prompt sections to add to agent
- [`register_tools`](/reference/python/signalwire/skills/mcp-gateway/skill/mcp-gateway-skill/register-tools) — Register SWAIG tools from MCP services
- [`setup`](/reference/python/signalwire/skills/mcp-gateway/skill/mcp-gateway-skill/setup) — Setup and validate skill configuration

## Source

[`/src/signalwire/signalwire/skills/mcp_gateway/skill.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/mcp_gateway/skill.py)

Line 22.
