---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/fax-action/stop"
title: "Stop"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.FaxAction.Stop"
  parent: "github.com/signalwire/signalwire-go/pkg/relay.FaxAction"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/action.go"
---
# `Stop`

Stop sends "calling.{methodPrefix}.stop" (e.g. "calling.send\_fax.stop" or "calling.receive\_fax.stop") to halt the active fax operation.

## Signature

```go
func (*FaxAction) Stop() error
```

## Returns

`error`

## Source

[`pkg/relay/action.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/action.go)

Line 407.
