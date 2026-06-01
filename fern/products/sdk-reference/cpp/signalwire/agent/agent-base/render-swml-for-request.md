---
slug: "/reference/cpp/signalwire/agent/agent-base/render-swml-for-request"
title: "render_swml_for_request"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::agent::AgentBase::render_swml_for_request"
  parent: "signalwire::agent::AgentBase"
  module: "signalwire.agent"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp"
  visibility: "public"
---
# `render_swml_for_request`

**Modifiers:** `const`

## Signature

```cpp
json render_swml_for_request(
    const std::map< std::string, std::string > & query_params,
    const json & body_params,
    const std::map< std::string, std::string > & headers
) const
```

## Parameters

| Name           | Type                                           | Required | Default | Description |
| -------------- | ---------------------------------------------- | -------- | ------- | ----------- |
| `query_params` | `const std::map< std::string, std::string > &` | yes      | —       | —           |
| `body_params`  | `const json &`                                 | yes      | —       | —           |
| `headers`      | `const std::map< std::string, std::string > &` | yes      | —       | —           |

## Returns

`json`

## Source

[`include/signalwire/agent/agent_base.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp)

Line 490.
