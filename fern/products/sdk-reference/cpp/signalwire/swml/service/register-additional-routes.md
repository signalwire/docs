---
slug: "/reference/cpp/signalwire/swml/service/register-additional-routes"
title: "register_additional_routes"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::swml::Service::register_additional_routes"
  parent: "signalwire::swml::Service"
  module: "signalwire.swml"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/service.hpp"
  visibility: "protected"
---
# `register_additional_routes`

Extension point: register additional HTTP routes. AgentBase uses this to add /post\_prompt, /mcp, etc.

**Modifiers:** `virtual`

## Signature

```cpp
void register_additional_routes(httplib::Server & server)
```

## Parameters

| Name     | Type                | Required | Default | Description |
| -------- | ------------------- | -------- | ------- | ----------- |
| `server` | `httplib::Server &` | yes      | —       | —           |

## Source

[`include/signalwire/swml/service.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/service.hpp)

Line 272.
