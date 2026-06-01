---
slug: "/reference/cpp/signalwire/swml/service/get-function"
title: "get_function"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::swml::Service::get_function"
  parent: "signalwire::swml::Service"
  module: "signalwire.swml"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/service.hpp"
  visibility: "public"
---
# `get_function`

Get a registered SWAIG function definition by name. Returns nullptr when no such function is registered. Python parity: ToolRegistry.get\_function.

**Modifiers:** `const`

## Signature

```cpp
const swaig::ToolDefinition * get_function(const std::string & name) const
```

## Parameters

| Name   | Type                  | Required | Default | Description |
| ------ | --------------------- | -------- | ------- | ----------- |
| `name` | `const std::string &` | yes      | —       | —           |

## Returns

`const swaig::ToolDefinition *`

## Source

[`include/signalwire/swml/service.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/service.hpp)

Line 185.
