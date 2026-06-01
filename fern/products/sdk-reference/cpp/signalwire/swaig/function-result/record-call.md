---
slug: "/reference/cpp/signalwire/swaig/function-result/record-call"
title: "record_call"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::swaig::FunctionResult::record_call"
  parent: "signalwire::swaig::FunctionResult"
  module: "signalwire.swaig"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swaig/function_result.hpp"
  visibility: "public"
---
# `record_call`

## Signature

```cpp
FunctionResult & record_call(
    const std::string & control_id = "",
    bool stereo = false,
    const std::string & format = "wav",
    const std::string & direction = "both",
    const std::string & terminators = "",
    bool beep = false,
    double input_sensitivity = 44.0,
    std::optional< double > initial_timeout = std::nullopt,
    std::optional< double > end_silence_timeout = std::nullopt,
    std::optional< double > max_length = std::nullopt,
    const std::string & status_url = ""
)
```

## Parameters

| Name                  | Type                      | Required | Default        | Description |
| --------------------- | ------------------------- | -------- | -------------- | ----------- |
| `control_id`          | `const std::string &`     | no       | `""`           | —           |
| `stereo`              | `bool`                    | no       | `false`        | —           |
| `format`              | `const std::string &`     | no       | `"wav"`        | —           |
| `direction`           | `const std::string &`     | no       | `"both"`       | —           |
| `terminators`         | `const std::string &`     | no       | `""`           | —           |
| `beep`                | `bool`                    | no       | `false`        | —           |
| `input_sensitivity`   | `double`                  | no       | `44.0`         | —           |
| `initial_timeout`     | `std::optional< double >` | no       | `std::nullopt` | —           |
| `end_silence_timeout` | `std::optional< double >` | no       | `std::nullopt` | —           |
| `max_length`          | `std::optional< double >` | no       | `std::nullopt` | —           |
| `status_url`          | `const std::string &`     | no       | `""`           | —           |

## Returns

`FunctionResult &`

## Source

[`include/signalwire/swaig/function_result.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swaig/function_result.hpp)

Line 67.
