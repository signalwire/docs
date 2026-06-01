---
slug: "/reference/cpp/signalwire/swml/service/schema-utils"
title: "schema_utils"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::swml::Service::schema_utils"
  parent: "signalwire::swml::Service"
  module: "signalwire.swml"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/service.hpp"
  visibility: "public"
---
# `schema_utils`

SchemaUtils helper bound to this Service. Mirrors Python's self.schema\_utils instance attribute on SWMLService. Built lazily on first access; the underlying schema is cached so the helper is cheap to build.

## Signature

**Overload 1**

```cpp
signalwire::utils::SchemaUtils & schema_utils()
```

**Overload 2**

```cpp
const signalwire::utils::SchemaUtils & schema_utils() const
```

## Returns (Overload 1)

`signalwire::utils::SchemaUtils &`

## Returns (Overload 2)

`const signalwire::utils::SchemaUtils &`

## Source

[`include/signalwire/swml/service.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/swml/service.hpp)

Line 145.
