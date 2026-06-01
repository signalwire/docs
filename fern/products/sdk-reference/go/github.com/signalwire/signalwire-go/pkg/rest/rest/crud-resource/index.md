---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/crud-resource"
title: "CrudResource"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest.CrudResource"
  parent: "github.com/signalwire/signalwire-go/pkg/rest"
  module: "github.com.signalwire.signalwire-go.pkg.rest"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/client.go"
---
# `CrudResource`

CrudResource provides standard List, Create, Get, Update, Delete operations against a REST collection endpoint. Update defaults to PATCH; set UpdateMethod to "PUT" to override.

## Signature

```go
type CrudResource struct
```

## Properties

| Name           | Type                  | Required | Default | Description                |
| -------------- | --------------------- | -------- | ------- | -------------------------- |
| `Client`       | `Client *HttpClient`  | yes      | —       | —                          |
| `Path`         | `Path string`         | yes      | —       | —                          |
| `UpdateMethod` | `UpdateMethod string` | yes      | —       | "PATCH" (default) or "PUT" |

## Methods

- [`Create`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/crud-resource/create) — Create sends a POST request to create a new resource.
- [`Delete`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/crud-resource/delete) — Delete removes a resource by ID. It returns the parsed response body (or an empty map for 204 No Content) and any error.
- [`Get`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/crud-resource/get) — Get retrieves a single resource by ID.
- [`List`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/crud-resource/list) — List retrieves all items from the collection. Optional query parameters can be provided. The raw JSON response map is returned.
- [`Update`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/crud-resource/update) — Update modifies an existing resource by ID using the configured update method (PATCH or PUT).

## Source

[`pkg/rest/client.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/client.go)

Line 205.
