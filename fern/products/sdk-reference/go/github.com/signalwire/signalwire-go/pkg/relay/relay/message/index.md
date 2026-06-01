---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/message"
title: "Message"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.Message"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/message.go"
---
# `Message`

Message represents an SMS/MMS message tracked through its lifecycle.

## Signature

```go
type Message struct
```

## Methods

- [`Body`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/message/body) — Body returns the text body of the message.
- [`Context`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/message/context) — Context returns the RELAY context on which this message was received.
- [`Direction`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/message/direction) — Direction returns "inbound" or "outbound".
- [`FromNumber`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/message/from-number) — FromNumber returns the sender number.
- [`IsDone`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/message/is-done) — IsDone returns true if the message has reached a terminal state.
- [`Media`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/message/media) — Media returns the list of media URLs attached to the message.
- [`MessageID`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/message/message-id) — MessageID returns the unique message identifier.
- [`On`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/message/on) — On registers an event handler called when message state changes.
- [`Reason`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/message/reason) — Reason returns the failure reason if the message failed.
- [`Result`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/message/result) — Result returns the terminal RelayEvent if the message has reached a terminal state, or nil if not yet done. This is the non-blocking equivalent of Python's Message.result property.
- [`Segments`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/message/segments) — Segments returns the number of SMS segments.
- [`State`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/message/state) — State returns the current message state.
- [`Tags`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/message/tags) — Tags returns the tags associated with the message.
- [`ToNumber`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/message/to-number) — ToNumber returns the recipient number.
- [`Wait`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/message/wait) — Wait blocks until the message reaches a terminal state or the context is cancelled. Returns the final event or the context error.

## Source

[`pkg/relay/message.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/message.go)

Line 9.
