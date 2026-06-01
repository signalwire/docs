---
slug: "/reference/dotnet/signal-wire.swml/schema-validation-error"
title: "SchemaValidationError"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.SWML.SchemaValidationError"
  parent: "SignalWire.SWML"
  module: "SignalWire.SWML"
  visibility: "public"
---
# `SchemaValidationError`

Validation error raised by SchemaUtils.ValidateVerb when a
verb config violates its schema. (Python parity:
`signalwire.utils.schema_utils.SchemaValidationError`.)

## Signature

```dotnet
public class SchemaValidationError : Exception, ISerializable
```

## Inheritance

**Extends:** `System.Exception`

**Implements:** `System.Runtime.Serialization.ISerializable`

## Properties

| Name       | Type                                  | Required | Default | Description |
| ---------- | ------------------------------------- | -------- | ------- | ----------- |
| `Errors`   | `public List<string> Errors { get; }` | yes      | —       | —           |
| `VerbName` | `public string VerbName { get; }`     | yes      | —       | —           |

## Methods

- [`SchemaValidationError(string, List<string>)`](/reference/dotnet/signal-wire.swml/schema-validation-error/schema-validation-error-string-list-string)
