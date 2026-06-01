---
slug: "/reference/cpp/signalwire/utils/url-validator/validate-url"
title: "validate_url"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "function"
  language: "cpp"
  qualified_name: "signalwire::utils::url_validator::validate_url"
  parent: "signalwire::utils::url_validator"
  module: "signalwire.utils"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/src/utils/url_validator.cpp"
  visibility: "public"
---
# `validate_url`

Validate that a URL is safe to fetch.
Mirrors Python's signalwire.utils.url\_validator.validate\_url(url, allow\_private=False) -> bool.

url

URL to validate.

allow\_private

When true, bypass the IP-blocklist check.

True iff the URL is safe to fetch.

## Signature

```cpp
bool validate_url(const std::string & url, bool allow_private = false)
```

## Parameters

| Name            | Type                  | Required | Default | Description                               |
| --------------- | --------------------- | -------- | ------- | ----------------------------------------- |
| `url`           | `const std::string &` | yes      | —       | URL to validate.                          |
| `allow_private` | `bool`                | no       | `false` | When true, bypass the IP-blocklist check. |

## Returns

`bool` — True iff the URL is safe to fetch.

## Source

[`src/utils/url_validator.cpp`](https://github.com/signalwire/signalwire-cpp/blob/main/src/utils/url_validator.cpp)

Line 189.
