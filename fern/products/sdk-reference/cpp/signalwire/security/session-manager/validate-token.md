---
slug: "/reference/cpp/signalwire/security/session-manager/validate-token"
title: "validate_token"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::security::SessionManager::validate_token"
  parent: "signalwire::security::SessionManager"
  module: "signalwire.security"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/security/session_manager.hpp"
  visibility: "public"
---
# `validate_token`

Validate a token

token

The token to validate

function\_name

Expected function name

call\_id

Expected call ID

true if token is valid and not expired

**Modifiers:** `const`

## Signature

```cpp
bool validate_token(
    const std::string & token,
    const std::string & function_name,
    const std::string & call_id
) const
```

## Parameters

| Name            | Type                  | Required | Default | Description            |
| --------------- | --------------------- | -------- | ------- | ---------------------- |
| `token`         | `const std::string &` | yes      | —       | The token to validate  |
| `function_name` | `const std::string &` | yes      | —       | Expected function name |
| `call_id`       | `const std::string &` | yes      | —       | Expected call ID       |

## Returns

`bool` — true if token is valid and not expired

## Source

[`include/signalwire/security/session_manager.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/security/session_manager.hpp)

Line 36.
