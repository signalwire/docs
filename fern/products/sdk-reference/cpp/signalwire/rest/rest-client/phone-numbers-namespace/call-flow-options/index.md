---
slug: "/reference/cpp/signalwire/rest/rest-client/phone-numbers-namespace/call-flow-options"
title: "CallFlowOptions"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::rest::RestClient::PhoneNumbersNamespace::CallFlowOptions"
  parent: "signalwire::rest::RestClient::PhoneNumbersNamespace"
  module: "signalwire.rest.RestClient.PhoneNumbersNamespace"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp"
  visibility: "public"
---
# `CallFlowOptions`

Options for binding a phone number to a call flow.

## Signature

```cpp
struct signalwire::rest::RestClient::PhoneNumbersNamespace::CallFlowOptions
```

## Properties

| Name      | Type                                   | Required | Default | Description                                                                   |
| --------- | -------------------------------------- | -------- | ------- | ----------------------------------------------------------------------------- |
| `version` | `std::optional< std::string > version` | yes      | —       | Accepts "working\_copy" or "current\_deployed" (server default when omitted). |

## Source

[`include/signalwire/rest/rest_client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp)

Line 479.
