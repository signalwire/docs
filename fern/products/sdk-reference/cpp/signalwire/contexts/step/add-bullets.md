---
slug: "/reference/cpp/signalwire/contexts/step/add-bullets"
title: "add_bullets"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::contexts::Step::add_bullets"
  parent: "signalwire::contexts::Step"
  module: "signalwire.contexts"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/contexts/contexts.hpp"
  visibility: "public"
---
# `add_bullets`

Add a POM section with bullet points.

## Signature

```cpp
Step & add_bullets(
    const std::string & title,
    const std::vector< std::string > & bullets
)
```

## Parameters

| Name      | Type                                 | Required | Default | Description |
| --------- | ------------------------------------ | -------- | ------- | ----------- |
| `title`   | `const std::string &`                | yes      | —       | —           |
| `bullets` | `const std::vector< std::string > &` | yes      | —       | —           |

## Returns

`Step &`

## Source

[`include/signalwire/contexts/contexts.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/contexts/contexts.hpp)

Line 99.
