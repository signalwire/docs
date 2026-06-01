---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/client/jwt-token"
title: "JWTToken"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.Client.JWTToken"
  parent: "github.com/signalwire/signalwire-go/pkg/relay.Client"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/client.go"
---
# `JWTToken`

JWTToken returns the configured JWT. Mirrors Python's public client.jwt\_token attribute, allowing callers to read back the value supplied via WithJWT(...).

## Signature

```go
func (*Client) JWTToken() string
```

## Returns

`string`

## Source

[`pkg/relay/client.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/client.go)

Line 139.
