---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/new-logs-namespace"
title: "NewLogsNamespace"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.NewLogsNamespace"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/logs.go"
---
# `NewLogsNamespace`

NewLogsNamespace creates a new LogsNamespace with all sub-resources initialized.

## Signature

```go
func NewLogsNamespace(client HTTPClient) *LogsNamespace
```

## Parameters

| Name     | Type         | Required | Default | Description |
| -------- | ------------ | -------- | ------- | ----------- |
| `client` | `HTTPClient` | yes      | —       | —           |

## Returns

`*LogsNamespace`

## Source

[`pkg/rest/namespaces/logs.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/logs.go)

Line 89.
