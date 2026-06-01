---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-conferences/remove-participant"
title: "RemoveParticipant"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CompatConferences.RemoveParticipant"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CompatConferences"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/compat.go"
---
# `RemoveParticipant`

RemoveParticipant removes a participant from a conference.

## Signature

```go
func (*CompatConferences) RemoveParticipant(conferenceSID string, callSID string) (map[string]any, error)
```

## Parameters

| Name            | Type     | Required | Default | Description |
| --------------- | -------- | -------- | ------- | ----------- |
| `conferenceSID` | `string` | yes      | —       | —           |
| `callSID`       | `string` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/compat.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/compat.go)

Line 166.
