---
slug: "/reference/cpp/signalwire/server/agent-server/map-sip-username"
title: "map_sip_username"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::server::AgentServer::map_sip_username"
  parent: "signalwire::server::AgentServer"
  module: "signalwire.server"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/server/agent_server.hpp"
  visibility: "public"
---
# `map_sip_username`

Map a SIP username to an agent route.

## Signature

```cpp
AgentServer & map_sip_username(
    const std::string & username,
    const std::string & route
)
```

## Parameters

| Name       | Type                  | Required | Default | Description |
| ---------- | --------------------- | -------- | ------- | ----------- |
| `username` | `const std::string &` | yes      | —       | —           |
| `route`    | `const std::string &` | yes      | —       | —           |

## Returns

`AgentServer &`

## Source

[`include/signalwire/server/agent_server.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/server/agent_server.hpp)

Line 40.
