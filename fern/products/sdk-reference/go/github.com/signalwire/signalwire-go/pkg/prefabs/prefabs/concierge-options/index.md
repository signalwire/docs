---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/concierge-options"
title: "ConciergeOptions"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/prefabs.ConciergeOptions"
  parent: "github.com/signalwire/signalwire-go/pkg/prefabs"
  module: "github.com.signalwire.signalwire-go.pkg.prefabs"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/prefabs/concierge.go"
---
# `ConciergeOptions`

ConciergeOptions configures a new ConciergeAgent.

## Signature

```go
type ConciergeOptions struct
```

## Properties

| Name                  | Type                           | Required | Default | Description                                                   |
| --------------------- | ------------------------------ | -------- | ------- | ------------------------------------------------------------- |
| `Amenities`           | `Amenities map[string]Amenity` | yes      | —       | —                                                             |
| `Hours`               | `Hours string`                 | yes      | —       | general hours of operation                                    |
| `Name`                | `Name string`                  | yes      | —       | —                                                             |
| `Route`               | `Route string`                 | yes      | —       | —                                                             |
| `Services`            | `Services []string`            | yes      | —       | —                                                             |
| `SpecialInstructions` | `SpecialInstructions []string` | yes      | —       | optional additional instructions appended to the default list |
| `VenueName`           | `VenueName string`             | yes      | —       | —                                                             |
| `WelcomeMessage`      | `WelcomeMessage string`        | yes      | —       | optional static greeting spoken at the start of the call      |

## Source

[`pkg/prefabs/concierge.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/prefabs/concierge.go)

Line 23.
