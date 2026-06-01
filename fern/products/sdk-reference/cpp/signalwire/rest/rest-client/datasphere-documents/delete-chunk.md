---
slug: "/reference/cpp/signalwire/rest/rest-client/datasphere-documents/delete-chunk"
title: "delete_chunk"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::rest::RestClient::DatasphereDocuments::delete_chunk"
  parent: "signalwire::rest::RestClient::DatasphereDocuments"
  module: "signalwire.rest.RestClient"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp"
  visibility: "public"
---
# `delete_chunk`

**Modifiers:** `const` `inline`

## Signature

```cpp
json delete_chunk(
    const std::string & document_id,
    const std::string & chunk_id
) const
```

## Parameters

| Name          | Type                  | Required | Default | Description |
| ------------- | --------------------- | -------- | ------- | ----------- |
| `document_id` | `const std::string &` | yes      | —       | —           |
| `chunk_id`    | `const std::string &` | yes      | —       | —           |

## Returns

`json`

## Source

[`include/signalwire/rest/rest_client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp)

Line 625.
