---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/queues-namespace/list-members"
title: "ListMembers"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.QueuesNamespace.ListMembers"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.QueuesNamespace"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/queues.go"
---
# `ListMembers`

ListMembers lists members of a queue.

## Signature

```go
func (*QueuesNamespace) ListMembers(queueID string, params map[string]string) (map[string]any, error)
```

## Parameters

| Name      | Type                | Required | Default | Description |
| --------- | ------------------- | -------- | ------- | ----------- |
| `queueID` | `string`            | yes      | —       | —           |
| `params`  | `map[string]string` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/queues.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/queues.go)

Line 23.
