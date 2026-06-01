---
slug: "/reference/cpp/signalwire/swaig/tool-definition"
title: "ToolDefinition"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::swaig::ToolDefinition"
  parent: "signalwire::swaig"
  module: "signalwire.swaig"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swaig/tool_definition.hpp"
  visibility: "public"
---
# `ToolDefinition`

Definition of a SWAIG tool (function).

## Signature

```cpp
struct signalwire::swaig::ToolDefinition
```

## Properties

| Name          | Type                      | Required | Default | Description |
| ------------- | ------------------------- | -------- | ------- | ----------- |
| `description` | `std::string description` | yes      | —       | —           |
| `handler`     | `ToolHandler handler`     | yes      | —       | —           |
| `name`        | `std::string name`        | yes      | —       | —           |
| `parameters`  | `json parameters`         | yes      | —       | —           |
| `secure`      | `bool secure`             | yes      | —       | —           |

## Methods

- [`to_swaig_json`](/reference/cpp/signalwire/swaig/tool-definition/to-swaig-json) — Render to the SWAIG function JSON format (for inclusion in SWML).

## Source

[`include/signalwire/swaig/tool_definition.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swaig/tool_definition.hpp)

Line 15.
