---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/prefabs/prefabs/info-gatherer-agent/set-question-callback"
title: "SetQuestionCallback"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/prefabs.InfoGathererAgent.SetQuestionCallback"
  parent: "github.com/signalwire/signalwire-go/pkg/prefabs.InfoGathererAgent"
  module: "github.com.signalwire.signalwire-go.pkg.prefabs"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/prefabs/info_gatherer.go"
---
# `SetQuestionCallback`

SetQuestionCallback registers a per-request callback that returns the list of questions to ask. Calling this method enables dynamic mode: on each SWML request the callback is invoked with the request's query parameters, body parameters, and headers; the returned \[]Question becomes the session's question list. This mirrors Python's InfoGathererAgent.set\_question\_callback.

If Questions was set to nil in InfoGathererOptions (dynamic mode), a fallback question set is used when no callback is registered.

Example:

```
ig.SetQuestionCallback(func(query, body map[string]any, headers map[string]string) []Question {
    if body["department"] == "support" {
        return []Question{{KeyName: "issue", QuestionText: "What is the issue?"}}
    }
    return []Question{{KeyName: "name", QuestionText: "What is your name?"}}
})
```

## Signature

```go
func (*InfoGathererAgent) SetQuestionCallback(
	cb func(queryParams map[string]string, bodyParams map[string]any, headers map[string]string) []Question
)
```

## Parameters

| Name | Type                                                                                                   | Required | Default | Description |
| ---- | ------------------------------------------------------------------------------------------------------ | -------- | ------- | ----------- |
| `cb` | `func(queryParams map[string]string, bodyParams map[string]any, headers map[string]string) []Question` | yes      | —       | —           |

## Examples

**Example 1**

```go
ig.SetQuestionCallback(func(query, body map[string]any, headers map[string]string) []Question {
    if body["department"] == "support" {
        return []Question{{KeyName: "issue", QuestionText: "What is the issue?"}}
    }
    return []Question{{KeyName: "name", QuestionText: "What is your name?"}}
})
```

**Example 2**

```go
ig.SetQuestionCallback(func(query, body map[string]any, headers map[string]string) []Question {
    if body["department"] == "support" {
        return []Question{{KeyName: "issue", QuestionText: "What is the issue?"}}
    }
    return []Question{{KeyName: "name", QuestionText: "What is your name?"}}
})
```

## Source

[`pkg/prefabs/info_gatherer.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/prefabs/info_gatherer.go)

Line 135.
