---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/queue-event"
title: "QueueEvent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.QueueEvent"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go"
---
# `QueueEvent`

QueueEvent represents a calling.call.queue event.

## Signature

```go
type QueueEvent struct
```

## Properties

| Name         | Type               | Required | Default | Description                                                                                                                         |
| ------------ | ------------------ | -------- | ------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| `ControlID`  | `ControlID string` | yes      | —       | —                                                                                                                                   |
| `Position`   | `Position int`     | yes      | —       | —                                                                                                                                   |
| `QueueID`    | `QueueID string`   | yes      | —       | QueueID reads wire key "id" matching Python's queue\_id = p.get("id", "").                                                          |
| `QueueName`  | `QueueName string` | yes      | —       | QueueName reads wire key "name" matching Python's queue\_name = p.get("name", ""). (Previously read "queue\_name" which was wrong.) |
| `RelayEvent` | `*RelayEvent`      | yes      | —       | —                                                                                                                                   |
| `Size`       | `Size int`         | yes      | —       | —                                                                                                                                   |
| `Status`     | `Status string`    | yes      | —       | Status reads wire key "status" matching Python's status field. (Replaces the previous State field which incorrectly read "state".)  |

## Source

[`pkg/relay/event.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go)

Line 556.
