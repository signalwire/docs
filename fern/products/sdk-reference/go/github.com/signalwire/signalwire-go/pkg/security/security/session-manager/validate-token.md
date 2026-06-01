---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/security/security/session-manager/validate-token"
title: "ValidateToken"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/security.SessionManager.ValidateToken"
  parent: "github.com/signalwire/signalwire-go/pkg/security.SessionManager"
  module: "github.com.signalwire.signalwire-go.pkg.security"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/security/session_manager.go"
---
# `ValidateToken`

ValidateToken verifies that a token is authentic, unexpired, and matches the expected function name and call ID. All comparisons are performed in constant time where possible to prevent timing attacks. Returns true only if every check passes.

## Signature

```go
func (*SessionManager) ValidateToken(functionName string, token string, callID string) bool
```

## Parameters

| Name           | Type     | Required | Default | Description |
| -------------- | -------- | -------- | ------- | ----------- |
| `functionName` | `string` | yes      | —       | —           |
| `token`        | `string` | yes      | —       | —           |
| `callID`       | `string` | yes      | —       | —           |

## Returns

`bool`

## Source

[`pkg/security/session_manager.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/security/session_manager.go)

Line 115.
