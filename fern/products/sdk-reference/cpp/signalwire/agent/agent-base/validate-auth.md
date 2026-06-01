---
slug: "/reference/cpp/signalwire/agent/agent-base/validate-auth"
title: "validate_auth"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::agent::AgentBase::validate_auth"
  parent: "signalwire::agent::AgentBase"
  module: "signalwire.agent"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp"
  visibility: "protected"
---
# `validate_auth`

**Modifiers:** `const`

## Signature

```cpp
bool validate_auth(const httplib::Request & req, httplib::Response & res) const
```

## Parameters

| Name  | Type                       | Required | Default | Description |
| ----- | -------------------------- | -------- | ------- | ----------- |
| `req` | `const httplib::Request &` | yes      | —       | —           |
| `res` | `httplib::Response &`      | yes      | —       | —           |

## Returns

`bool`

## Source

[`include/signalwire/agent/agent_base.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp)

Line 540.
