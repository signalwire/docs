---
slug: "/reference/cpp/signalwire/swaig/function-result/swml-transfer"
title: "swml_transfer"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::swaig::FunctionResult::swml_transfer"
  parent: "signalwire::swaig::FunctionResult"
  module: "signalwire.swaig"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swaig/function_result.hpp"
  visibility: "public"
---
# `swml_transfer`

## Signature

```cpp
FunctionResult & swml_transfer(
    const std::string & dest,
    const std::string & ai_response,
    bool final = true
)
```

## Parameters

| Name          | Type                  | Required | Default | Description |
| ------------- | --------------------- | -------- | ------- | ----------- |
| `dest`        | `const std::string &` | yes      | —       | —           |
| `ai_response` | `const std::string &` | yes      | —       | —           |
| `final`       | `bool`                | no       | `true`  | —           |

## Returns

`FunctionResult &`

## Source

[`include/signalwire/swaig/function_result.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swaig/function_result.hpp)

Line 34.
