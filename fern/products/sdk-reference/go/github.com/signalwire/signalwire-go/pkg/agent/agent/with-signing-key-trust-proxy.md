---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/with-signing-key-trust-proxy"
title: "WithSigningKeyTrustProxy"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/agent.WithSigningKeyTrustProxy"
  parent: "github.com/signalwire/signalwire-go/pkg/agent"
  module: "github.com.signalwire.signalwire-go.pkg.agent"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go"
---
# `WithSigningKeyTrustProxy`

WithSigningKeyTrustProxy enables X-Forwarded-Proto / X-Forwarded-Host honoring during URL reconstruction. Set true when AgentBase runs behind a reverse proxy / ngrok / load balancer that terminates TLS upstream; without it the validator sees the internal scheme/host and the signature will mismatch.

No Python parity flag — Python's web\_mixin reads X-Forwarded-\* headers unconditionally; in Go we make it explicit because forging these headers is a real attack on naive deployments.

## Signature

```go
func WithSigningKeyTrustProxy(trust bool) AgentOption
```

## Parameters

| Name    | Type   | Required | Default | Description |
| ------- | ------ | -------- | ------- | ----------- |
| `trust` | `bool` | yes      | —       | —           |

## Returns

`AgentOption`

## Source

[`pkg/agent/agent.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go)

Line 310.
