---
slug: "/reference/dotnet/signal-wire.security/session-manager/validate-token-string-string-string"
title: "ValidateToken(string, string, string)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Security.SessionManager.ValidateToken(string, string, string)"
  parent: "SignalWire.Security.SessionManager"
  module: "SignalWire.Security"
  visibility: "public"
---
# `ValidateToken(string, string, string)`

Validate a token against the expected function name and call ID.
All comparisons use timing-safe equality checks to prevent side-channel attacks.

## Signature

```dotnet
public bool ValidateToken(string functionName, string callId, string token)
```

## Parameters

| Name           | Type     | Required | Default | Description                              |
| -------------- | -------- | -------- | ------- | ---------------------------------------- |
| `functionName` | `string` | yes      | —       | The expected function name.              |
| `callId`       | `string` | yes      | —       | The expected call ID.                    |
| `token`        | `string` | yes      | —       | The base64url-encoded token to validate. |

## Returns

`bool` — <code>true</code> if the token is valid and not expired.
