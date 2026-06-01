---
slug: "/reference/cpp/signalwire/swaig/function-result/join-conference"
title: "join_conference"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::swaig::FunctionResult::join_conference"
  parent: "signalwire::swaig::FunctionResult"
  module: "signalwire.swaig"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swaig/function_result.hpp"
  visibility: "public"
---
# `join_conference`

## Signature

```cpp
FunctionResult & join_conference(
    const std::string & name,
    bool muted = false,
    const std::string & beep = "true"
)
```

## Parameters

| Name    | Type                  | Required | Default  | Description |
| ------- | --------------------- | -------- | -------- | ----------- |
| `name`  | `const std::string &` | yes      | —        | —           |
| `muted` | `bool`                | no       | `false`  | —           |
| `beep`  | `const std::string &` | no       | `"true"` | —           |

## Returns

`FunctionResult &`

## Source

[`include/signalwire/swaig/function_result.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swaig/function_result.hpp)

Line 99.
