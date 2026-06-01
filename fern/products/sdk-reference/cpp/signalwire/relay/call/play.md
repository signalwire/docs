---
slug: "/reference/cpp/signalwire/relay/call/play"
title: "play"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::relay::Call::play"
  parent: "signalwire::relay::Call"
  module: "signalwire.relay"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/call.hpp"
  visibility: "public"
---
# `play`

## Signature

```cpp
Action play(
    const json & media,
    double volume = 0.0,
    const std::string & control_id = ""
)
```

## Parameters

| Name         | Type                  | Required | Default | Description |
| ------------ | --------------------- | -------- | ------- | ----------- |
| `media`      | `const json &`        | yes      | —       | —           |
| `volume`     | `double`              | no       | `0.0`   | —           |
| `control_id` | `const std::string &` | no       | `""`    | —           |

## Returns

`Action`

## Source

[`include/signalwire/relay/call.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/call.hpp)

Line 52.
