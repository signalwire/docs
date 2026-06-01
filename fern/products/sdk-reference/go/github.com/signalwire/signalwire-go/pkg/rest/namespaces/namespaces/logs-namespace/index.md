---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/logs-namespace"
title: "LogsNamespace"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.LogsNamespace"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/logs.go"
---
# `LogsNamespace`

LogsNamespace groups all log query resources.

## Signature

```go
type LogsNamespace struct
```

## Properties

| Name          | Type                          | Required | Default | Description |
| ------------- | ----------------------------- | -------- | ------- | ----------- |
| `Conferences` | `Conferences *ConferenceLogs` | yes      | —       | —           |
| `Fax`         | `Fax *FaxLogs`                | yes      | —       | —           |
| `Messages`    | `Messages *MessageLogs`       | yes      | —       | —           |
| `Voice`       | `Voice *VoiceLogs`            | yes      | —       | —           |

## Source

[`pkg/rest/namespaces/logs.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/logs.go)

Line 81.
