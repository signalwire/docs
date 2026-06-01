---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/new-info-gatherer-agent"
title: "NewInfoGathererAgent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/prefabs.NewInfoGathererAgent"
  parent: "github.com/signalwire/signalwire-go/pkg/prefabs"
  module: "github.com.signalwire.signalwire-go.pkg.prefabs"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/prefabs/info_gatherer.go"
---
# `NewInfoGathererAgent`

NewInfoGathererAgent creates an agent that asks a series of questions and stores the answers in global data. Pass nil Questions to enable dynamic mode; call SetQuestionCallback on the returned agent to supply per-request questions.

## Signature

```go
func NewInfoGathererAgent(opts InfoGathererOptions) *InfoGathererAgent
```

## Parameters

| Name   | Type                  | Required | Default | Description |
| ------ | --------------------- | -------- | ------- | ----------- |
| `opts` | `InfoGathererOptions` | yes      | —       | —           |

## Returns

`*InfoGathererAgent`

## Source

[`pkg/prefabs/info_gatherer.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/prefabs/info_gatherer.go)

Line 49.
