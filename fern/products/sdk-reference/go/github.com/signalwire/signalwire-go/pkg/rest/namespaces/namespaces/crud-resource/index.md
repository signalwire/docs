---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/crud-resource"
title: "CrudResource"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CrudResource"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/common.go"
---
# `CrudResource`

CrudResource provides standard List, Create, Get, Update, Delete operations against a REST collection endpoint within a namespace.

## Signature

```go
type CrudResource struct
```

## Properties

| Name           | Type                  | Required | Default | Description                |
| -------------- | --------------------- | -------- | ------- | -------------------------- |
| `Resource`     | `Resource`            | yes      | —       | —                          |
| `UpdateMethod` | `UpdateMethod string` | yes      | —       | "PATCH" (default) or "PUT" |

## Methods

- [`Create`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/crud-resource/create) — Create sends a POST request to create a new resource.
- [`Delete`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/crud-resource/delete) — Delete removes a resource by ID. It returns the parsed response body (or an empty map for 204 No Content) and any error.
- [`Get`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/crud-resource/get) — Get retrieves a single resource by ID.
- [`List`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/crud-resource/list) — List retrieves all items from the collection.
- [`Update`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/crud-resource/update) — Update modifies an existing resource by ID.

## Source

[`pkg/rest/namespaces/common.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/common.go)

Line 41.
