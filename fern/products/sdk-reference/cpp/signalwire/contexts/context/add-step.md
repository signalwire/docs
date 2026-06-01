---
slug: "/reference/cpp/signalwire/contexts/context/add-step"
title: "add_step"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::contexts::Context::add_step"
  parent: "signalwire::contexts::Context"
  module: "signalwire.contexts"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/contexts/contexts.hpp"
  visibility: "public"
---
# `add_step`

Add a new step to this context (returns reference for chaining).

## Signature

```cpp
Step & add_step(
    const std::string & name,
    const std::string & task = "",
    const std::vector< std::string > & bullets = {},
    const std::string & criteria = "",
    const std::optional< std::variant< std::string, std::vector< std::string > > > & functions = std::nullopt,
    const std::vector< std::string > & valid_steps = {}
)
```

## Parameters

| Name          | Type                                                                               | Required | Default        | Description |
| ------------- | ---------------------------------------------------------------------------------- | -------- | -------------- | ----------- |
| `name`        | `const std::string &`                                                              | yes      | —              | —           |
| `task`        | `const std::string &`                                                              | no       | `""`           | —           |
| `bullets`     | `const std::vector< std::string > &`                                               | no       | `{}`           | —           |
| `criteria`    | `const std::string &`                                                              | no       | `""`           | —           |
| `functions`   | `const std::optional< std::variant< std::string, std::vector< std::string > > > &` | no       | `std::nullopt` | —           |
| `valid_steps` | `const std::vector< std::string > &`                                               | no       | `{}`           | —           |

## Returns

`Step &`

## Source

[`include/signalwire/contexts/contexts.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/contexts/contexts.hpp)

Line 240.
