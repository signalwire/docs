---
slug: "/reference/cpp/signalwire/swml/verb-definition"
title: "VerbDefinition"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::swml::VerbDefinition"
  parent: "signalwire::swml"
  module: "signalwire.swml"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/schema.hpp"
  visibility: "public"
---
# `VerbDefinition`

Represents a verb definition extracted from the SWML schema.

## Signature

```cpp
struct signalwire::swml::VerbDefinition
```

## Properties

| Name          | Type                      | Required | Default | Description |
| ------------- | ------------------------- | -------- | ------- | ----------- |
| `description` | `std::string description` | yes      | —       | —           |
| `properties`  | `json properties`         | yes      | —       | —           |
| `schema_name` | `std::string schema_name` | yes      | —       | —           |
| `verb_name`   | `std::string verb_name`   | yes      | —       | —           |

## Source

[`include/signalwire/swml/schema.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/schema.hpp)

Line 14.
