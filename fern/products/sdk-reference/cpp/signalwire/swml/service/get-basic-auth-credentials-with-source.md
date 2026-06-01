---
slug: "/reference/cpp/signalwire/swml/service/get-basic-auth-credentials-with-source"
title: "get_basic_auth_credentials_with_source"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::swml::Service::get_basic_auth_credentials_with_source"
  parent: "signalwire::swml::Service"
  module: "signalwire.swml"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/service.hpp"
  visibility: "public"
---
# `get_basic_auth_credentials_with_source`

Get (user, password, source) where source is one of "provided", "environment", or "generated". Python parity: AuthMixin.get\_basic\_auth\_credentials(include\_source=True).

**Modifiers:** `const`

## Signature

```cpp
std::tuple< std::string, std::string, std::string > get_basic_auth_credentials_with_source() const
```

## Returns

`std::tuple< std::string, std::string, std::string >`

## Source

[`include/signalwire/swml/service.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/service.hpp)

Line 82.
