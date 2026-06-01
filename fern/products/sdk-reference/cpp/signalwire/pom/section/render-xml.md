---
slug: "/reference/cpp/signalwire/pom/section/render-xml"
title: "render_xml"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::pom::Section::render_xml"
  parent: "signalwire::pom::Section"
  module: "signalwire.pom"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/pom/pom.hpp"
  visibility: "public"
---
# `render_xml`

Render this section + subtree as XML. indent is the number of 2-space indents to use; section\_number follows the same rule as render\_markdown.

**Modifiers:** `const`

## Signature

```cpp
std::string render_xml(
    int indent = 0,
    const std::vector< int > & section_number = {}
) const
```

## Parameters

| Name             | Type                         | Required | Default | Description |
| ---------------- | ---------------------------- | -------- | ------- | ----------- |
| `indent`         | `int`                        | no       | `0`     | —           |
| `section_number` | `const std::vector< int > &` | no       | `{}`    | —           |

## Returns

`std::string`

## Source

[`include/signalwire/pom/pom.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/pom/pom.hpp)

Line 124.
