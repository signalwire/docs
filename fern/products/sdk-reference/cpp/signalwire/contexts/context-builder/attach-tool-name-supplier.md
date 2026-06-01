---
slug: "/reference/cpp/signalwire/contexts/context-builder/attach-tool-name-supplier"
title: "attach_tool_name_supplier"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::contexts::ContextBuilder::attach_tool_name_supplier"
  parent: "signalwire::contexts::ContextBuilder"
  module: "signalwire.contexts"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/contexts/contexts.hpp"
  visibility: "public"
---
# `attach_tool_name_supplier`

Attach a tool-name supplier so validate() can check user-defined SWAIG tool names against reserved\_native\_tool\_names(). AgentBase::define\_contexts() wires this up automatically.

## Signature

```cpp
ContextBuilder & attach_tool_name_supplier(
    std::function< std::vector< std::string >()> supplier
)
```

## Parameters

| Name       | Type                                           | Required | Default | Description |
| ---------- | ---------------------------------------------- | -------- | ------- | ----------- |
| `supplier` | `std::function< std::vector< std::string >()>` | yes      | —       | —           |

## Returns

`ContextBuilder &`

## Source

[`include/signalwire/contexts/contexts.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/contexts/contexts.hpp)

Line 414.
