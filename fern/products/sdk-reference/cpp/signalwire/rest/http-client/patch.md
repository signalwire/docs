---
slug: "/reference/cpp/signalwire/rest/http-client/patch"
title: "patch"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::rest::HttpClient::patch"
  parent: "signalwire::rest::HttpClient"
  module: "signalwire.rest"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/http_client.hpp"
  visibility: "public"
---
# `patch`

PATCH request.

**Modifiers:** `const`

## Signature

```cpp
json patch(const std::string & path, const json & body = json::object()) const
```

## Parameters

| Name   | Type                  | Required | Default          | Description |
| ------ | --------------------- | -------- | ---------------- | ----------- |
| `path` | `const std::string &` | yes      | —                | —           |
| `body` | `const json &`        | no       | `json::object()` | —           |

## Returns

`json`

## Source

[`include/signalwire/rest/http_client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/http_client.hpp)

Line 48.
