---
slug: "/reference/cpp/signalwire/swml/service/swaig-pre-dispatch"
title: "swaig_pre_dispatch"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::swml::Service::swaig_pre_dispatch"
  parent: "signalwire::swml::Service"
  module: "signalwire.swml"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/service.hpp"
  visibility: "protected"
---
# `swaig_pre_dispatch`

Extension point: invoked between argument parsing and function dispatch on POST /swaig. Returns a target Service\* (defaults to this) and an optional short-circuit JSON. If short\_circuit is non-null, it's returned as the SWAIG response without calling on\_function\_call. AgentBase overrides for token validation.

**Modifiers:** `virtual`

## Signature

```cpp
std::pair< Service *, std::optional< json > > swaig_pre_dispatch(
    const json & request_data,
    const std::string & func_name
)
```

## Parameters

| Name           | Type                  | Required | Default | Description |
| -------------- | --------------------- | -------- | ------- | ----------- |
| `request_data` | `const json &`        | yes      | —       | —           |
| `func_name`    | `const std::string &` | yes      | —       | —           |

## Returns

`std::pair< Service *, std::optional< json > >`

## Source

[`include/signalwire/swml/service.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/service.hpp)

Line 268.
