---
slug: "/reference/cpp/signalwire/pom/section/section"
title: "Section"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::pom::Section::Section"
  parent: "signalwire::pom::Section"
  module: "signalwire.pom"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/pom/pom.hpp"
  visibility: "public"
---
# `Section`

Build a Section. title is optional; everything else has sensible defaults so empty Sections can be created and populated incrementally via add\_body / add\_bullets / add\_subsection.

## Signature

**Overload 1**

```cpp
void Section()
```

**Overload 2**

```cpp
void Section(
    std::optional< std::string > t,
    std::string b = "",
    std::vector< std::string > bs = {},
    std::optional< bool > num = std::nullopt,
    bool numbered_bullets = false
)
```

## Parameters (Overload 2)

| Name               | Type                           | Required | Default        | Description |
| ------------------ | ------------------------------ | -------- | -------------- | ----------- |
| `t`                | `std::optional< std::string >` | yes      | —              | —           |
| `b`                | `std::string`                  | no       | `""`           | —           |
| `bs`               | `std::vector< std::string >`   | no       | `{}`           | —           |
| `num`              | `std::optional< bool >`        | no       | `std::nullopt` | —           |
| `numbered_bullets` | `bool`                         | no       | `false`        | —           |

## Source

[`include/signalwire/pom/pom.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/pom/pom.hpp)

Line 77.
