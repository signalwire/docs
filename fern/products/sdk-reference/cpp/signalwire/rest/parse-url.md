---
slug: "/reference/cpp/signalwire/rest/parse-url"
title: "parse_url"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "function"
  language: "cpp"
  qualified_name: "signalwire::rest::parse_url"
  parent: "signalwire::rest"
  module: "signalwire"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/src/rest/http_client.cpp"
  visibility: "public"
---
# `parse_url`

**Modifiers:** `static`

## Signature

```cpp
std::pair< std::string, std::string > parse_url(const std::string & base_url)
```

## Parameters

| Name       | Type                  | Required | Default | Description |
| ---------- | --------------------- | -------- | ------- | ----------- |
| `base_url` | `const std::string &` | yes      | —       | —           |

## Returns

`std::pair< std::string, std::string >`

## Source

[`src/rest/http_client.cpp`](https://github.com/signalwire/signalwire-cpp/blob/main/src/rest/http_client.cpp)

Line 65.
