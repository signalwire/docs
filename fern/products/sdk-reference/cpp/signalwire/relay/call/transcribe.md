---
slug: "/reference/cpp/signalwire/relay/call/transcribe"
title: "transcribe"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::relay::Call::transcribe"
  parent: "signalwire::relay::Call"
  module: "signalwire.relay"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/call.hpp"
  visibility: "public"
---
# `transcribe`

## Signature

```cpp
Action transcribe(
    const json & params = json::object(),
    const std::string & control_id = ""
)
```

## Parameters

| Name         | Type                  | Required | Default          | Description |
| ------------ | --------------------- | -------- | ---------------- | ----------- |
| `params`     | `const json &`        | no       | `json::object()` | —           |
| `control_id` | `const std::string &` | no       | `""`             | —           |

## Returns

`Action`

## Source

[`include/signalwire/relay/call.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/call.hpp)

Line 75.
