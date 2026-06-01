---
slug: "/reference/cpp/signalwire/get-env"
title: "get_env"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "function"
  language: "cpp"
  qualified_name: "signalwire::get_env"
  parent: "signalwire"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/common.hpp"
  visibility: "public"
---
# `get_env`

**Modifiers:** `inline`

## Signature

```cpp
std::string get_env(
    const std::string & key,
    const std::string & default_val = ""
)
```

## Parameters

| Name          | Type                  | Required | Default | Description |
| ------------- | --------------------- | -------- | ------- | ----------- |
| `key`         | `const std::string &` | yes      | —       | —           |
| `default_val` | `const std::string &` | no       | `""`    | —           |

## Returns

`std::string`

## Source

[`include/signalwire/common.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/common.hpp)

Line 49.
