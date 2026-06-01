---
slug: "/reference/cpp/signalwire/swml/service/validate-basic-auth"
title: "validate_basic_auth"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::swml::Service::validate_basic_auth"
  parent: "signalwire::swml::Service"
  module: "signalwire.swml"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/service.hpp"
  visibility: "public"
---
# `validate_basic_auth`

Validate provided basic-auth credentials against the configured ones using a constant-time comparison. Python parity: AuthMixin.validate\_basic\_auth(username, password).

**Modifiers:** `const`

## Signature

```cpp
bool validate_basic_auth(
    const std::string & username,
    const std::string & password
) const
```

## Parameters

| Name       | Type                  | Required | Default | Description |
| ---------- | --------------------- | -------- | ------- | ----------- |
| `username` | `const std::string &` | yes      | —       | —           |
| `password` | `const std::string &` | yes      | —       | —           |

## Returns

`bool`

## Source

[`include/signalwire/swml/service.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/service.hpp)

Line 72.
