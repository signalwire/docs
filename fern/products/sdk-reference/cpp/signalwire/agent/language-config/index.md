---
slug: "/reference/cpp/signalwire/agent/language-config"
title: "LanguageConfig"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::agent::LanguageConfig"
  parent: "signalwire::agent"
  module: "signalwire.agent"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp"
  visibility: "public"
---
# `LanguageConfig`

Language configuration.

## Signature

```cpp
struct signalwire::agent::LanguageConfig
```

## Properties

| Name      | Type                  | Required | Default | Description                                                                                                                                                                                                                                       |
| --------- | --------------------- | -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `code`    | `std::string code`    | yes      | —       | —                                                                                                                                                                                                                                                 |
| `engine`  | `std::string engine`  | yes      | —       | —                                                                                                                                                                                                                                                 |
| `fillers` | `std::string fillers` | yes      | —       | —                                                                                                                                                                                                                                                 |
| `name`    | `std::string name`    | yes      | —       | —                                                                                                                                                                                                                                                 |
| `params`  | `json params`         | yes      | —       | Per-language params dict (engine-specific tuning, voice settings, etc.). Emitted as the language object's params key in SWML only when non-empty — matches Python reference commit 029ca6f. Treated as "unset" when null OR when an empty object. |
| `voice`   | `std::string voice`   | yes      | —       | —                                                                                                                                                                                                                                                 |

## Methods

- [`to_json`](/reference/cpp/signalwire/agent/language-config/to-json)

## Source

[`include/signalwire/agent/agent_base.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/agent/agent_base.hpp)

Line 43.
