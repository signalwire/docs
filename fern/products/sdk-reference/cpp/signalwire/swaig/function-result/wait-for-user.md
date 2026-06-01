---
slug: "/reference/cpp/signalwire/swaig/function-result/wait-for-user"
title: "wait_for_user"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::swaig::FunctionResult::wait_for_user"
  parent: "signalwire::swaig::FunctionResult"
  module: "signalwire.swaig"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swaig/function_result.hpp"
  visibility: "public"
---
# `wait_for_user`

## Signature

```cpp
FunctionResult & wait_for_user(
    std::optional< bool > enabled = std::nullopt,
    std::optional< int > timeout = std::nullopt,
    bool answer_first = false
)
```

## Parameters

| Name           | Type                    | Required | Default        | Description |
| -------------- | ----------------------- | -------- | -------------- | ----------- |
| `enabled`      | `std::optional< bool >` | no       | `std::nullopt` | —           |
| `timeout`      | `std::optional< int >`  | no       | `std::nullopt` | —           |
| `answer_first` | `bool`                  | no       | `false`        | —           |

## Returns

`FunctionResult &`

## Source

[`include/signalwire/swaig/function_result.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swaig/function_result.hpp)

Line 38.
