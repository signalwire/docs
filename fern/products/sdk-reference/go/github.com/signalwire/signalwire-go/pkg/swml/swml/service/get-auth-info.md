---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/get-auth-info"
title: "GetAuthInfo"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swml.Service.GetAuthInfo"
  parent: "github.com/signalwire/signalwire-go/pkg/swml.Service"
  module: "github.com.signalwire.signalwire-go.pkg.swml"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/service.go"
---
# `GetAuthInfo`

GetAuthInfo returns a map describing every configured authentication method. The map mirrors the Python AuthHandler.get\_auth\_info() return value:

- "basic" → {"enabled": true, "username": "\<user>"}
- "bearer" → {"enabled": true, "hint": "Use Authorization: Bearer \<token>"}
- "api\_key" → {"enabled": true, "header": "\<hdr>", "hint": "Use \<hdr>: \<key>"}

Only methods that are actively configured appear in the map. Basic auth is always present because the service always has a username/password (either explicit or auto-generated). Mirrors Python AuthHandler.get\_auth\_info() -> Dict\[str, Any].

## Signature

```go
func (*Service) GetAuthInfo() map[string]any
```

## Returns

`map[string]any`

## Source

[`pkg/swml/service.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/service.go)

Line 513.
