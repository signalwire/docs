---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/queues-namespace"
title: "QueuesNamespace"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.QueuesNamespace"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/queues.go"
---
# `QueuesNamespace`

QueuesNamespace provides queue management with member operations.

## Signature

```go
type QueuesNamespace struct
```

## Properties

| Name           | Type            | Required | Default | Description |
| -------------- | --------------- | -------- | ------- | ----------- |
| `CrudResource` | `*CrudResource` | yes      | —       | —           |

## Methods

- [`GetMember`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/queues-namespace/get-member) — GetMember retrieves a specific member from a queue.
- [`GetNextMember`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/queues-namespace/get-next-member) — GetNextMember retrieves the next member in the queue.
- [`ListMembers`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/queues-namespace/list-members) — ListMembers lists members of a queue.

## Source

[`pkg/rest/namespaces/queues.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/queues.go)

Line 11.
