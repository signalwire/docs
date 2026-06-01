---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/join-conference"
title: "JoinConference"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.Call.JoinConference"
  parent: "github.com/signalwire/signalwire-go/pkg/relay.Call"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go"
---
# `JoinConference`

JoinConference joins the call to a named conference.

## Signature

```go
func (*Call) JoinConference(name string, opts ...ConferenceOption) error
```

## Parameters

| Name      | Type               | Required | Default | Description |
| --------- | ------------------ | -------- | ------- | ----------- |
| `name`    | `string`           | yes      | —       | —           |
| `...opts` | `ConferenceOption` | no       | —       | —           |

## Returns

`error`

## Source

[`pkg/relay/call.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go)

Line 869.
