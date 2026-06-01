---
slug: "/reference/cpp/signalwire/rest/rest-client/compat-namespace"
title: "CompatNamespace"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::rest::RestClient::CompatNamespace"
  parent: "signalwire::rest::RestClient"
  module: "signalwire.rest.RestClient"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp"
  visibility: "public"
---
# `CompatNamespace`

## Signature

```cpp
struct signalwire::rest::RestClient::CompatNamespace
```

## Properties

| Name             | Type                                  | Required | Default | Description |
| ---------------- | ------------------------------------- | -------- | ------- | ----------- |
| `account_base`   | `std::string account_base`            | yes      | —       | —           |
| `accounts`       | `CompatAccounts accounts`             | yes      | —       | —           |
| `applications`   | `CompatApplications applications`     | yes      | —       | —           |
| `calls`          | `CompatCalls calls`                   | yes      | —       | —           |
| `client`         | `const HttpClient & client`           | yes      | —       | —           |
| `conferences`    | `CompatConferences conferences`       | yes      | —       | —           |
| `faxes`          | `CompatFaxes faxes`                   | yes      | —       | —           |
| `laml_bins`      | `CompatLamlBins laml_bins`            | yes      | —       | —           |
| `messages`       | `CompatMessages messages`             | yes      | —       | —           |
| `phone_numbers`  | `CompatPhoneNumbers phone_numbers`    | yes      | —       | —           |
| `queues`         | `CompatQueues queues`                 | yes      | —       | —           |
| `recordings`     | `CompatRecordings recordings`         | yes      | —       | —           |
| `tokens`         | `CompatTokens tokens`                 | yes      | —       | —           |
| `transcriptions` | `CompatTranscriptions transcriptions` | yes      | —       | —           |

## Methods

- [`CompatNamespace`](/reference/cpp/signalwire/rest/rest-client/compat-namespace/compat-namespace)
- [`create_call`](/reference/cpp/signalwire/rest/rest-client/compat-namespace/create-call)
- [`list_calls`](/reference/cpp/signalwire/rest/rest-client/compat-namespace/list-calls)
- [`list_messages`](/reference/cpp/signalwire/rest/rest-client/compat-namespace/list-messages)
- [`send_message`](/reference/cpp/signalwire/rest/rest-client/compat-namespace/send-message)

## Source

[`include/signalwire/rest/rest_client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp)

Line 1093.
