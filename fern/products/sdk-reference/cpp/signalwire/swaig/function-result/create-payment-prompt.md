---
slug: "/reference/cpp/signalwire/swaig/function-result/create-payment-prompt"
title: "create_payment_prompt"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::swaig::FunctionResult::create_payment_prompt"
  parent: "signalwire::swaig::FunctionResult"
  module: "signalwire.swaig"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swaig/function_result.hpp"
  visibility: "public"
---
# `create_payment_prompt`

**Modifiers:** `static`

## Signature

```cpp
json create_payment_prompt(
    const std::string & for_situation,
    const std::vector< json > & actions,
    const std::string & card_type = "",
    const std::string & error_type = ""
)
```

## Parameters

| Name            | Type                          | Required | Default | Description |
| --------------- | ----------------------------- | -------- | ------- | ----------- |
| `for_situation` | `const std::string &`         | yes      | —       | —           |
| `actions`       | `const std::vector< json > &` | yes      | —       | —           |
| `card_type`     | `const std::string &`         | no       | `""`    | —           |
| `error_type`    | `const std::string &`         | no       | `""`    | —           |

## Returns

`json`

## Source

[`include/signalwire/swaig/function_result.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swaig/function_result.hpp)

Line 153.
