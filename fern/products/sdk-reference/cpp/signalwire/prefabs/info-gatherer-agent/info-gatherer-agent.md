---
slug: "/reference/cpp/signalwire/prefabs/info-gatherer-agent/info-gatherer-agent"
title: "InfoGathererAgent"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::prefabs::InfoGathererAgent::InfoGathererAgent"
  parent: "signalwire::prefabs::InfoGathererAgent"
  module: "signalwire.prefabs"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/prefabs/prefabs.hpp"
  visibility: "public"
---
# `InfoGathererAgent`

**Modifiers:** `explicit`

## Signature

```cpp
void InfoGathererAgent(
    const std::string & name = "info_gatherer",
    const std::string & route = "/",
    const std::string & host = "0.0.0.0",
    int port = 3000
)
```

## Parameters

| Name    | Type                  | Required | Default           | Description |
| ------- | --------------------- | -------- | ----------------- | ----------- |
| `name`  | `const std::string &` | no       | `"info_gatherer"` | —           |
| `route` | `const std::string &` | no       | `"/"`             | —           |
| `host`  | `const std::string &` | no       | `"0.0.0.0"`       | —           |
| `port`  | `int`                 | no       | `3000`            | —           |

## Source

[`include/signalwire/prefabs/prefabs.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/prefabs/prefabs.hpp)

Line 15.
