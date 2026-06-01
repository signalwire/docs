---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/phone-numbers-namespace/set-ai-agent"
title: "SetAiAgent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.PhoneNumbersNamespace.SetAiAgent"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.PhoneNumbersNamespace"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/phone_numbers.go"
---
# `SetAiAgent`

SetAiAgent routes inbound calls to an AI Agent Fabric resource by ID.

## Signature

```go
func (*PhoneNumbersNamespace) SetAiAgent(sid string, agentID string, extra ...map[string]any) (map[string]any, error)
```

## Parameters

| Name       | Type             | Required | Default | Description |
| ---------- | ---------------- | -------- | ------- | ----------- |
| `sid`      | `string`         | yes      | —       | —           |
| `agentID`  | `string`         | yes      | —       | —           |
| `...extra` | `map[string]any` | no       | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/phone_numbers.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/phone_numbers.go)

Line 115.
