---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/new-relay-client"
title: "NewRelayClient"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.NewRelayClient"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/client.go"
---
# `NewRelayClient`

NewRelayClient creates a new RELAY Client with the given options.

After explicit options are applied, any remaining unset auth/space fields fall back to SIGNALWIRE\_PROJECT\_ID, SIGNALWIRE\_API\_TOKEN, SIGNALWIRE\_JWT\_TOKEN, SIGNALWIRE\_SPACE, and RELAY\_MAX\_ACTIVE\_CALLS environment variables — matching Python RelayClient.**init**'s automatic env-var fallback (relay/client.py:115-119). Explicit options always win.

## Signature

```go
func NewRelayClient(opts ...ClientOption) *Client
```

## Parameters

| Name      | Type           | Required | Default | Description |
| --------- | -------------- | -------- | ------- | ----------- |
| `...opts` | `ClientOption` | no       | —       | —           |

## Returns

`*Client`

## Source

[`pkg/relay/client.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/client.go)

Line 63.
