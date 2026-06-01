---
slug: "/reference/cpp/signalwire/agent/agent-base/on-function-call"
title: "on_function_call"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::agent::AgentBase::on_function_call"
  parent: "signalwire::agent::AgentBase"
  module: "signalwire.agent"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp"
  visibility: "public"
---
# `on_function_call`

Dispatch a function call to the registered handler. Returns a FunctionResult; if the function isn't registered, returns a FunctionResult with a "Function not found" response.

**Modifiers:** `virtual`

## Signature

```cpp
swaig::FunctionResult on_function_call(
    const std::string & name,
    const json & args,
    const json & raw_data
)
```

## Parameters

| Name       | Type                  | Required | Default | Description |
| ---------- | --------------------- | -------- | ------- | ----------- |
| `name`     | `const std::string &` | yes      | —       | —           |
| `args`     | `const json &`        | yes      | —       | —           |
| `raw_data` | `const json &`        | yes      | —       | —           |

## Returns

`swaig::FunctionResult`

## Source

[`include/signalwire/agent/agent_base.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp)

Line 262.
