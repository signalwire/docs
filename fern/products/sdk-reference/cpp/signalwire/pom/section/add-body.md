---
slug: "/reference/cpp/signalwire/pom/section/add-body"
title: "add_body"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::pom::Section::add_body"
  parent: "signalwire::pom::Section"
  module: "signalwire.pom"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/pom/pom.hpp"
  visibility: "public"
---
# `add_body`

Replace (NOT append) the body text. Mirrors Python's documented "Add OR REPLACE the body text" contract.

## Signature

```cpp
void add_body(const std::string & b)
```

## Parameters

| Name | Type                  | Required | Default | Description |
| ---- | --------------------- | -------- | ------- | ----------- |
| `b`  | `const std::string &` | yes      | —       | —           |

## Source

[`include/signalwire/pom/pom.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/pom/pom.hpp)

Line 90.
