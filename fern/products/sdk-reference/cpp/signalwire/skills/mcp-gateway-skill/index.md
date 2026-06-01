---
slug: "/reference/cpp/signalwire/skills/mcp-gateway-skill"
title: "McpGatewaySkill"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::skills::McpGatewaySkill"
  parent: "signalwire::skills"
  module: "signalwire.skills"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/src/skills/builtin/mcp_gateway.cpp"
  visibility: "public"
---
# `McpGatewaySkill`

## Signature

```cpp
class signalwire::skills::McpGatewaySkill : signalwire::skills::SkillBase
```

## Inheritance

**Extends:** [signalwire::skills::SkillBase](/reference/cpp/signalwire/skills/skill-base)

## Methods

- [`get_global_data`](/reference/cpp/signalwire/skills/mcp-gateway-skill/get-global-data) — Get global data to merge into agent.
- [`get_hints`](/reference/cpp/signalwire/skills/mcp-gateway-skill/get-hints) — Get speech recognition hints to merge into agent.
- [`get_prompt_sections`](/reference/cpp/signalwire/skills/mcp-gateway-skill/get-prompt-sections) — Get prompt sections to inject into agent.
- [`register_tools`](/reference/cpp/signalwire/skills/mcp-gateway-skill/register-tools) — Register tools with the agent. Returns tool definitions.
- [`setup`](/reference/cpp/signalwire/skills/mcp-gateway-skill/setup) — Initialize the skill with given params. Return true on success.
- [`skill_description`](/reference/cpp/signalwire/skills/mcp-gateway-skill/skill-description)
- [`skill_name`](/reference/cpp/signalwire/skills/mcp-gateway-skill/skill-name)

## Source

[`src/skills/builtin/mcp_gateway.cpp`](https://github.com/signalwire/signalwire-cpp/blob/main/src/skills/builtin/mcp_gateway.cpp)

Line 9.
