---
slug: "/reference/cpp/signalwire/rest/rest-client/phone-numbers-namespace/set-relay-application"
title: "set_relay_application"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::rest::RestClient::PhoneNumbersNamespace::set_relay_application"
  parent: "signalwire::rest::RestClient::PhoneNumbersNamespace"
  module: "signalwire.rest.RestClient"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp"
  visibility: "public"
---
# `set_relay_application`

Route inbound calls to a named RELAY application.

**Modifiers:** `const` `inline`

## Signature

```cpp
json set_relay_application(
    const std::string & resource_id,
    const std::string & name
) const
```

## Parameters

| Name          | Type                  | Required | Default | Description |
| ------------- | --------------------- | -------- | ------- | ----------- |
| `resource_id` | `const std::string &` | yes      | —       | —           |
| `name`        | `const std::string &` | yes      | —       | —           |

## Returns

`json`

## Source

[`include/signalwire/rest/rest_client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp)

Line 591.
