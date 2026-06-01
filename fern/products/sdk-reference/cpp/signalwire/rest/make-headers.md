---
slug: "/reference/cpp/signalwire/rest/make-headers"
title: "make_headers"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "function"
  language: "cpp"
  qualified_name: "signalwire::rest::make_headers"
  parent: "signalwire::rest"
  module: "signalwire"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/src/rest/http_client.cpp"
  visibility: "public"
---
# `make_headers`

**Modifiers:** `static`

## Signature

```cpp
httplib::Headers make_headers(
    const std::string & auth,
    const std::map< std::string, std::string > & extra
)
```

## Parameters

| Name    | Type                                           | Required | Default | Description |
| ------- | ---------------------------------------------- | -------- | ------- | ----------- |
| `auth`  | `const std::string &`                          | yes      | —       | —           |
| `extra` | `const std::map< std::string, std::string > &` | yes      | —       | —           |

## Returns

`httplib::Headers`

## Source

[`src/rest/http_client.cpp`](https://github.com/signalwire/signalwire-cpp/blob/main/src/rest/http_client.cpp)

Line 77.
