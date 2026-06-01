---
slug: "/reference/cpp/signalwire/rest/rest-client/phone-numbers-namespace/make-cxml-webhook-body"
title: "make_cxml_webhook_body"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::rest::RestClient::PhoneNumbersNamespace::make_cxml_webhook_body"
  parent: "signalwire::rest::RestClient::PhoneNumbersNamespace"
  module: "signalwire.rest.RestClient"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp"
  visibility: "public"
---
# `make_cxml_webhook_body`

**Modifiers:** `static` `inline`

## Signature

```cpp
json make_cxml_webhook_body(
    const std::string & url,
    const CxmlWebhookOptions & opts = {}
)
```

## Parameters

| Name   | Type                         | Required | Default | Description |
| ------ | ---------------------------- | -------- | ------- | ----------- |
| `url`  | `const std::string &`        | yes      | —       | —           |
| `opts` | `const CxmlWebhookOptions &` | no       | `{}`    | —           |

## Returns

`json`

## Source

[`include/signalwire/rest/rest_client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp)

Line 499.
