---
slug: "/reference/cpp/signalwire/agent/agent-base/get-raw-prompt"
title: "get_raw_prompt"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::agent::AgentBase::get_raw_prompt"
  parent: "signalwire::agent::AgentBase"
  module: "signalwire.agent"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp"
  visibility: "public"
---
# `get_raw_prompt`

Returns the raw prompt text whatever set\_prompt\_text stored, or std::nullopt when no raw prompt has been set. Distinct from get\_prompt which renders the POM array when use\_pom is true.
Mirrors Python's PromptManager.get\_raw\_prompt.

**Modifiers:** `const`

## Signature

```cpp
std::optional< std::string > get_raw_prompt() const
```

## Returns

`std::optional< std::string >`

## Source

[`include/signalwire/agent/agent_base.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp)

Line 180.
