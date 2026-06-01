---
slug: "/reference/cpp/signalwire/relay/base64-encode"
title: "base64_encode"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "function"
  language: "cpp"
  qualified_name: "signalwire::relay::base64_encode"
  parent: "signalwire::relay"
  module: "signalwire"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/src/relay/websocket.cpp"
  visibility: "public"
---
# `base64_encode`

**Modifiers:** `static`

## Signature

```cpp
std::string base64_encode(const unsigned char * data, size_t len)
```

## Parameters

| Name   | Type                    | Required | Default | Description |
| ------ | ----------------------- | -------- | ------- | ----------- |
| `data` | `const unsigned char *` | yes      | —       | —           |
| `len`  | `size_t`                | yes      | —       | —           |

## Returns

`std::string`

## Source

[`src/relay/websocket.cpp`](https://github.com/signalwire/signalwire-cpp/blob/main/src/relay/websocket.cpp)

Line 54.
