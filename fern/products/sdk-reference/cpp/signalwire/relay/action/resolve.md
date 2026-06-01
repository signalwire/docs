---
slug: "/reference/cpp/signalwire/relay/action/resolve"
title: "resolve"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::relay::Action::resolve"
  parent: "signalwire::relay::Action"
  module: "signalwire.relay"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/action.hpp"
  visibility: "public"
---
# `resolve`

Resolve the action immediately (used for call-gone scenarios).

## Signature

```cpp
void resolve(
    const std::string & final_state = "finished",
    const json & result = json::object()
)
```

## Parameters

| Name          | Type                  | Required | Default          | Description |
| ------------- | --------------------- | -------- | ---------------- | ----------- |
| `final_state` | `const std::string &` | no       | `"finished"`     | —           |
| `result`      | `const json &`        | no       | `json::object()` | —           |

## Source

[`include/signalwire/relay/action.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/action.hpp)

Line 115.
