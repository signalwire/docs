---
slug: "/reference/cpp/signalwire/swaig/function-result/rpc-ai-message"
title: "rpc_ai_message"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::swaig::FunctionResult::rpc_ai_message"
  parent: "signalwire::swaig::FunctionResult"
  module: "signalwire.swaig"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swaig/function_result.hpp"
  visibility: "public"
---
# `rpc_ai_message`

## Signature

```cpp
FunctionResult & rpc_ai_message(
    const std::string & call_id,
    const std::string & message_text,
    const std::string & role = "system"
)
```

## Parameters

| Name           | Type                  | Required | Default    | Description |
| -------------- | --------------------- | -------- | ---------- | ----------- |
| `call_id`      | `const std::string &` | yes      | —          | —           |
| `message_text` | `const std::string &` | yes      | —          | —           |
| `role`         | `const std::string &` | no       | `"system"` | —           |

## Returns

`FunctionResult &`

## Source

[`include/signalwire/swaig/function_result.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swaig/function_result.hpp)

Line 145.
