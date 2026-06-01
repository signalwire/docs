---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/project-tokens/update"
title: "Update"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.ProjectTokens.Update"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.ProjectTokens"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/project.go"
---
# `Update`

Update modifies a project API token.

## Signature

```go
func (*ProjectTokens) Update(tokenID string, data map[string]any) (map[string]any, error)
```

## Parameters

| Name      | Type             | Required | Default | Description |
| --------- | ---------------- | -------- | ------- | ----------- |
| `tokenID` | `string`         | yes      | —       | —           |
| `data`    | `map[string]any` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/project.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/project.go)

Line 21.
