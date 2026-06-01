---
slug: "/reference/cpp/signalwire/swaig/function-result/pay"
title: "pay"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::swaig::FunctionResult::pay"
  parent: "signalwire::swaig::FunctionResult"
  module: "signalwire.swaig"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swaig/function_result.hpp"
  visibility: "public"
---
# `pay`

## Signature

```cpp
FunctionResult & pay(
    const std::string & payment_connector_url,
    const std::string & input_method = "dtmf",
    const std::string & status_url = "",
    const std::string & payment_method = "credit-card",
    int timeout = 5,
    int max_attempts = 1,
    bool security_code = true,
    const std::string & postal_code = "true",
    int min_postal_code_length = 0,
    const std::string & token_type = "reusable",
    const std::string & charge_amount = "",
    const std::string & currency = "usd",
    const std::string & language = "en-US",
    const std::string & voice = "woman",
    const std::string & description = "",
    const std::string & valid_card_types = "visa mastercard amex",
    const std::vector< json > & parameters = {},
    const std::vector< json > & prompts = {},
    const std::string & ai_response = "The payment status is ${pay_result}, do not mention anything else about collecting payment if successful."
)
```

## Parameters

| Name                     | Type                          | Required | Default                                                                                                       | Description |
| ------------------------ | ----------------------------- | -------- | ------------------------------------------------------------------------------------------------------------- | ----------- |
| `payment_connector_url`  | `const std::string &`         | yes      | —                                                                                                             | —           |
| `input_method`           | `const std::string &`         | no       | `"dtmf"`                                                                                                      | —           |
| `status_url`             | `const std::string &`         | no       | `""`                                                                                                          | —           |
| `payment_method`         | `const std::string &`         | no       | `"credit-card"`                                                                                               | —           |
| `timeout`                | `int`                         | no       | `5`                                                                                                           | —           |
| `max_attempts`           | `int`                         | no       | `1`                                                                                                           | —           |
| `security_code`          | `bool`                        | no       | `true`                                                                                                        | —           |
| `postal_code`            | `const std::string &`         | no       | `"true"`                                                                                                      | —           |
| `min_postal_code_length` | `int`                         | no       | `0`                                                                                                           | —           |
| `token_type`             | `const std::string &`         | no       | `"reusable"`                                                                                                  | —           |
| `charge_amount`          | `const std::string &`         | no       | `""`                                                                                                          | —           |
| `currency`               | `const std::string &`         | no       | `"usd"`                                                                                                       | —           |
| `language`               | `const std::string &`         | no       | `"en-US"`                                                                                                     | —           |
| `voice`                  | `const std::string &`         | no       | `"woman"`                                                                                                     | —           |
| `description`            | `const std::string &`         | no       | `""`                                                                                                          | —           |
| `valid_card_types`       | `const std::string &`         | no       | `"visa mastercard amex"`                                                                                      | —           |
| `parameters`             | `const std::vector< json > &` | no       | `{}`                                                                                                          | —           |
| `prompts`                | `const std::vector< json > &` | no       | `{}`                                                                                                          | —           |
| `ai_response`            | `const std::string &`         | no       | `"The payment status is ${pay_result}, do not mention anything else about collecting payment if successful."` | —           |

## Returns

`FunctionResult &`

## Source

[`include/signalwire/swaig/function_result.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swaig/function_result.hpp)

Line 114.
