---
slug: "/reference/cpp/signalwire/relay/call/prompt"
title: "prompt"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::relay::Call::prompt"
  parent: "signalwire::relay::Call"
  module: "signalwire.relay"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/call.hpp"
  visibility: "public"
---
# `prompt`

## Signature

```cpp
Action prompt(
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

Line 57.
