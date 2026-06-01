---
slug: "/reference/cpp/signalwire/relay/relay-client/dial"
title: "dial"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::relay::RelayClient::dial"
  parent: "signalwire::relay::RelayClient"
  module: "signalwire.relay"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/client.hpp"
  visibility: "public"
---
# `dial`

Dial outbound. The devices argument is the nested "device-of-leg-of-leg" array used by the Python SDK (\[\[{type:phone,...}]]). Returns a Call once the server emits calling.call.dial(answered) for the dial's tag, or an empty Call on timeout / failure.
tag lets callers pin an explicit dial tag for journal-based assertions; if blank, a UUID is generated. dial\_timeout\_ms caps how long dial() blocks waiting for the server's terminal dial event. max\_duration (seconds) is forwarded into the calling.dial frame when non-zero.

## Signature

```cpp
Call dial(
    const json & devices,
    const std::string & tag = "",
    int dial_timeout_ms = 120000,
    int max_duration = 0
)
```

## Parameters

| Name              | Type                  | Required | Default  | Description |
| ----------------- | --------------------- | -------- | -------- | ----------- |
| `devices`         | `const json &`        | yes      | —        | —           |
| `tag`             | `const std::string &` | no       | `""`     | —           |
| `dial_timeout_ms` | `int`                 | no       | `120000` | —           |
| `max_duration`    | `int`                 | no       | `0`      | —           |

## Returns

`Call`

## Source

[`include/signalwire/relay/client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/client.hpp)

Line 97.
