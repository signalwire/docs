---
slug: "/reference/cpp/signalwire/swaig/function-result/execute-rpc"
title: "execute_rpc"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::swaig::FunctionResult::execute_rpc"
  parent: "signalwire::swaig::FunctionResult"
  module: "signalwire.swaig"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swaig/function_result.hpp"
  visibility: "public"
---
# `execute_rpc`

## Signature

```cpp
FunctionResult & execute_rpc(
    const std::string & method,
    const json & params = json::object(),
    const std::string & call_id = "",
    const std::string & node_id = ""
)
```

## Parameters

| Name      | Type                  | Required | Default          | Description |
| --------- | --------------------- | -------- | ---------------- | ----------- |
| `method`  | `const std::string &` | yes      | —                | —           |
| `params`  | `const json &`        | no       | `json::object()` | —           |
| `call_id` | `const std::string &` | no       | `""`             | —           |
| `node_id` | `const std::string &` | no       | `""`             | —           |

## Returns

`FunctionResult &`

## Source

[`include/signalwire/swaig/function_result.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swaig/function_result.hpp)

Line 139.
