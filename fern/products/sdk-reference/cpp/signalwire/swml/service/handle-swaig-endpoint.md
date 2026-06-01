---
slug: "/reference/cpp/signalwire/swml/service/handle-swaig-endpoint"
title: "handle_swaig_endpoint"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::swml::Service::handle_swaig_endpoint"
  parent: "signalwire::swml::Service"
  module: "signalwire.swml"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/service.hpp"
  visibility: "protected"
---
# `handle_swaig_endpoint`

Handle GET/POST /swaig (lifted from AgentBase).

## Signature

```cpp
void handle_swaig_endpoint(
    const httplib::Request & req,
    httplib::Response & res
)
```

## Parameters

| Name  | Type                       | Required | Default | Description |
| ----- | -------------------------- | -------- | ------- | ----------- |
| `req` | `const httplib::Request &` | yes      | —       | —           |
| `res` | `httplib::Response &`      | yes      | —       | —           |

## Source

[`include/signalwire/swml/service.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/service.hpp)

Line 281.
