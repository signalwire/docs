---
slug: "/reference/cpp/signalwire/swml/schema/find-verb"
title: "find_verb"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::swml::Schema::find_verb"
  parent: "signalwire::swml::Schema"
  module: "signalwire.swml"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/schema.hpp"
  visibility: "public"
---
# `find_verb`

Get a specific verb definition by verb name.

**Modifiers:** `const`

## Signature

```cpp
const VerbDefinition * find_verb(const std::string & verb_name) const
```

## Parameters

| Name        | Type                  | Required | Default | Description |
| ----------- | --------------------- | -------- | ------- | ----------- |
| `verb_name` | `const std::string &` | yes      | —       | —           |

## Returns

`const VerbDefinition *`

## Source

[`include/signalwire/swml/schema.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/schema.hpp)

Line 39.
