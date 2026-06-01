---
slug: "/reference/cpp/signalwire/relay/call/join-conference"
title: "join_conference"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::relay::Call::join_conference"
  parent: "signalwire::relay::Call"
  module: "signalwire.relay"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/call.hpp"
  visibility: "public"
---
# `join_conference`

## Signature

```cpp
Action join_conference(
    const std::string & name,
    const json & params = json::object()
)
```

## Parameters

| Name     | Type                  | Required | Default          | Description |
| -------- | --------------------- | -------- | ---------------- | ----------- |
| `name`   | `const std::string &` | yes      | —                | —           |
| `params` | `const json &`        | no       | `json::object()` | —           |

## Returns

`Action`

## Source

[`include/signalwire/relay/call.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/call.hpp)

Line 91.
