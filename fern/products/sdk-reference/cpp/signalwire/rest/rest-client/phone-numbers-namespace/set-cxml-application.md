---
slug: "/reference/cpp/signalwire/rest/rest-client/phone-numbers-namespace/set-cxml-application"
title: "set_cxml_application"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::rest::RestClient::PhoneNumbersNamespace::set_cxml_application"
  parent: "signalwire::rest::RestClient::PhoneNumbersNamespace"
  module: "signalwire.rest.RestClient"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp"
  visibility: "public"
---
# `set_cxml_application`

Route inbound calls to an existing cXML application by ID.

**Modifiers:** `const` `inline`

## Signature

```cpp
json set_cxml_application(
    const std::string & resource_id,
    const std::string & application_id
) const
```

## Parameters

| Name             | Type                  | Required | Default | Description |
| ---------------- | --------------------- | -------- | ------- | ----------- |
| `resource_id`    | `const std::string &` | yes      | —       | —           |
| `application_id` | `const std::string &` | yes      | —       | —           |

## Returns

`json`

## Source

[`include/signalwire/rest/rest_client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp)

Line 571.
