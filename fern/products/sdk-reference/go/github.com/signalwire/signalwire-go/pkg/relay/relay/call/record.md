---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/record"
title: "Record"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.Call.Record"
  parent: "github.com/signalwire/signalwire-go/pkg/relay.Call"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go"
---
# `Record`

Record starts recording the call and returns a RecordAction.

Use WithRecordAudio to supply the audio config map (Python's record(audio=...)) and WithRecordControlID to fix the control\_id. Other RecordOption helpers set top-level fields directly (e.g. WithRecordBeep, WithRecordFormat); these are folded into the "record": {"audio": {...}} object on transmit so the wire shape matches Python: {"record": {"audio": {...}}}.

## Signature

```go
func (*Call) Record(opts ...RecordOption) *RecordAction
```

## Parameters

| Name      | Type           | Required | Default | Description |
| --------- | -------------- | -------- | ------- | ----------- |
| `...opts` | `RecordOption` | no       | —       | —           |

## Returns

`*RecordAction`

## Source

[`pkg/relay/call.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go)

Line 557.
