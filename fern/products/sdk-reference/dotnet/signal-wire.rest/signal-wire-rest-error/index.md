---
slug: "/reference/dotnet/signal-wire.rest/signal-wire-rest-error"
title: "SignalWireRestError"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.REST.SignalWireRestError"
  parent: "SignalWire.REST"
  module: "SignalWire.REST"
  visibility: "public"
---
# `SignalWireRestError`

Exception thrown when a SignalWire REST API call returns a non-2xx status
or encounters a transport-level error.

**Modifiers:** `sealed`

## Signature

```dotnet
public sealed class SignalWireRestError : Exception, ISerializable
```

## Inheritance

**Extends:** `System.Exception`

**Implements:** `System.Runtime.Serialization.ISerializable`

## Properties

| Name           | Type                                  | Required | Default | Description                                                  |
| -------------- | ------------------------------------- | -------- | ------- | ------------------------------------------------------------ |
| `ResponseBody` | `public string ResponseBody { get; }` | yes      | —       | Raw response body from the server.                           |
| `StatusCode`   | `public int StatusCode { get; }`      | yes      | —       | HTTP status code from the response (0 for transport errors). |

## Methods

- [`SignalWireRestError`](/reference/dotnet/signal-wire.rest/signal-wire-rest-error/signal-wire-rest-error)
- [`ToString()`](/reference/dotnet/signal-wire.rest/signal-wire-rest-error/to-string) — Creates and returns a string representation of the current exception.
