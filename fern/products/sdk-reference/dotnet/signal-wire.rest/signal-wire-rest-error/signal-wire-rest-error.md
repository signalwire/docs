---
slug: "/reference/dotnet/signal-wire.rest/signal-wire-rest-error/signal-wire-rest-error"
title: "SignalWireRestError"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.REST.SignalWireRestError.SignalWireRestError(string, int, string)"
  parent: "SignalWire.REST.SignalWireRestError"
  module: "SignalWire.REST"
  visibility: "public"
---
# `SignalWireRestError`

## Signature

**Overload 1**

```dotnet
public SignalWireRestError(string message, int statusCode, string responseBody)
```

**Overload 2**

```dotnet
public SignalWireRestError(string message, int statusCode, string responseBody, Exception innerException)
```

## Parameters (Overload 1)

| Name           | Type     | Required | Default | Description |
| -------------- | -------- | -------- | ------- | ----------- |
| `message`      | `string` | yes      | —       | —           |
| `statusCode`   | `int`    | yes      | —       | —           |
| `responseBody` | `string` | yes      | —       | —           |

## Parameters (Overload 2)

| Name             | Type               | Required | Default | Description |
| ---------------- | ------------------ | -------- | ------- | ----------- |
| `message`        | `string`           | yes      | —       | —           |
| `statusCode`     | `int`              | yes      | —       | —           |
| `responseBody`   | `string`           | yes      | —       | —           |
| `innerException` | `System.Exception` | yes      | —       | —           |
