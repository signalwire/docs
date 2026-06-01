---
slug: "/reference/cpp/signalwire/rest/signal-wire-rest-error/signal-wire-rest-error"
title: "SignalWireRestError"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::rest::SignalWireRestError::SignalWireRestError"
  parent: "signalwire::rest::SignalWireRestError"
  module: "signalwire.rest"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/http_client.hpp"
  visibility: "public"
---
# `SignalWireRestError`

**Modifiers:** `inline`

## Signature

```cpp
void SignalWireRestError(
    int status,
    const std::string & message,
    const std::string & body = ""
)
```

## Parameters

| Name      | Type                  | Required | Default | Description |
| --------- | --------------------- | -------- | ------- | ----------- |
| `status`  | `int`                 | yes      | —       | —           |
| `message` | `const std::string &` | yes      | —       | —           |
| `body`    | `const std::string &` | no       | `""`    | —           |

## Source

[`include/signalwire/rest/http_client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/http_client.hpp)

Line 19.
