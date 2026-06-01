---
slug: "/reference/cpp/signalwire/contexts/context/add-enter-filler"
title: "add_enter_filler"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::contexts::Context::add_enter_filler"
  parent: "signalwire::contexts::Context"
  module: "signalwire.contexts"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/contexts/contexts.hpp"
  visibility: "public"
---
# `add_enter_filler`

Add enter filler for a specific language.

## Signature

```cpp
Context & add_enter_filler(
    const std::string & lang,
    const std::vector< std::string > & fillers
)
```

## Parameters

| Name      | Type                                 | Required | Default | Description |
| --------- | ------------------------------------ | -------- | ------- | ----------- |
| `lang`    | `const std::string &`                | yes      | —       | —           |
| `fillers` | `const std::vector< std::string > &` | yes      | —       | —           |

## Returns

`Context &`

## Source

[`include/signalwire/contexts/contexts.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/contexts/contexts.hpp)

Line 325.
