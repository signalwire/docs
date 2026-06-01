---
slug: "/reference/cpp/signalwire/prefabs/receptionist-agent/receptionist-agent"
title: "ReceptionistAgent"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::prefabs::ReceptionistAgent::ReceptionistAgent"
  parent: "signalwire::prefabs::ReceptionistAgent"
  module: "signalwire.prefabs"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/prefabs/prefabs.hpp"
  visibility: "public"
---
# `ReceptionistAgent`

**Modifiers:** `explicit`

## Signature

```cpp
void ReceptionistAgent(
    const std::string & name = "receptionist",
    const std::string & route = "/",
    const std::string & host = "0.0.0.0",
    int port = 3000
)
```

## Parameters

| Name    | Type                  | Required | Default          | Description |
| ------- | --------------------- | -------- | ---------------- | ----------- |
| `name`  | `const std::string &` | no       | `"receptionist"` | —           |
| `route` | `const std::string &` | no       | `"/"`            | —           |
| `host`  | `const std::string &` | no       | `"0.0.0.0"`      | —           |
| `port`  | `int`                 | no       | `3000`           | —           |

## Source

[`include/signalwire/prefabs/prefabs.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/prefabs/prefabs.hpp)

Line 41.
