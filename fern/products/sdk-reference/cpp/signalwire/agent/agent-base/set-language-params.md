---
slug: "/reference/cpp/signalwire/agent/agent-base/set-language-params"
title: "set_language_params"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::agent::AgentBase::set_language_params"
  parent: "signalwire::agent::AgentBase"
  module: "signalwire.agent"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp"
  visibility: "public"
---
# `set_language_params`

Set (or replace) the per-language params dict on an already-added language. Useful when language entries are built via add\_language() first and engine-specific tuning is added later (e.g. from a config loader). Passing an empty object removes the params key (treated as unset). No-op if code isn't found among previously-added languages.
Python parity: AIConfigMixin.set\_language\_params (029ca6f).

## Signature

```cpp
AgentBase & set_language_params(const std::string & code, const json & params)
```

## Parameters

| Name     | Type                  | Required | Default | Description |
| -------- | --------------------- | -------- | ------- | ----------- |
| `code`   | `const std::string &` | yes      | —       | —           |
| `params` | `const json &`        | yes      | —       | —           |

## Returns

`AgentBase &`

## Source

[`include/signalwire/agent/agent_base.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp)

Line 304.
