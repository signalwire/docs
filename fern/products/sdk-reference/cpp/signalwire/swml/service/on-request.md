---
slug: "/reference/cpp/signalwire/swml/service/on-request"
title: "on_request"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::swml::Service::on_request"
  parent: "signalwire::swml::Service"
  module: "signalwire.swml"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/service.hpp"
  visibility: "public"
---
# `on_request`

Customization hook called when SWML is requested. Default delegates to on\_swml\_request and returns its result. Subclasses typically override on\_swml\_request rather than this method.
Returns std::nullopt to use the default SWML rendering, or a non-null JSON with modifications to merge into the rendered document.
Python parity: WebMixin.on\_request(request\_data, callback\_path). The Python third request argument is FastAPI-specific and intentionally not mirrored on the cross-language API.

**Modifiers:** `virtual`

## Signature

```cpp
std::optional< json > on_request(
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

Line 241.
