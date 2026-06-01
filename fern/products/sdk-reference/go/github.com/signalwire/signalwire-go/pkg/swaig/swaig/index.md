---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig"
title: "swaig"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "module"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swaig"
  module: "github.com.signalwire.signalwire-go.pkg.swaig"
---
# `swaig`

Package swaig provides SWAIG (SignalWire AI Gateway) function result handling for building AI agent tool responses with actions and call control.

## Signature

```go
package swaig
```

## Functions

- [`CreatePaymentAction`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/create-payment-action) — CreatePaymentAction creates a single payment action entry.
- [`CreatePaymentParameter`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/create-payment-parameter) — CreatePaymentParameter creates a payment parameter entry.
- [`CreatePaymentPrompt`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/create-payment-prompt) — CreatePaymentPrompt creates a payment prompt configuration. cardType and errorType are optional; pass empty strings to omit them. This matches the Python SDK's create\_payment\_prompt() static method signature.
- [`NewFunctionResult`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/new-function-result) — NewFunctionResult creates a new FunctionResult with the given response text.

## Type Aliases

- [`ToolHandler`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/tool-handler) — ToolHandler is the function signature for SWAIG tool handlers. args contains the parsed function arguments, rawData contains the full request payload including global\_data, call\_id, etc.

## Classes

- [`FunctionResult`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result) — FunctionResult represents the response from a SWAIG tool handler. It contains a text response, optional actions, and post-processing control. All mutating methods return \*FunctionResult for method chaining.
- [`JoinConferenceOptions`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/join-conference-options) — JoinConferenceOptions holds optional parameters for JoinConference beyond the required name.
- [`PayOptions`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/pay-options) — PayOptions holds all optional parameters for the Pay method.
- [`RecordCallOptions`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/record-call-options) — RecordCallOptions holds optional parameters for RecordCall beyond the required fields.
