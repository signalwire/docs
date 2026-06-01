---
slug: "/reference/cpp/signalwire/agent/agent-base/add-skill"
title: "add_skill"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::agent::AgentBase::add_skill"
  parent: "signalwire::agent::AgentBase"
  module: "signalwire.agent"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp"
  visibility: "public"
---
# `add_skill`

## Signature

```cpp
AgentBase & add_skill(
    const std::string & skill_name,
    const json & params = json::object()
)
```

## Parameters

| Name         | Type                  | Required | Default          | Description |
| ------------ | --------------------- | -------- | ---------------- | ----------- |
| `skill_name` | `const std::string &` | yes      | —                | —           |
| `params`     | `const json &`        | no       | `json::object()` | —           |

## Returns

`AgentBase &`

## Source

[`include/signalwire/agent/agent_base.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp)

Line 402.
