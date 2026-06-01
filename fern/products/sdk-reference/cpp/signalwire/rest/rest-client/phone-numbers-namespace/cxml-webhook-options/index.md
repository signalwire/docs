---
slug: "/reference/cpp/signalwire/rest/rest-client/phone-numbers-namespace/cxml-webhook-options"
title: "CxmlWebhookOptions"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::rest::RestClient::PhoneNumbersNamespace::CxmlWebhookOptions"
  parent: "signalwire::rest::RestClient::PhoneNumbersNamespace"
  module: "signalwire.rest.RestClient.PhoneNumbersNamespace"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp"
  visibility: "public"
---
# `CxmlWebhookOptions`

Options for binding a phone number to a cXML (Twilio-compat) webhook.

## Signature

```cpp
struct signalwire::rest::RestClient::PhoneNumbersNamespace::CxmlWebhookOptions
```

## Properties

| Name                  | Type                                               | Required | Default | Description |
| --------------------- | -------------------------------------------------- | -------- | ------- | ----------- |
| `fallback_url`        | `std::optional< std::string > fallback_url`        | yes      | —       | —           |
| `status_callback_url` | `std::optional< std::string > status_callback_url` | yes      | —       | —           |

## Source

[`include/signalwire/rest/rest_client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp)

Line 473.
