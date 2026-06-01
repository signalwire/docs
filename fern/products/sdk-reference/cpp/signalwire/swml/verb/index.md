---
slug: "/reference/cpp/signalwire/swml/verb"
title: "Verb"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::swml::Verb"
  parent: "signalwire::swml"
  module: "signalwire.swml"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/document.hpp"
  visibility: "public"
---
# `Verb`

Represents a single SWML verb instance, e.g. {"answer": {"max\_duration": 3600}}.

## Signature

```cpp
struct signalwire::swml::Verb
```

## Properties

| Name     | Type               | Required | Default | Description |
| -------- | ------------------ | -------- | ------- | ----------- |
| `name`   | `std::string name` | yes      | —       | —           |
| `params` | `json params`      | yes      | —       | —           |

## Methods

- [`to_json`](/reference/cpp/signalwire/swml/verb/to-json)
- [`Verb`](/reference/cpp/signalwire/swml/verb/verb)

## Source

[`include/signalwire/swml/document.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/document.hpp)

Line 15.
