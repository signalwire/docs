---
slug: "/reference/cpp/signalwire/swaig/tool-definition/to-swaig-json"
title: "to_swaig_json"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::swaig::ToolDefinition::to_swaig_json"
  parent: "signalwire::swaig::ToolDefinition"
  module: "signalwire.swaig"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swaig/tool_definition.hpp"
  visibility: "public"
---
# `to_swaig_json`

Render to the SWAIG function JSON format (for inclusion in SWML).

**Modifiers:** `const` `inline`

## Signature

```cpp
json to_swaig_json(const std::string & web_hook_url = "") const
```

## Parameters

| Name           | Type                  | Required | Default | Description |
| -------------- | --------------------- | -------- | ------- | ----------- |
| `web_hook_url` | `const std::string &` | no       | `""`    | —           |

## Returns

`json`

## Source

[`include/signalwire/swaig/tool_definition.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swaig/tool_definition.hpp)

Line 23.
