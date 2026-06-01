---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/receptionist-options"
title: "ReceptionistOptions"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/prefabs.ReceptionistOptions"
  parent: "github.com/signalwire/signalwire-go/pkg/prefabs"
  module: "github.com.signalwire.signalwire-go.pkg.prefabs"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/prefabs/receptionist.go"
---
# `ReceptionistOptions`

ReceptionistOptions configures a new ReceptionistAgent.

## Signature

```go
type ReceptionistOptions struct
```

## Properties

| Name          | Type                       | Required | Default | Description                              |
| ------------- | -------------------------- | -------- | ------- | ---------------------------------------- |
| `Departments` | `Departments []Department` | yes      | —       | —                                        |
| `Greeting`    | `Greeting string`          | yes      | —       | —                                        |
| `Name`        | `Name string`              | yes      | —       | —                                        |
| `Route`       | `Route string`             | yes      | —       | —                                        |
| `Voice`       | `Voice string`             | yes      | —       | Voice ID for TTS (default: "rime.spore") |

## Source

[`pkg/prefabs/receptionist.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/prefabs/receptionist.go)

Line 23.
