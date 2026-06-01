---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/ai-stop"
title: "AIStop"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CallingNamespace.AIStop"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CallingNamespace"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/calling.go"
---
# `AIStop`

AIStop stops the AI session.

## Signature

```go
func (*CallingNamespace) AIStop(callID string, params map[string]any) (map[string]any, error)
```

## Parameters

| Name     | Type             | Required | Default | Description |
| -------- | ---------------- | -------- | ------- | ----------- |
| `callID` | `string`         | yes      | —       | —           |
| `params` | `map[string]any` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/calling.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/calling.go)

Line 206.
