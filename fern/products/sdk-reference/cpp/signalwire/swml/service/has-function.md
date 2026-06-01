---
slug: "/reference/cpp/signalwire/swml/service/has-function"
title: "has_function"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::swml::Service::has_function"
  parent: "signalwire::swml::Service"
  module: "signalwire.swml"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/service.hpp"
  visibility: "public"
---
# `has_function`

Whether a SWAIG function with the given name is registered. Python parity: ToolRegistry.has\_function.

**Modifiers:** `const`

## Signature

```cpp
bool has_function(const std::string & name) const
```

## Parameters

| Name   | Type                  | Required | Default | Description |
| ------ | --------------------- | -------- | ------- | ----------- |
| `name` | `const std::string &` | yes      | —       | —           |

## Returns

`bool`

## Source

[`include/signalwire/swml/service.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/service.hpp)

Line 180.
