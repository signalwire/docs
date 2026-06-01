---
slug: "/reference/cpp/signalwire/relay/call/play-and-collect"
title: "play_and_collect"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::relay::Call::play_and_collect"
  parent: "signalwire::relay::Call"
  module: "signalwire.relay"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/call.hpp"
  visibility: "public"
---
# `play_and_collect`

## Signature

```cpp
Action play_and_collect(
    const json & play_media,
    const json & collect_params,
    const std::string & control_id = ""
)
```

## Parameters

| Name             | Type                  | Required | Default | Description |
| ---------------- | --------------------- | -------- | ------- | ----------- |
| `play_media`     | `const json &`        | yes      | —       | —           |
| `collect_params` | `const json &`        | yes      | —       | —           |
| `control_id`     | `const std::string &` | no       | `""`    | —           |

## Returns

`Action`

## Source

[`include/signalwire/relay/call.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/call.hpp)

Line 59.
