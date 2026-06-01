---
slug: "/reference/cpp/signalwire/rest/rest-client/datasphere-documents/list-chunks"
title: "list_chunks"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::rest::RestClient::DatasphereDocuments::list_chunks"
  parent: "signalwire::rest::RestClient::DatasphereDocuments"
  module: "signalwire.rest.RestClient"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp"
  visibility: "public"
---
# `list_chunks`

**Modifiers:** `const` `inline`

## Signature

```cpp
json list_chunks(
    const std::string & document_id,
    const std::map< std::string, std::string > & params = {}
) const
```

## Parameters

| Name          | Type                                           | Required | Default | Description |
| ------------- | ---------------------------------------------- | -------- | ------- | ----------- |
| `document_id` | `const std::string &`                          | yes      | —       | —           |
| `params`      | `const std::map< std::string, std::string > &` | no       | `{}`    | —           |

## Returns

`json`

## Source

[`include/signalwire/rest/rest_client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp)

Line 617.
