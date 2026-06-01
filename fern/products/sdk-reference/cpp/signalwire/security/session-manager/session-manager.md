---
slug: "/reference/cpp/signalwire/security/session-manager/session-manager"
title: "SessionManager"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::security::SessionManager::SessionManager"
  parent: "signalwire::security::SessionManager"
  module: "signalwire.security"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/security/session_manager.hpp"
  visibility: "public"
---
# `SessionManager`

Construct with a random 32-byte secret.

## Signature

**Overload 1**

```cpp
void SessionManager()
```

**Overload 2**

```cpp
void SessionManager(const std::vector< uint8_t > & secret)
```

## Parameters (Overload 2)

| Name     | Type                             | Required | Default | Description |
| -------- | -------------------------------- | -------- | ------- | ----------- |
| `secret` | `const std::vector< uint8_t > &` | yes      | —       | —           |

## Source

[`include/signalwire/security/session_manager.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/security/session_manager.hpp)

Line 17.
