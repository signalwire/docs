---
slug: "/reference/cpp/signalwire/swml/service/set-auth"
title: "set_auth"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::swml::Service::set_auth"
  parent: "signalwire::swml::Service"
  module: "signalwire.swml"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/service.hpp"
  visibility: "public"
---
# `set_auth`

Set basic auth credentials (auto-generated if not set).

## Signature

```cpp
Service & set_auth(const std::string & username, const std::string & password)
```

## Parameters

| Name       | Type                  | Required | Default | Description |
| ---------- | --------------------- | -------- | ------- | ----------- |
| `username` | `const std::string &` | yes      | —       | —           |
| `password` | `const std::string &` | yes      | —       | —           |

## Returns

`Service &`

## Source

[`include/signalwire/swml/service.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/service.hpp)

Line 57.
