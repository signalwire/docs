---
slug: "/reference/cpp/signalwire/rest/rest-client/calling-namespace/send-fax-stop"
title: "send_fax_stop"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::rest::RestClient::CallingNamespace::send_fax_stop"
  parent: "signalwire::rest::RestClient::CallingNamespace"
  module: "signalwire.rest.RestClient"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp"
  visibility: "public"
---
# `send_fax_stop`

**Modifiers:** `const` `inline`

## Signature

```cpp
json send_fax_stop(
    const std::string & call_id,
    const json & params = json::object()
) const
```

## Parameters

| Name      | Type                  | Required | Default          | Description |
| --------- | --------------------- | -------- | ---------------- | ----------- |
| `call_id` | `const std::string &` | yes      | —                | —           |
| `params`  | `const json &`        | no       | `json::object()` | —           |

## Returns

`json`

## Source

[`include/signalwire/rest/rest_client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp)

Line 416.
