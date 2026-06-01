---
slug: "/reference/cpp/signalwire/swaig/function-result/connect"
title: "connect"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::swaig::FunctionResult::connect"
  parent: "signalwire::swaig::FunctionResult"
  module: "signalwire.swaig"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swaig/function_result.hpp"
  visibility: "public"
---
# `connect`

## Signature

```cpp
FunctionResult & connect(
    const std::string & destination,
    bool final = true,
    const std::string & from_addr = ""
)
```

## Parameters

| Name          | Type                  | Required | Default | Description |
| ------------- | --------------------- | -------- | ------- | ----------- |
| `destination` | `const std::string &` | yes      | —       | —           |
| `final`       | `bool`                | no       | `true`  | —           |
| `from_addr`   | `const std::string &` | no       | `""`    | —           |

## Returns

`FunctionResult &`

## Source

[`include/signalwire/swaig/function_result.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swaig/function_result.hpp)

Line 32.
