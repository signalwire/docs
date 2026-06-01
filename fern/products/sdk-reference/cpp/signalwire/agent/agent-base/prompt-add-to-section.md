---
slug: "/reference/cpp/signalwire/agent/agent-base/prompt-add-to-section"
title: "prompt_add_to_section"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::agent::AgentBase::prompt_add_to_section"
  parent: "signalwire::agent::AgentBase"
  module: "signalwire.agent"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp"
  visibility: "public"
---
# `prompt_add_to_section`

## Signature

```cpp
AgentBase & prompt_add_to_section(
    const std::string & title,
    const std::string & body = "",
    const std::vector< std::string > & bullets = {}
)
```

## Parameters

| Name      | Type                                 | Required | Default | Description |
| --------- | ------------------------------------ | -------- | ------- | ----------- |
| `title`   | `const std::string &`                | yes      | —       | —           |
| `body`    | `const std::string &`                | no       | `""`    | —           |
| `bullets` | `const std::vector< std::string > &` | no       | `{}`    | —           |

## Returns

`AgentBase &`

## Source

[`include/signalwire/agent/agent_base.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp)

Line 149.
