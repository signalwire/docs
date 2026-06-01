---
slug: "/reference/cpp/signalwire/swml/document/add-verb-to-section"
title: "add_verb_to_section"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::swml::Document::add_verb_to_section"
  parent: "signalwire::swml::Document"
  module: "signalwire.swml"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/document.hpp"
  visibility: "public"
---
# `add_verb_to_section`

Add a verb to a specific section.

**Modifiers:** `inline`

## Signature

```cpp
Document & add_verb_to_section(
    const std::string & section_name,
    const std::string & verb_name,
    const json & params
)
```

## Parameters

| Name           | Type                  | Required | Default | Description |
| -------------- | --------------------- | -------- | ------- | ----------- |
| `section_name` | `const std::string &` | yes      | —       | —           |
| `verb_name`    | `const std::string &` | yes      | —       | —           |
| `params`       | `const json &`        | yes      | —       | —           |

## Returns

`Document &`

## Source

[`include/signalwire/swml/document.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/document.hpp)

Line 87.
