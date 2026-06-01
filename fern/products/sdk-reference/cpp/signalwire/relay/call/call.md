---
slug: "/reference/cpp/signalwire/relay/call/call"
title: "Call"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::relay::Call::Call"
  parent: "signalwire::relay::Call"
  module: "signalwire.relay"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/call.hpp"
  visibility: "public"
---
# `Call`

## Signature

**Overload 1**

```cpp
void Call()
```

**Overload 2**

```cpp
void Call(const std::string & call_id, const std::string & node_id)
```

**Overload 3**

```cpp
void Call(
    const std::string & call_id,
    const std::string & node_id,
    RelayClient * client
)
```

## Parameters (Overload 2)

| Name      | Type                  | Required | Default | Description |
| --------- | --------------------- | -------- | ------- | ----------- |
| `call_id` | `const std::string &` | yes      | —       | —           |
| `node_id` | `const std::string &` | yes      | —       | —           |

## Parameters (Overload 3)

| Name      | Type                  | Required | Default | Description |
| --------- | --------------------- | -------- | ------- | ----------- |
| `call_id` | `const std::string &` | yes      | —       | —           |
| `node_id` | `const std::string &` | yes      | —       | —           |
| `client`  | `RelayClient *`       | yes      | —       | —           |

## Source

[`include/signalwire/relay/call.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/call.hpp)

Line 33.
