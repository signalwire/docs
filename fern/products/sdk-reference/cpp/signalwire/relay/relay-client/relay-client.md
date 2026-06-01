---
slug: "/reference/cpp/signalwire/relay/relay-client/relay-client"
title: "RelayClient"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::relay::RelayClient::RelayClient"
  parent: "signalwire::relay::RelayClient"
  module: "signalwire.relay"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/client.hpp"
  visibility: "public"
---
# `RelayClient`

Construct from explicit configuration.

**Modifiers:** `explicit`

## Signature

**Overload 1**

```cpp
void RelayClient(const RelayConfig & config = RelayConfig{})
```

**Overload 2**

```cpp
void RelayClient(
    const std::string & project,
    const std::string & token,
    const std::string & host = DEFAULT_HOST,
    const std::vector< std::string > & contexts = {"default"}
)
```

**Overload 3**

```cpp
void RelayClient(const RelayClient &)
```

## Parameters (Overload 1)

| Name     | Type                  | Required | Default         | Description |
| -------- | --------------------- | -------- | --------------- | ----------- |
| `config` | `const RelayConfig &` | no       | `RelayConfig{}` | —           |

## Parameters (Overload 2)

| Name       | Type                                 | Required | Default        | Description |
| ---------- | ------------------------------------ | -------- | -------------- | ----------- |
| `project`  | `const std::string &`                | yes      | —              | —           |
| `token`    | `const std::string &`                | yes      | —              | —           |
| `host`     | `const std::string &`                | no       | `DEFAULT_HOST` | —           |
| `contexts` | `const std::vector< std::string > &` | no       | `{"default"}`  | —           |

## Parameters (Overload 3)

| Name | Type                  | Required | Default | Description |
| ---- | --------------------- | -------- | ------- | ----------- |
| `_`  | `const RelayClient &` | yes      | —       | —           |

## Source

[`include/signalwire/relay/client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/client.hpp)

Line 59.
