---
slug: "/reference/cpp/signalwire/relay/action/volume"
title: "volume"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::relay::Action::volume"
  parent: "signalwire::relay::Action"
  module: "signalwire.relay"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/action.hpp"
  visibility: "public"
---
# `volume`

Adjust playback volume (play only). The frame body carries the supplied amount in dB; positive boosts, negative attenuates.

## Signature

```cpp
void volume(double amount)
```

## Parameters

| Name     | Type     | Required | Default | Description |
| -------- | -------- | -------- | ------- | ----------- |
| `amount` | `double` | yes      | —       | —           |

## Source

[`include/signalwire/relay/action.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/action.hpp)

Line 102.
