---
slug: "/reference/cpp/signalwire/swaig/function-result/switch-context"
title: "switch_context"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::swaig::FunctionResult::switch_context"
  parent: "signalwire::swaig::FunctionResult"
  module: "signalwire.swaig"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swaig/function_result.hpp"
  visibility: "public"
---
# `switch_context`

## Signature

```cpp
FunctionResult & switch_context(
    const std::string & system_prompt = "",
    const std::string & user_prompt = "",
    bool consolidate = false,
    bool full_reset = false
)
```

## Parameters

| Name            | Type                  | Required | Default | Description |
| --------------- | --------------------- | -------- | ------- | ----------- |
| `system_prompt` | `const std::string &` | no       | `""`    | —           |
| `user_prompt`   | `const std::string &` | no       | `""`    | —           |
| `consolidate`   | `bool`                | no       | `false` | —           |
| `full_reset`    | `bool`                | no       | `false` | —           |

## Returns

`FunctionResult &`

## Source

[`include/signalwire/swaig/function_result.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swaig/function_result.hpp)

Line 54.
