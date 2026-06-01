---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/document"
title: "Document"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swml.Document"
  parent: "github.com/signalwire/signalwire-go/pkg/swml"
  module: "github.com.signalwire.signalwire-go.pkg.swml"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/document.go"
---
# `Document`

Document represents a complete SWML document with version and sections.

## Signature

```go
type Document struct
```

## Properties

| Name       | Type                         | Required | Default | Description |
| ---------- | ---------------------------- | -------- | ------- | ----------- |
| `Sections` | `Sections map[string][]Verb` | yes      | —       | —           |
| `Version`  | `Version string`             | yes      | —       | —           |

## Methods

- [`AddSection`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/document/add-section) — AddSection creates a new named section in the document. Returns false if the section already exists.
- [`AddVerb`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/document/add-verb) — AddVerb appends a verb to the "main" section. Returns an error if the verb name is empty.
- [`AddVerbToSection`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/document/add-verb-to-section) — AddVerbToSection appends a verb to a named section. Creates the section if it doesn't exist.
- [`GetVerbs`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/document/get-verbs) — GetVerbs returns the verbs in a named section. Returns nil if the section doesn't exist.
- [`HasSection`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/document/has-section) — HasSection returns whether a section exists in the document.
- [`MarshalJSON`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/document/marshal-json) — MarshalJSON implements the json.Marshaler interface.
- [`Render`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/document/render) — Render serializes the document to a JSON string.
- [`RenderPretty`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/document/render-pretty) — RenderPretty serializes the document to an indented JSON string.
- [`Reset`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/document/reset) — Reset clears all sections and recreates the default "main" section.
- [`ToMap`](/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/document/to-map) — ToMap returns the document as a nested map suitable for JSON serialization.

## Source

[`pkg/swml/document.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/document.go)

Line 15.
