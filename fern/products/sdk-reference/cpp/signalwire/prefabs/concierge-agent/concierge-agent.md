---
slug: "/reference/cpp/signalwire/prefabs/concierge-agent/concierge-agent"
title: "ConciergeAgent"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::prefabs::ConciergeAgent::ConciergeAgent"
  parent: "signalwire::prefabs::ConciergeAgent"
  module: "signalwire.prefabs"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/prefabs/prefabs.hpp"
  visibility: "public"
---
# `ConciergeAgent`

**Modifiers:** `explicit`

## Signature

```cpp
void ConciergeAgent(
    const std::string & name = "concierge",
    const std::string & route = "/",
    const std::string & host = "0.0.0.0",
    int port = 3000
)
```

## Parameters

| Name    | Type                  | Required | Default       | Description |
| ------- | --------------------- | -------- | ------------- | ----------- |
| `name`  | `const std::string &` | no       | `"concierge"` | —           |
| `route` | `const std::string &` | no       | `"/"`         | —           |
| `host`  | `const std::string &` | no       | `"0.0.0.0"`   | —           |
| `port`  | `int`                 | no       | `3000`        | —           |

## Source

[`include/signalwire/prefabs/prefabs.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/prefabs/prefabs.hpp)

Line 67.
