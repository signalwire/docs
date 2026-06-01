---
slug: "/reference/cpp/signalwire/relay/action/action"
title: "Action"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::relay::Action::Action"
  parent: "signalwire::relay::Action"
  module: "signalwire.relay"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/action.hpp"
  visibility: "public"
---
# `Action`

## Signature

**Overload 1**

```cpp
void Action()
```

**Overload 2**

```cpp
void Action(const std::string & control_id)
```

**Overload 3**

```cpp
void Action(
    const std::string & control_id,
    RelayClient * client,
    const std::string & call_id,
    const std::string & node_id
)
```

## Parameters (Overload 2)

| Name         | Type                  | Required | Default | Description |
| ------------ | --------------------- | -------- | ------- | ----------- |
| `control_id` | `const std::string &` | yes      | —       | —           |

## Parameters (Overload 3)

| Name         | Type                  | Required | Default | Description |
| ------------ | --------------------- | -------- | ------- | ----------- |
| `control_id` | `const std::string &` | yes      | —       | —           |
| `client`     | `RelayClient *`       | yes      | —       | —           |
| `call_id`    | `const std::string &` | yes      | —       | —           |
| `node_id`    | `const std::string &` | yes      | —       | —           |

## Source

[`include/signalwire/relay/action.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/action.hpp)

Line 27.
