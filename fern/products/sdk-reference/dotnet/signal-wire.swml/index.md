---
slug: "/reference/dotnet/signal-wire.swml"
title: "SignalWire.SWML"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "module"
  language: "dotnet"
  qualified_name: "SignalWire.SWML"
---
# `SignalWire.SWML`

## Classes

- [`Document`](/reference/dotnet/signal-wire.swml/document) — Represents a SWML document containing versioned sections of verb instructions. Each section holds an ordered list of verb dictionaries that define call-flow logic.
- [`Schema`](/reference/dotnet/signal-wire.swml/schema) — Thread-safe singleton that loads the SWML JSON schema from an embedded resource and exposes verb definitions parsed from $defs.SWMLMethod.anyOf.
- [`SchemaValidationError`](/reference/dotnet/signal-wire.swml/schema-validation-error) — Validation error raised by SchemaUtils.ValidateVerb when a verb config violates its schema. (Python parity: `signalwire.utils.schema_utils.SchemaValidationError`.)
- [`Service`](/reference/dotnet/signal-wire.swml/service) — A SWML service that manages a Document, provides schema-driven verb methods, handles HTTP requests with Basic authentication, and supports routing callbacks.
- [`ServiceOptions`](/reference/dotnet/signal-wire.swml/service-options) — Configuration options for a SWML service.
- [`SWMLBuilder`](/reference/dotnet/signal-wire.swml/swml-builder)
- [`SwmlRenderer`](/reference/dotnet/signal-wire.swml/swml-renderer)
- [`VerbInfo`](/reference/dotnet/signal-wire.swml/verb-info) — Metadata about a single SWML verb parsed from the schema.
