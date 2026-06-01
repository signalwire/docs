---
slug: "/reference/cpp/signalwire/utils/url-validator"
title: "url_validator"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "module"
  language: "cpp"
  qualified_name: "signalwire::utils::url_validator"
  parent: "signalwire::utils"
  module: "signalwire.utils"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/utils/url_validator.hpp"
---
# `url_validator`

## Signature

```cpp
namespace signalwire::utils::url_validator
```

## Constants

| Name               | Type                                                   | Required | Default | Description                                                                                       |
| ------------------ | ------------------------------------------------------ | -------- | ------- | ------------------------------------------------------------------------------------------------- |
| `BLOCKED_NETWORKS` | `const std::array< const char *, 9 > BLOCKED_NETWORKS` | yes      | —       | Cross-port SSRF block list. Order matches the Python reference for ease of cross-language review. |

## Functions

- [`_set_resolver`](/reference/cpp/signalwire/utils/url-validator/set-resolver) — Install a custom resolver (for tests). Pass nullptr to clear.
- [`validate_url`](/reference/cpp/signalwire/utils/url-validator/validate-url) — Validate that a URL is safe to fetch. Mirrors Python's signalwire.utils.url\_validator.validate\_url(url, allow\_private=False) -> bool.

## Type Aliases

- [`ResolverFn`](/reference/cpp/signalwire/utils/url-validator/resolver-fn) — Pluggable resolver. Tests inject a callable to keep the suite hermetic; production resolves via getaddrinfo. Returns nullopt on resolution failure. The signature: function(hostname) -> optional\<vector<string>> of IP-string addresses.

## Modules

- [`@002264057106375264217202213161167246223056041007`](/reference/cpp/signalwire/utils/url-validator/002264057106375264217202213161167246223056041007)

## Source

[`include/signalwire/utils/url_validator.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/utils/url_validator.hpp)

Line 16.
