---
slug: "/reference/dotnet/signal-wire.swml/document"
title: "Document"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.SWML.Document"
  parent: "SignalWire.SWML"
  module: "SignalWire.SWML"
  visibility: "public"
---
# `Document`

Represents a SWML document containing versioned sections of verb instructions.
Each section holds an ordered list of verb dictionaries that define call-flow logic.

## Signature

```dotnet
public class Document
```

## Properties

| Name      | Type                             | Required | Default | Description            |
| --------- | -------------------------------- | -------- | ------- | ---------------------- |
| `Version` | `public string Version { get; }` | yes      | —       | SWML document version. |

## Methods

- [`AddRawVerb(string, Dictionary<string, object?>)`](/reference/dotnet/signal-wire.swml/document/add-raw-verb-string-dictionary-string-object) — Append a pre-formatted verb hash to a section.
- [`AddSection(string)`](/reference/dotnet/signal-wire.swml/document/add-section-string) — Add a new named section. Returns true if created, false if it already existed.
- [`AddVerb(string, object?)`](/reference/dotnet/signal-wire.swml/document/add-verb-string-object) — Append a verb to the main section.
- [`AddVerbToSection(string, string, object?)`](/reference/dotnet/signal-wire.swml/document/add-verb-to-section-string-string-object) — Append a verb to a named section.
- [`ClearSection(string)`](/reference/dotnet/signal-wire.swml/document/clear-section-string) — Clear all verbs in a section (keeps the section itself).
- [`Document()`](/reference/dotnet/signal-wire.swml/document/document)
- [`GetVerbs(string)`](/reference/dotnet/signal-wire.swml/document/get-verbs-string) — Get a copy of the verbs for a section. Returns an empty list if the section does not exist.
- [`HasSection(string)`](/reference/dotnet/signal-wire.swml/document/has-section-string) — Check whether a named section exists.
- [`Render()`](/reference/dotnet/signal-wire.swml/document/render) — Compact JSON string.
- [`RenderPretty()`](/reference/dotnet/signal-wire.swml/document/render-pretty) — Pretty-printed JSON string.
- [`Reset()`](/reference/dotnet/signal-wire.swml/document/reset) — Reset document to initial state with an empty main section.
- [`ToDict()`](/reference/dotnet/signal-wire.swml/document/to-dict) — Return document as a dictionary suitable for serialization.
