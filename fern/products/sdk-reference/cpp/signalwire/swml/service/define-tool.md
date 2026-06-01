---
slug: "/reference/cpp/signalwire/swml/service/define-tool"
title: "define_tool"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::swml::Service::define_tool"
  parent: "signalwire::swml::Service"
  module: "signalwire.swml"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/service.hpp"
  visibility: "public"
---
# `define_tool`

Define a SWAIG function the AI can call.

## Signature

**Overload 1**

```cpp
Service & define_tool(
    const std::string & name,
    const std::string & description,
    const json & parameters,
    swaig::ToolHandler handler,
    bool secure = false
)
```

**Overload 2**

```cpp
Service & define_tool(const swaig::ToolDefinition & tool)
```

## Parameters (Overload 1)

| Name          | Type                  | Required | Default | Description |
| ------------- | --------------------- | -------- | ------- | ----------- |
| `name`        | `const std::string &` | yes      | —       | —           |
| `description` | `const std::string &` | yes      | —       | —           |
| `parameters`  | `const json &`        | yes      | —       | —           |
| `handler`     | `swaig::ToolHandler`  | yes      | —       | —           |
| `secure`      | `bool`                | no       | `false` | —           |

## Parameters (Overload 2)

| Name   | Type                            | Required | Default | Description |
| ------ | ------------------------------- | -------- | ------- | ----------- |
| `tool` | `const swaig::ToolDefinition &` | yes      | —       | —           |

## Returns (Overload 1)

`Service &`

## Returns (Overload 2)

`Service &`

## Source

[`include/signalwire/swml/service.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/service.hpp)

Line 156.
