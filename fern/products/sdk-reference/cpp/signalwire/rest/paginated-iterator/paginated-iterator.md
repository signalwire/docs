---
slug: "/reference/cpp/signalwire/rest/paginated-iterator/paginated-iterator"
title: "PaginatedIterator"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::rest::PaginatedIterator::PaginatedIterator"
  parent: "signalwire::rest::PaginatedIterator"
  module: "signalwire.rest"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/http_client.hpp"
  visibility: "public"
---
# `PaginatedIterator`

## Signature

```cpp
void PaginatedIterator(
    const HttpClient & http,
    const std::string & path,
    const std::map< std::string, std::string > & params = {},
    const std::string & data_key = "data"
)
```

## Parameters

| Name       | Type                                           | Required | Default  | Description |
| ---------- | ---------------------------------------------- | -------- | -------- | ----------- |
| `http`     | `const HttpClient &`                           | yes      | —        | —           |
| `path`     | `const std::string &`                          | yes      | —        | —           |
| `params`   | `const std::map< std::string, std::string > &` | no       | `{}`     | —           |
| `data_key` | `const std::string &`                          | no       | `"data"` | —           |

## Source

[`include/signalwire/rest/http_client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/http_client.hpp)

Line 101.
