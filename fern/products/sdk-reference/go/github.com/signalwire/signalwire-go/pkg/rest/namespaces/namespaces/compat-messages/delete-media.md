---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-messages/delete-media"
title: "DeleteMedia"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CompatMessages.DeleteMedia"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CompatMessages"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/compat.go"
---
# `DeleteMedia`

DeleteMedia deletes a media item from a message.

## Signature

```go
func (*CompatMessages) DeleteMedia(messageSID string, mediaSID string) (map[string]any, error)
```

## Parameters

| Name         | Type     | Required | Default | Description |
| ------------ | -------- | -------- | ------- | ----------- |
| `messageSID` | `string` | yes      | —       | —           |
| `mediaSID`   | `string` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/compat.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/compat.go)

Line 94.
