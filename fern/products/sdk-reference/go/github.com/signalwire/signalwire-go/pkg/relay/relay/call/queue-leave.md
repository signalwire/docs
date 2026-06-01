---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/queue-leave"
title: "QueueLeave"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.Call.QueueLeave"
  parent: "github.com/signalwire/signalwire-go/pkg/relay.Call"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go"
---
# `QueueLeave`

QueueLeave removes the call from the named queue. queueID and statusURL are optional (empty string omits each), matching Python's queue\_leave(queue\_name, \*, control\_id, queue\_id, status\_url) at signalwire/relay/call.py:1287. A per-request control\_id is generated.

## Signature

```go
func (*Call) QueueLeave(name string, queueID string, statusURL string) error
```

## Parameters

| Name        | Type     | Required | Default | Description |
| ----------- | -------- | -------- | ------- | ----------- |
| `name`      | `string` | yes      | —       | —           |
| `queueID`   | `string` | yes      | —       | —           |
| `statusURL` | `string` | yes      | —       | —           |

## Returns

`error`

## Source

[`pkg/relay/call.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go)

Line 1096.
