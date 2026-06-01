---
slug: "/reference/cpp/signalwire/swml/document/add-verb"
title: "add_verb"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::swml::Document::add_verb"
  parent: "signalwire::swml::Document"
  module: "signalwire.swml"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/document.hpp"
  visibility: "public"
---
# `add_verb`

Add a verb to the main section.

**Modifiers:** `inline`

## Signature

```cpp
Document & add_verb(const std::string & verb_name, const json & params)
```

## Parameters

| Name        | Type                  | Required | Default | Description |
| ----------- | --------------------- | -------- | ------- | ----------- |
| `verb_name` | `const std::string &` | yes      | —       | —           |
| `params`    | `const json &`        | yes      | —       | —           |

## Returns

`Document &`

## Source

[`include/signalwire/swml/document.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/document.hpp)

Line 81.
