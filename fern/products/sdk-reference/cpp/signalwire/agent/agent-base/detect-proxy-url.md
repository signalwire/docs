---
slug: "/reference/cpp/signalwire/agent/agent-base/detect-proxy-url"
title: "detect_proxy_url"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::agent::AgentBase::detect_proxy_url"
  parent: "signalwire::agent::AgentBase"
  module: "signalwire.agent"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp"
  visibility: "protected"
---
# `detect_proxy_url`

**Modifiers:** `const`

## Signature

```cpp
std::string detect_proxy_url(
    const std::map< std::string, std::string > & headers
) const
```

## Parameters

| Name      | Type                                           | Required | Default | Description |
| --------- | ---------------------------------------------- | -------- | ------- | ----------- |
| `headers` | `const std::map< std::string, std::string > &` | yes      | —       | —           |

## Returns

`std::string`

## Source

[`include/signalwire/agent/agent_base.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp)

Line 513.
