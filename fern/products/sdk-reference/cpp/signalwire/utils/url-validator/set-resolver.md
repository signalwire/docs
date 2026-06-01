---
slug: "/reference/cpp/signalwire/utils/url-validator/set-resolver"
title: "_set_resolver"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "function"
  language: "cpp"
  qualified_name: "signalwire::utils::url_validator::_set_resolver"
  parent: "signalwire::utils::url_validator"
  module: "signalwire.utils"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/src/utils/url_validator.cpp"
  visibility: "public"
---
# `_set_resolver`

Install a custom resolver (for tests). Pass nullptr to clear.

## Signature

```cpp
void _set_resolver(ResolverFn resolver)
```

## Parameters

| Name       | Type         | Required | Default | Description |
| ---------- | ------------ | -------- | ------- | ----------- |
| `resolver` | `ResolverFn` | yes      | —       | —           |

## Source

[`src/utils/url_validator.cpp`](https://github.com/signalwire/signalwire-cpp/blob/main/src/utils/url_validator.cpp)

Line 185.
