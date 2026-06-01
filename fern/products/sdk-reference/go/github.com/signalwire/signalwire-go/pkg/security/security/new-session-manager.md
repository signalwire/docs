---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/security/security/new-session-manager"
title: "NewSessionManager"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/security.NewSessionManager"
  parent: "github.com/signalwire/signalwire-go/pkg/security"
  module: "github.com.signalwire.signalwire-go.pkg.security"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/security/session_manager.go"
---
# `NewSessionManager`

NewSessionManager creates a new SessionManager. If tokenExpirySecs is <= 0, a default of 900 seconds (15 minutes) is used, matching the Python SDK default. Provide functional options (e.g. WithSecret) to customise behaviour.

## Signature

```go
func NewSessionManager(tokenExpirySecs int, opts ...Option) *SessionManager
```

## Parameters

| Name              | Type     | Required | Default | Description |
| ----------------- | -------- | -------- | ------- | ----------- |
| `tokenExpirySecs` | `int`    | yes      | —       | —           |
| `...opts`         | `Option` | no       | —       | —           |

## Returns

`*SessionManager`

## Source

[`pkg/security/session_manager.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/security/session_manager.go)

Line 55.
