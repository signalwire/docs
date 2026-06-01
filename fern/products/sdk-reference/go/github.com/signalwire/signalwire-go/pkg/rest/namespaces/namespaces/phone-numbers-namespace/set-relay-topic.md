---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/phone-numbers-namespace/set-relay-topic"
title: "SetRelayTopic"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.PhoneNumbersNamespace.SetRelayTopic"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.PhoneNumbersNamespace"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/phone_numbers.go"
---
# `SetRelayTopic`

SetRelayTopic routes inbound calls to a RELAY topic (client subscription). Pass nil opts for the minimal form.

## Signature

```go
func (*PhoneNumbersNamespace) SetRelayTopic(sid string, topic string, opts *RelayTopicOptions) (map[string]any, error)
```

## Parameters

| Name    | Type                 | Required | Default | Description |
| ------- | -------------------- | -------- | ------- | ----------- |
| `sid`   | `string`             | yes      | —       | —           |
| `topic` | `string`             | yes      | —       | —           |
| `opts`  | `*RelayTopicOptions` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/phone_numbers.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/phone_numbers.go)

Line 171.
