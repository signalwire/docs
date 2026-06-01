---
slug: "/reference/cpp/signalwire/rest/rest-client/with-base-url"
title: "with_base_url"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::rest::RestClient::with_base_url"
  parent: "signalwire::rest::RestClient"
  module: "signalwire.rest"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp"
  visibility: "public"
---
# `with_base_url`

Construct with an explicit pre-built base URL (http://... or https://...) instead of synthesizing one from the SignalWire space hostname. Used by audit harnesses pointing the client at loopback fixtures. The space-based constructor remains the production path.

**Modifiers:** `static`

## Signature

```cpp
RestClient with_base_url(
    const std::string & base_url,
    const std::string & project_id,
    const std::string & token
)
```

## Parameters

| Name         | Type                  | Required | Default | Description |
| ------------ | --------------------- | -------- | ------- | ----------- |
| `base_url`   | `const std::string &` | yes      | —       | —           |
| `project_id` | `const std::string &` | yes      | —       | —           |
| `token`      | `const std::string &` | yes      | —       | —           |

## Returns

`RestClient`

## Source

[`include/signalwire/rest/rest_client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp)

Line 32.
