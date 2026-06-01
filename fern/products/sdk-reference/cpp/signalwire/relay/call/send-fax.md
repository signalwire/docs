---
slug: "/reference/cpp/signalwire/relay/call/send-fax"
title: "send_fax"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::relay::Call::send_fax"
  parent: "signalwire::relay::Call"
  module: "signalwire.relay"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/call.hpp"
  visibility: "public"
---
# `send_fax`

## Signature

```cpp
Action send_fax(
    const std::string & document_url,
    const std::string & header = "",
    const std::string & identity = "",
    const std::string & control_id = ""
)
```

## Parameters

| Name           | Type                  | Required | Default | Description |
| -------------- | --------------------- | -------- | ------- | ----------- |
| `document_url` | `const std::string &` | yes      | —       | —           |
| `header`       | `const std::string &` | no       | `""`    | —           |
| `identity`     | `const std::string &` | no       | `""`    | —           |
| `control_id`   | `const std::string &` | no       | `""`    | —           |

## Returns

`Action`

## Source

[`include/signalwire/relay/call.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/call.hpp)

Line 82.
