---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/resource"
title: "Resource"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.Resource"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/common.go"
---
# `Resource`

Resource is a helper for building sub-paths from a base path.

## Signature

```go
type Resource struct
```

## Properties

| Name   | Type              | Required | Default | Description |
| ------ | ----------------- | -------- | ------- | ----------- |
| `Base` | `Base string`     | yes      | —       | —           |
| `HTTP` | `HTTP HTTPClient` | yes      | —       | —           |

## Methods

- [`Path`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/resource/path) — Path joins additional segments onto the base path.

## Source

[`pkg/rest/namespaces/common.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/common.go)

Line 26.
