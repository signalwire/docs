---
slug: "/reference/cpp/signalwire/swml/service/on-swml-request"
title: "on_swml_request"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::swml::Service::on_swml_request"
  parent: "signalwire::swml::Service"
  module: "signalwire.swml"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/service.hpp"
  visibility: "public"
---
# `on_swml_request`

Customization point for subclasses to modify SWML based on request data. Default returns std::nullopt (no modification).
Python parity: WebMixin.on\_swml\_request(request\_data, callback\_path).

**Modifiers:** `virtual`

## Signature

```cpp
std::optional< json > on_swml_request(
    const std::optional< json > & request_data = std::nullopt,
    const std::optional< std::string > & callback_path = std::nullopt
)
```

## Parameters

| Name            | Type                                   | Required | Default        | Description |
| --------------- | -------------------------------------- | -------- | -------------- | ----------- |
| `request_data`  | `const std::optional< json > &`        | no       | `std::nullopt` | —           |
| `callback_path` | `const std::optional< std::string > &` | no       | `std::nullopt` | —           |

## Returns

`std::optional< json >`

## Source

[`include/signalwire/swml/service.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/service.hpp)

Line 249.
