---
slug: "/reference/cpp/signalwire/prefabs/faq-bot-agent/faq-bot-agent"
title: "FAQBotAgent"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::prefabs::FAQBotAgent::FAQBotAgent"
  parent: "signalwire::prefabs::FAQBotAgent"
  module: "signalwire.prefabs"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/prefabs/prefabs.hpp"
  visibility: "public"
---
# `FAQBotAgent`

**Modifiers:** `explicit`

## Signature

```cpp
void FAQBotAgent(
    const std::string & name = "faq_bot",
    const std::string & route = "/",
    const std::string & host = "0.0.0.0",
    int port = 3000
)
```

## Parameters

| Name    | Type                  | Required | Default     | Description |
| ------- | --------------------- | -------- | ----------- | ----------- |
| `name`  | `const std::string &` | no       | `"faq_bot"` | —           |
| `route` | `const std::string &` | no       | `"/"`       | —           |
| `host`  | `const std::string &` | no       | `"0.0.0.0"` | —           |
| `port`  | `int`                 | no       | `3000`      | —           |

## Source

[`include/signalwire/prefabs/prefabs.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/prefabs/prefabs.hpp)

Line 54.
