---
slug: "/reference/cpp/signalwire/datamap/data-map/webhook"
title: "webhook"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::datamap::DataMap::webhook"
  parent: "signalwire::datamap::DataMap"
  module: "signalwire.datamap"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/datamap/datamap.hpp"
  visibility: "public"
---
# `webhook`

Add a webhook API call.

## Signature

```cpp
DataMap & webhook(
    const std::string & method,
    const std::string & url,
    const json & headers = json::object(),
    const std::string & form_param = "",
    bool input_args_as_params = false,
    const std::vector< std::string > & require_args = {}
)
```

## Parameters

| Name                   | Type                                 | Required | Default          | Description |
| ---------------------- | ------------------------------------ | -------- | ---------------- | ----------- |
| `method`               | `const std::string &`                | yes      | —                | —           |
| `url`                  | `const std::string &`                | yes      | —                | —           |
| `headers`              | `const json &`                       | no       | `json::object()` | —           |
| `form_param`           | `const std::string &`                | no       | `""`             | —           |
| `input_args_as_params` | `bool`                               | no       | `false`          | —           |
| `require_args`         | `const std::vector< std::string > &` | no       | `{}`             | —           |

## Returns

`DataMap &`

## Source

[`include/signalwire/datamap/datamap.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/datamap/datamap.hpp)

Line 71.
