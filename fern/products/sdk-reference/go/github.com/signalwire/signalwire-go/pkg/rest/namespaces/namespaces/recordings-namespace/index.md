---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/recordings-namespace"
title: "RecordingsNamespace"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.RecordingsNamespace"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/recordings.go"
---
# `RecordingsNamespace`

RecordingsNamespace provides recording management (read-only + delete).

## Signature

```go
type RecordingsNamespace struct
```

## Properties

| Name       | Type       | Required | Default | Description |
| ---------- | ---------- | -------- | ------- | ----------- |
| `Resource` | `Resource` | yes      | —       | —           |

## Methods

- [`Delete`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/recordings-namespace/delete) — Delete removes a recording by ID.
- [`Get`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/recordings-namespace/get) — Get retrieves a recording by ID.
- [`List`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/recordings-namespace/list) — List lists all recordings. params may contain values of any type (matching Python's \*\*data); non-string values are stringified via fmt.Sprintf before being sent as query parameters.

## Source

[`pkg/rest/namespaces/recordings.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/recordings.go)

Line 13.
