---
slug: "/reference/dotnet/signal-wire.security/session-manager/create-token-string-string"
title: "CreateToken(string, string)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Security.SessionManager.CreateToken(string, string)"
  parent: "SignalWire.Security.SessionManager"
  module: "SignalWire.Security"
  visibility: "public"
---
# `CreateToken(string, string)`

Generate an HMAC-SHA256 signed token bound to a function name and call ID.

## Signature

```dotnet
public string CreateToken(string functionName, string callId)
```

## Parameters

| Name           | Type     | Required | Default | Description                               |
| -------------- | -------- | -------- | ------- | ----------------------------------------- |
| `functionName` | `string` | yes      | —       | The function name to bind into the token. |
| `callId`       | `string` | yes      | —       | The call ID to bind into the token.       |

## Returns

`string` — A base64url-encoded token string.
