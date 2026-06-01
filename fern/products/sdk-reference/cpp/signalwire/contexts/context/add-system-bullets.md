---
slug: "/reference/cpp/signalwire/contexts/context/add-system-bullets"
title: "add_system_bullets"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::contexts::Context::add_system_bullets"
  parent: "signalwire::contexts::Context"
  module: "signalwire.contexts"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/contexts/contexts.hpp"
  visibility: "public"
---
# `add_system_bullets`

Add a POM section with bullets to the system prompt.

## Signature

```cpp
Context & add_system_bullets(
    const std::string & title,
    const std::vector< std::string > & bullets
)
```

## Parameters

| Name      | Type                                 | Required | Default | Description |
| --------- | ------------------------------------ | -------- | ------- | ----------- |
| `title`   | `const std::string &`                | yes      | —       | —           |
| `bullets` | `const std::vector< std::string > &` | yes      | —       | —           |

## Returns

`Context &`

## Source

[`include/signalwire/contexts/contexts.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/contexts/contexts.hpp)

Line 316.
