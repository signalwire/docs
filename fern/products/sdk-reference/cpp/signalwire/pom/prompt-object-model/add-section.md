---
slug: "/reference/cpp/signalwire/pom/prompt-object-model/add-section"
title: "add_section"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::pom::PromptObjectModel::add_section"
  parent: "signalwire::pom::PromptObjectModel"
  module: "signalwire.pom"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/pom/pom.hpp"
  visibility: "public"
---
# `add_section`

Append a new top-level section. title may be empty only for the very first section (Python enforces "Only the first section can
have no title"); subsequent calls without a title throw std::invalid\_argument.

## Signature

```cpp
Section & add_section(
    const std::string & title = "",
    const std::string & body = "",
    const std::vector< std::string > & bullets = {},
    std::optional< bool > numbered = std::nullopt,
    bool numbered_bullets = false
)
```

## Parameters

| Name               | Type                                 | Required | Default        | Description |
| ------------------ | ------------------------------------ | -------- | -------------- | ----------- |
| `title`            | `const std::string &`                | no       | `""`           | —           |
| `body`             | `const std::string &`                | no       | `""`           | —           |
| `bullets`          | `const std::vector< std::string > &` | no       | `{}`           | —           |
| `numbered`         | `std::optional< bool >`              | no       | `std::nullopt` | —           |
| `numbered_bullets` | `bool`                               | no       | `false`        | —           |

## Returns

`Section &`

## Source

[`include/signalwire/pom/pom.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/pom/pom.hpp)

Line 152.
