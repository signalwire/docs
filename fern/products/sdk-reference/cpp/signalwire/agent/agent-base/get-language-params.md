---
slug: "/reference/cpp/signalwire/agent/agent-base/get-language-params"
title: "get_language_params"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::agent::AgentBase::get_language_params"
  parent: "signalwire::agent::AgentBase"
  module: "signalwire.agent"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp"
  visibility: "public"
---
# `get_language_params`

Read the per-language params dict for a previously-added language. Returns std::nullopt when the code is unknown or when params were never set on that language — no exception path, mirroring Python's None return.
Python parity: AIConfigMixin.get\_language\_params (029ca6f).

**Modifiers:** `const`

## Signature

```cpp
std::optional< json > get_language_params(const std::string & code) const
```

## Parameters

| Name   | Type                  | Required | Default | Description |
| ------ | --------------------- | -------- | ------- | ----------- |
| `code` | `const std::string &` | yes      | —       | —           |

## Returns

`std::optional< json >`

## Source

[`include/signalwire/agent/agent_base.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp)

Line 312.
