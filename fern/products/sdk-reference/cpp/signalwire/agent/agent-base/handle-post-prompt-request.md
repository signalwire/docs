---
slug: "/reference/cpp/signalwire/agent/agent-base/handle-post-prompt-request"
title: "handle_post_prompt_request"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::agent::AgentBase::handle_post_prompt_request"
  parent: "signalwire::agent::AgentBase"
  module: "signalwire.agent"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp"
  visibility: "protected"
---
# `handle_post_prompt_request`

## Signature

```cpp
void handle_post_prompt_request(
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

[`include/signalwire/agent/agent_base.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp)

Line 537.
