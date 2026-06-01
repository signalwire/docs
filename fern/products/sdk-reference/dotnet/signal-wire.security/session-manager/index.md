---
slug: "/reference/dotnet/signal-wire.security/session-manager"
title: "SessionManager"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Security.SessionManager"
  parent: "SignalWire.Security"
  module: "SignalWire.Security"
  visibility: "public"
---
# `SessionManager`

Generates and validates HMAC-SHA256 signed session tokens for SWAIG function calls.
Each instance holds an independent 32-byte random secret.

**Modifiers:** `sealed`

## Signature

```dotnet
public sealed class SessionManager
```

## Properties

| Name              | Type                                    | Required | Default | Description                                          |
| ----------------- | --------------------------------------- | -------- | ------- | ---------------------------------------------------- |
| `DefaultExpiry`   | `public const int DefaultExpiry = 3600` | yes      | —       | Default token lifetime in seconds.                   |
| `TokenExpirySecs` | `public int TokenExpirySecs { get; }`   | yes      | —       | Get the configured token expiry duration in seconds. |

## Methods

- [`CreateSession(string?)`](/reference/dotnet/signal-wire.security/session-manager/create-session-string) — Create or confirm a session, returning the call ID.
- [`CreateToken(string, string)`](/reference/dotnet/signal-wire.security/session-manager/create-token-string-string) — Generate an HMAC-SHA256 signed token bound to a function name and call ID.
- [`SessionManager(int)`](/reference/dotnet/signal-wire.security/session-manager/session-manager-int)
- [`ValidateToken(string, string, string)`](/reference/dotnet/signal-wire.security/session-manager/validate-token-string-string-string) — Validate a token against the expected function name and call ID. All comparisons use timing-safe equality checks to prevent side-channel attacks.
