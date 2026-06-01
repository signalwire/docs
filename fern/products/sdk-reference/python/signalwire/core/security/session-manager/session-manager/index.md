---
slug: "/reference/python/signalwire/core/security/session-manager/session-manager"
title: "SessionManager"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.core.security.session_manager.SessionManager"
  parent: "signalwire.core.security.session_manager"
  module: "signalwire.core.security.session_manager"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/security/session_manager.py"
---
# `SessionManager`

Manages security tokens for function calls

This implementation is completely stateless - it does not track call sessions
or store any information in memory. All validation is done using cryptographic
signatures with the tokens containing all necessary information.

## Signature

```python
class SessionManager
```

## Properties

| Name                | Type                | Required | Default | Description |
| ------------------- | ------------------- | -------- | ------- | ----------- |
| `secret_key`        | `secret_key`        | yes      | —       | —           |
| `token_expiry_secs` | `token_expiry_secs` | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/core/security/session-manager/session-manager/init) — Initialize the session manager
- [`activate_session`](/reference/python/signalwire/core/security/session-manager/session-manager/activate-session) — Legacy method, does nothing but returns success
- [`create_session`](/reference/python/signalwire/core/security/session-manager/session-manager/create-session) — Create a new session ID if one isn't provided
- [`create_tool_token`](/reference/python/signalwire/core/security/session-manager/session-manager/create-tool-token) — Alias for generate\_token to maintain backward compatibility
- [`debug_token`](/reference/python/signalwire/core/security/session-manager/session-manager/debug-token) — Debug a token without validating it
- [`end_session`](/reference/python/signalwire/core/security/session-manager/session-manager/end-session) — Legacy method, does nothing but returns success
- [`generate_token`](/reference/python/signalwire/core/security/session-manager/session-manager/generate-token) — Generate a secure self-contained token for a function call
- [`get_session_metadata`](/reference/python/signalwire/core/security/session-manager/session-manager/get-session-metadata) — Legacy method, always returns empty metadata
- [`set_session_metadata`](/reference/python/signalwire/core/security/session-manager/session-manager/set-session-metadata) — Legacy method, does nothing but returns success
- [`validate_token`](/reference/python/signalwire/core/security/session-manager/session-manager/validate-token) — Validate a function call token
- [`validate_tool_token`](/reference/python/signalwire/core/security/session-manager/session-manager/validate-tool-token) — Alias for validate\_token to maintain backward compatibility

## Source

[`/src/signalwire/signalwire/core/security/session_manager.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/security/session_manager.py)

Line 23.
