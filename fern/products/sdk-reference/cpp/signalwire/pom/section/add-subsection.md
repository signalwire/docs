---
slug: "/reference/cpp/signalwire/pom/section/add-subsection"
title: "add_subsection"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::pom::Section::add_subsection"
  parent: "signalwire::pom::Section"
  module: "signalwire.pom"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/pom/pom.hpp"
  visibility: "public"
---
# `add_subsection`

Add a child subsection. Returns a reference to the newly-created subsection so callers can chain further mutations. Throws std::invalid\_argument if title is empty (Python raises ValueError("Subsections must have a title")).

## Signature

```cpp
Section & add_subsection(
    const std::string & title,
    const std::string & body = "",
    const std::vector< std::string > & bullets = {},
    std::optional< bool > numbered = std::nullopt,
    bool numbered_bullets = false
)
```

## Parameters

| Name               | Type                                 | Required | Default        | Description |
| ------------------ | ------------------------------------ | -------- | -------------- | ----------- |
| `title`            | `const std::string &`                | yes      | —              | —           |
| `body`             | `const std::string &`                | no       | `""`           | —           |
| `bullets`          | `const std::vector< std::string > &` | no       | `{}`           | —           |
| `numbered`         | `std::optional< bool >`              | no       | `std::nullopt` | —           |
| `numbered_bullets` | `bool`                               | no       | `false`        | —           |

## Returns

`Section &`

## Source

[`include/signalwire/pom/pom.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/pom/pom.hpp)

Line 99.
