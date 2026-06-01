---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/info-gatherer-options"
title: "InfoGathererOptions"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/prefabs.InfoGathererOptions"
  parent: "github.com/signalwire/signalwire-go/pkg/prefabs"
  module: "github.com.signalwire.signalwire-go.pkg.prefabs"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/prefabs/info_gatherer.go"
---
# `InfoGathererOptions`

InfoGathererOptions configures a new InfoGathererAgent. Set Questions to nil to enable dynamic callback mode via SetQuestionCallback.

## Signature

```go
type InfoGathererOptions struct
```

## Properties

| Name        | Type                    | Required | Default | Description                                               |
| ----------- | ----------------------- | -------- | ------- | --------------------------------------------------------- |
| `Name`      | `Name string`           | yes      | —       | —                                                         |
| `Questions` | `Questions *[]Question` | yes      | —       | nil enables dynamic callback mode; non-nil is static mode |
| `Route`     | `Route string`          | yes      | —       | —                                                         |

## Source

[`pkg/prefabs/info_gatherer.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/prefabs/info_gatherer.go)

Line 27.
