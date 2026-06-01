---
slug: "/reference/cpp/signalwire/swml/section/add-verb"
title: "add_verb"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::swml::Section::add_verb"
  parent: "signalwire::swml::Section"
  module: "signalwire.swml"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/document.hpp"
  visibility: "public"
---
# `add_verb`

**Modifiers:** `inline`

## Signature

**Overload 1**

```cpp
void add_verb(const Verb & verb)
```

**Overload 2**

```cpp
void add_verb(const std::string & verb_name, const json & params)
```

## Parameters (Overload 1)

| Name   | Type           | Required | Default | Description |
| ------ | -------------- | -------- | ------- | ----------- |
| `verb` | `const Verb &` | yes      | —       | —           |

## Parameters (Overload 2)

| Name        | Type                  | Required | Default | Description |
| ----------- | --------------------- | -------- | ------- | ----------- |
| `verb_name` | `const std::string &` | yes      | —       | —           |
| `params`    | `const json &`        | yes      | —       | —           |

## Source

[`include/signalwire/swml/document.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/document.hpp)

Line 35.
