---
slug: "/reference/cpp/signalwire/security/session-manager/create-token"
title: "create_token"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::security::SessionManager::create_token"
  parent: "signalwire::security::SessionManager"
  module: "signalwire.security"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/security/session_manager.hpp"
  visibility: "public"
---
# `create_token`

Create a signed token for a function call

function\_name

The SWAIG function name

call\_id

The call identifier

expiry\_seconds

Seconds until expiry (default 3600)

The signed token string

**Modifiers:** `const`

## Signature

```cpp
std::string create_token(
    const std::string & function_name,
    const std::string & call_id,
    int expiry_seconds = 3600
) const
```

## Parameters

| Name             | Type                  | Required | Default | Description                         |
| ---------------- | --------------------- | -------- | ------- | ----------------------------------- |
| `function_name`  | `const std::string &` | yes      | —       | The SWAIG function name             |
| `call_id`        | `const std::string &` | yes      | —       | The call identifier                 |
| `expiry_seconds` | `int`                 | no       | `3600`  | Seconds until expiry (default 3600) |

## Returns

`std::string` — The signed token string

## Source

[`include/signalwire/security/session_manager.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/security/session_manager.hpp)

Line 27.
