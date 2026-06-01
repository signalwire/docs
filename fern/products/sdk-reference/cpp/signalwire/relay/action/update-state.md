---
slug: "/reference/cpp/signalwire/relay/action/update-state"
title: "update_state"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::relay::Action::update_state"
  parent: "signalwire::relay::Action"
  module: "signalwire.relay"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/action.hpp"
  visibility: "public"
---
# `update_state`

Update internal state (called by Call/Client when events arrive).

## Signature

```cpp
void update_state(
    const std::string & new_state,
    const json & result = json::object()
)
```

## Parameters

| Name        | Type                  | Required | Default          | Description |
| ----------- | --------------------- | -------- | ---------------- | ----------- |
| `new_state` | `const std::string &` | yes      | —                | —           |
| `result`    | `const json &`        | no       | `json::object()` | —           |

## Source

[`include/signalwire/relay/action.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/action.hpp)

Line 112.
