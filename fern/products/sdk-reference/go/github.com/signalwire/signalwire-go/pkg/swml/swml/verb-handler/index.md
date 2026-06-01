---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/verb-handler"
title: "VerbHandler"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "interface"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swml.VerbHandler"
  parent: "github.com/signalwire/signalwire-go/pkg/swml"
  module: "github.com.signalwire.signalwire-go.pkg.swml"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/verb_handler.go"
---
# `VerbHandler`

VerbHandler defines the contract for specialized SWML verb handlers.

Implementations provide verb-specific validation and configuration-building logic for complex SWML verbs that cannot be handled generically. This is the Go equivalent of the Python SWMLVerbHandler abstract base class.

## Signature

```go
type VerbHandler interface { GetVerbName; ValidateConfig; BuildConfig }
```

## Methods

- [`BuildConfig`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/verb-handler/build-config) — BuildConfig builds a configuration map for this verb from the provided
- [`GetVerbName`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/verb-handler/get-verb-name) — GetVerbName returns the name of the SWML verb this handler handles.
- [`ValidateConfig`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/verb-handler/validate-config) — ValidateConfig validates the configuration map for this verb.

## Source

[`pkg/swml/verb_handler.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/verb_handler.go)

Line 15.
