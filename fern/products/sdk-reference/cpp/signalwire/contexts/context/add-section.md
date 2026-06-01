---
slug: "/reference/cpp/signalwire/contexts/context/add-section"
title: "add_section"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::contexts::Context::add_section"
  parent: "signalwire::contexts::Context"
  module: "signalwire.contexts"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/contexts/contexts.hpp"
  visibility: "public"
---
# `add_section`

Add a POM section to the context prompt.

## Signature

```cpp
Context & add_section(const std::string & title, const std::string & body)
```

## Parameters

| Name    | Type                  | Required | Default | Description |
| ------- | --------------------- | -------- | ------- | ----------- |
| `title` | `const std::string &` | yes      | —       | —           |
| `body`  | `const std::string &` | yes      | —       | —           |

## Returns

`Context &`

## Source

[`include/signalwire/contexts/contexts.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/contexts/contexts.hpp)

Line 307.
