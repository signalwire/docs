---
slug: "/reference/cpp/signalwire/swaig/function-result/send-sms"
title: "send_sms"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::swaig::FunctionResult::send_sms"
  parent: "signalwire::swaig::FunctionResult"
  module: "signalwire.swaig"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swaig/function_result.hpp"
  visibility: "public"
---
# `send_sms`

## Signature

```cpp
FunctionResult & send_sms(
    const std::string & to,
    const std::string & from,
    const std::string & body = "",
    const std::vector< std::string > & media = {},
    const std::vector< std::string > & tags = {},
    const std::string & region = ""
)
```

## Parameters

| Name     | Type                                 | Required | Default | Description |
| -------- | ------------------------------------ | -------- | ------- | ----------- |
| `to`     | `const std::string &`                | yes      | —       | —           |
| `from`   | `const std::string &`                | yes      | —       | —           |
| `body`   | `const std::string &`                | no       | `""`    | —           |
| `media`  | `const std::vector< std::string > &` | no       | `{}`    | —           |
| `tags`   | `const std::vector< std::string > &` | no       | `{}`    | —           |
| `region` | `const std::string &`                | no       | `""`    | —           |

## Returns

`FunctionResult &`

## Source

[`include/signalwire/swaig/function_result.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swaig/function_result.hpp)

Line 109.
