---
slug: "/reference/cpp/signalwire/contexts/step/set-gather-info"
title: "set_gather_info"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::contexts::Step::set_gather_info"
  parent: "signalwire::contexts::Step"
  module: "signalwire.contexts"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/contexts/contexts.hpp"
  visibility: "public"
---
# `set_gather_info`

Enable info gathering on this step.

## Signature

```cpp
Step & set_gather_info(
    const std::string & output_key = "",
    const std::string & completion_action = "",
    const std::string & prompt = ""
)
```

## Parameters

| Name                | Type                  | Required | Default | Description |
| ------------------- | --------------------- | -------- | ------- | ----------- |
| `output_key`        | `const std::string &` | no       | `""`    | —           |
| `completion_action` | `const std::string &` | no       | `""`    | —           |
| `prompt`            | `const std::string &` | no       | `""`    | —           |

## Returns

`Step &`

## Source

[`include/signalwire/contexts/contexts.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/contexts/contexts.hpp)

Line 162.
