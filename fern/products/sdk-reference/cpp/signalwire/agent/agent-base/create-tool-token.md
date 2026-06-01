---
slug: "/reference/cpp/signalwire/agent/agent-base/create-tool-token"
title: "create_tool_token"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::agent::AgentBase::create_tool_token"
  parent: "signalwire::agent::AgentBase"
  module: "signalwire.agent"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp"
  visibility: "public"
---
# `create_tool_token`

Mint a per-call SWAIG-function token via the agent's SessionManager.
Python parity: state\_mixin.StateMixin.\_create\_tool\_token — delegates to SessionManager::create\_token and returns an empty string on any thrown exception (Python catches all exceptions and returns "" on error).

**Modifiers:** `const`

## Signature

```cpp
std::string create_tool_token(
    const std::string & tool_name,
    const std::string & call_id
) const
```

## Parameters

| Name        | Type                  | Required | Default | Description |
| ----------- | --------------------- | -------- | ------- | ----------- |
| `tool_name` | `const std::string &` | yes      | —       | —           |
| `call_id`   | `const std::string &` | yes      | —       | —           |

## Returns

`std::string`

## Source

[`include/signalwire/agent/agent_base.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp)

Line 273.
