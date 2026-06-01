---
slug: "/reference/cpp/signalwire/contexts/context-builder/validate"
title: "validate"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::contexts::ContextBuilder::validate"
  parent: "signalwire::contexts::ContextBuilder"
  module: "signalwire.contexts"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/contexts/contexts.hpp"
  visibility: "public"
---
# `validate`

Validate all contexts. Checks:
At least one context is defined
A single context must be named "default"
Every context has at least one step
gather\_info completion\_action targets an existing step
No user-defined SWAIG tool collides with a reserved native name (via the attached tool-name supplier)

**Modifiers:** `const`

## Signature

```cpp
void validate() const
```

## Source

[`include/signalwire/contexts/contexts.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/contexts/contexts.hpp)

Line 424.
