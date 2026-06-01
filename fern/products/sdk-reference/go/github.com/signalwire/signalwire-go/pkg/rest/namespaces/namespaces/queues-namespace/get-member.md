---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/queues-namespace/get-member"
title: "GetMember"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.QueuesNamespace.GetMember"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.QueuesNamespace"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/queues.go"
---
# `GetMember`

GetMember retrieves a specific member from a queue.

## Signature

```go
func (*QueuesNamespace) GetMember(queueID string, memberID string) (map[string]any, error)
```

## Parameters

| Name       | Type     | Required | Default | Description |
| ---------- | -------- | -------- | ------- | ----------- |
| `queueID`  | `string` | yes      | —       | —           |
| `memberID` | `string` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/queues.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/queues.go)

Line 33.
