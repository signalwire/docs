---
slug: "/reference/cpp/signalwire/swml/section"
title: "Section"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::swml::Section"
  parent: "signalwire::swml"
  module: "signalwire.swml"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/document.hpp"
  visibility: "public"
---
# `Section`

A named section containing an ordered list of verbs.

## Signature

```cpp
struct signalwire::swml::Section
```

## Properties

| Name    | Type                        | Required | Default | Description |
| ------- | --------------------------- | -------- | ------- | ----------- |
| `name`  | `std::string name`          | yes      | —       | —           |
| `verbs` | `std::vector< Verb > verbs` | yes      | —       | —           |

## Methods

- [`add_verb`](/reference/cpp/signalwire/swml/section/add-verb)
- [`Section`](/reference/cpp/signalwire/swml/section/section)
- [`to_json`](/reference/cpp/signalwire/swml/section/to-json)

## Source

[`include/signalwire/swml/document.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/document.hpp)

Line 28.
