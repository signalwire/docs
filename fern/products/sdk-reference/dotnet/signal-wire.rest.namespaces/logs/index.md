---
slug: "/reference/dotnet/signal-wire.rest.namespaces/logs"
title: "Logs"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.REST.Namespaces.Logs"
  parent: "SignalWire.REST.Namespaces"
  module: "SignalWire.REST.Namespaces"
  visibility: "public"
---
# `Logs`

Logs API namespace — message, voice, fax, and conference logs (read-only).

Mirrors Python `signalwire.rest.namespaces.logs.LogsNamespace`.
Each kind of log lives at a different sub-API path.

<p>Inherits from <xref href="SignalWire.REST.CrudResource" data-throw-if-not-resolved="false"></xref> so the legacy
``client.Logs.BasePath`` accessor still resolves; the new
Messages/Voice/Fax/Conferences accessors point at the actual per-API
log endpoints.</p>

## Signature

```dotnet
public class Logs : CrudResource
```

## Inheritance

**Extends:** [SignalWire.REST.CrudResource](/reference/dotnet/signal-wire.rest/crud-resource)

## Properties

| Name          | Type                                         | Required | Default | Description |
| ------------- | -------------------------------------------- | -------- | ------- | ----------- |
| `Conferences` | `public ConferenceLogs Conferences { get; }` | yes      | —       | —           |
| `Fax`         | `public FaxLogs Fax { get; }`                | yes      | —       | —           |
| `Messages`    | `public MessageLogs Messages { get; }`       | yes      | —       | —           |
| `Voice`       | `public VoiceLogs Voice { get; }`            | yes      | —       | —           |

## Methods

- [`Logs(HttpClient)`](/reference/dotnet/signal-wire.rest.namespaces/logs/logs-http-client)
