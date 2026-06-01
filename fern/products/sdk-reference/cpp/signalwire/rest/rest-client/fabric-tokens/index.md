---
slug: "/reference/cpp/signalwire/rest/rest-client/fabric-tokens"
title: "FabricTokens"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::rest::RestClient::FabricTokens"
  parent: "signalwire::rest::RestClient"
  module: "signalwire.rest.RestClient"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp"
  visibility: "public"
---
# `FabricTokens`

## Signature

```cpp
struct signalwire::rest::RestClient::FabricTokens
```

## Properties

| Name        | Type                        | Required | Default | Description |
| ----------- | --------------------------- | -------- | ------- | ----------- |
| `base_path` | `std::string base_path`     | yes      | —       | —           |
| `client`    | `const HttpClient & client` | yes      | —       | —           |

## Methods

- [`create_embed_token`](/reference/cpp/signalwire/rest/rest-client/fabric-tokens/create-embed-token)
- [`create_guest_token`](/reference/cpp/signalwire/rest/rest-client/fabric-tokens/create-guest-token)
- [`create_invite_token`](/reference/cpp/signalwire/rest/rest-client/fabric-tokens/create-invite-token)
- [`create_subscriber_token`](/reference/cpp/signalwire/rest/rest-client/fabric-tokens/create-subscriber-token)
- [`FabricTokens`](/reference/cpp/signalwire/rest/rest-client/fabric-tokens/fabric-tokens)
- [`refresh_subscriber_token`](/reference/cpp/signalwire/rest/rest-client/fabric-tokens/refresh-subscriber-token)

## Source

[`include/signalwire/rest/rest_client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp)

Line 187.
