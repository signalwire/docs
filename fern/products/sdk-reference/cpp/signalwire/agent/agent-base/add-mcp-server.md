---
slug: "/reference/cpp/signalwire/agent/agent-base/add-mcp-server"
title: "add_mcp_server"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::agent::AgentBase::add_mcp_server"
  parent: "signalwire::agent::AgentBase"
  module: "signalwire.agent"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp"
  visibility: "public"
---
# `add_mcp_server`

## Signature

```cpp
AgentBase & add_mcp_server(
    const std::string & url,
    const std::map< std::string, std::string > & headers = {},
    bool resources = false,
    const std::map< std::string, std::string > & resource_vars = {}
)
```

## Parameters

| Name            | Type                                           | Required | Default | Description |
| --------------- | ---------------------------------------------- | -------- | ------- | ----------- |
| `url`           | `const std::string &`                          | yes      | —       | —           |
| `headers`       | `const std::map< std::string, std::string > &` | no       | `{}`    | —           |
| `resources`     | `bool`                                         | no       | `false` | —           |
| `resource_vars` | `const std::map< std::string, std::string > &` | no       | `{}`    | —           |

## Returns

`AgentBase &`

## Source

[`include/signalwire/agent/agent_base.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp)

Line 411.
