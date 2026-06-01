---
slug: "/reference/cpp/signalwire/agent/agent-base/agent-base"
title: "AgentBase"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::agent::AgentBase::AgentBase"
  parent: "signalwire::agent::AgentBase"
  module: "signalwire.agent"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp"
  visibility: "public"
---
# `AgentBase`

**Modifiers:** `explicit`

## Signature

**Overload 1**

```cpp
void AgentBase(
    const std::string & name = "agent",
    const std::string & route = "/",
    const std::string & host = "0.0.0.0",
    int port = 3000
)
```

**Overload 2**

```cpp
void AgentBase(const AgentBase & other)
```

## Parameters (Overload 1)

| Name    | Type                  | Required | Default     | Description |
| ------- | --------------------- | -------- | ----------- | ----------- |
| `name`  | `const std::string &` | no       | `"agent"`   | —           |
| `route` | `const std::string &` | no       | `"/"`       | —           |
| `host`  | `const std::string &` | no       | `"0.0.0.0"` | —           |
| `port`  | `int`                 | no       | `3000`      | —           |

## Parameters (Overload 2)

| Name    | Type                | Required | Default | Description |
| ------- | ------------------- | -------- | ------- | ----------- |
| `other` | `const AgentBase &` | yes      | —       | —           |

## Source

[`include/signalwire/agent/agent_base.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp)

Line 115.
