---
slug: "/reference/cpp/signalwire/rest/rest-client/calling-namespace/user-event"
title: "user_event"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::rest::RestClient::CallingNamespace::user_event"
  parent: "signalwire::rest::RestClient::CallingNamespace"
  module: "signalwire.rest.RestClient"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp"
  visibility: "public"
---
# `user_event`

**Modifiers:** `const` `inline`

## Signature

```cpp
json user_event(const std::string & call_id, const json & params) const
```

## Parameters

| Name      | Type                  | Required | Default | Description |
| --------- | --------------------- | -------- | ------- | ----------- |
| `call_id` | `const std::string &` | yes      | —       | —           |
| `params`  | `const json &`        | yes      | —       | —           |

## Returns

`json`

## Source

[`include/signalwire/rest/rest_client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp)

Line 431.
