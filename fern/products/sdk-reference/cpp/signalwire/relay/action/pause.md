---
slug: "/reference/cpp/signalwire/relay/action/pause"
title: "pause"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::relay::Action::pause"
  parent: "signalwire::relay::Action"
  module: "signalwire.relay"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/action.hpp"
  visibility: "public"
---
# `pause`

Request the server to pause this action. extra\_params may carry e.g. {"behavior": "continuous"} for record-side pause.

## Signature

```cpp
void pause(const json & extra_params = json::object())
```

## Parameters

| Name           | Type           | Required | Default          | Description |
| -------------- | -------------- | -------- | ---------------- | ----------- |
| `extra_params` | `const json &` | no       | `json::object()` | —           |

## Source

[`include/signalwire/relay/action.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/action.hpp)

Line 95.
