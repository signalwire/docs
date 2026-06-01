---
slug: "/reference/cpp/signalwire/pom/prompt-object-model/from-yaml"
title: "from_yaml"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::pom::PromptObjectModel::from_yaml"
  parent: "signalwire::pom::PromptObjectModel"
  module: "signalwire.pom"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/pom/pom.hpp"
  visibility: "public"
---
# `from_yaml`

Build a POM from a YAML string (minimal POM-shaped subset only).

**Modifiers:** `static`

## Signature

```cpp
PromptObjectModel from_yaml(const std::string & yaml_text)
```

## Parameters

| Name        | Type                  | Required | Default | Description |
| ----------- | --------------------- | -------- | ------- | ----------- |
| `yaml_text` | `const std::string &` | yes      | —       | —           |

## Returns

`PromptObjectModel`

## Source

[`include/signalwire/pom/pom.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/pom/pom.hpp)

Line 146.
