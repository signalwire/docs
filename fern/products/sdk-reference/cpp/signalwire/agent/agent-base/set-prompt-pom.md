---
slug: "/reference/cpp/signalwire/agent/agent-base/set-prompt-pom"
title: "set_prompt_pom"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::agent::AgentBase::set_prompt_pom"
  parent: "signalwire::agent::AgentBase"
  module: "signalwire.agent"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp"
  visibility: "public"
---
# `set_prompt_pom`

Sets the prompt as a list of POM section JSON objects. Each section supports keys "title", "body", "bullets", "numbered", "numbered\_bullets", and "subsections". Switches the agent to POM mode.
Mirrors Python's PromptManager.set\_prompt\_pom.

## Signature

```cpp
AgentBase & set_prompt_pom(const std::vector< json > & pom)
```

## Parameters

| Name  | Type                          | Required | Default | Description |
| ----- | ----------------------------- | -------- | ------- | ----------- |
| `pom` | `const std::vector< json > &` | yes      | —       | —           |

## Returns

`AgentBase &`

## Source

[`include/signalwire/agent/agent_base.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp)

Line 188.
