---
slug: "/reference/cpp/signalwire/swaig/function-result/tap"
title: "tap"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::swaig::FunctionResult::tap"
  parent: "signalwire::swaig::FunctionResult"
  module: "signalwire.swaig"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swaig/function_result.hpp"
  visibility: "public"
---
# `tap`

## Signature

```cpp
FunctionResult & tap(
    const std::string & uri,
    const std::string & control_id = "",
    const std::string & direction = "both",
    const std::string & codec = "PCMU",
    int rtp_ptime = 20,
    const std::string & status_url = ""
)
```

## Parameters

| Name         | Type                  | Required | Default  | Description |
| ------------ | --------------------- | -------- | -------- | ----------- |
| `uri`        | `const std::string &` | yes      | —        | —           |
| `control_id` | `const std::string &` | no       | `""`     | —           |
| `direction`  | `const std::string &` | no       | `"both"` | —           |
| `codec`      | `const std::string &` | no       | `"PCMU"` | —           |
| `rtp_ptime`  | `int`                 | no       | `20`     | —           |
| `status_url` | `const std::string &` | no       | `""`     | —           |

## Returns

`FunctionResult &`

## Source

[`include/signalwire/swaig/function_result.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swaig/function_result.hpp)

Line 103.
