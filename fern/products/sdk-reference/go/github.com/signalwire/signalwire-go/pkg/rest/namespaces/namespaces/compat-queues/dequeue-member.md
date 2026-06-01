---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-queues/dequeue-member"
title: "DequeueMember"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CompatQueues.DequeueMember"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CompatQueues"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/compat.go"
---
# `DequeueMember`

DequeueMember dequeues a member from a queue.

## Signature

```go
func (*CompatQueues) DequeueMember(queueSID string, callSID string, data map[string]any) (map[string]any, error)
```

## Parameters

| Name       | Type             | Required | Default | Description |
| ---------- | ---------------- | -------- | ------- | ----------- |
| `queueSID` | `string`         | yes      | —       | —           |
| `callSID`  | `string`         | yes      | —       | —           |
| `data`     | `map[string]any` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/compat.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/compat.go)

Line 305.
