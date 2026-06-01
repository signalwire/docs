---
slug: "/reference/dotnet/signal-wire.rest.namespaces/compat-calls"
title: "CompatCalls"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.REST.Namespaces.CompatCalls"
  parent: "SignalWire.REST.Namespaces"
  module: "SignalWire.REST.Namespaces"
  visibility: "public"
---
# `CompatCalls`

Compat calls with recording + stream sub-resources.
Inherits standard CRUD; adds Twilio-style compat extensions.

## Signature

```dotnet
public class CompatCalls : CrudResource
```

## Inheritance

**Extends:** [SignalWire.REST.CrudResource](/reference/dotnet/signal-wire.rest/crud-resource)

## Methods

- [`CompatCalls(HttpClient, string)`](/reference/dotnet/signal-wire.rest.namespaces/compat-calls/compat-calls-http-client-string)
- [`StartRecordingAsync(string, Dictionary<string, object?>)`](/reference/dotnet/signal-wire.rest.namespaces/compat-calls/start-recording-async-string-dictionary-string-object)
- [`StartStreamAsync(string, Dictionary<string, object?>)`](/reference/dotnet/signal-wire.rest.namespaces/compat-calls/start-stream-async-string-dictionary-string-object)
- [`StopStreamAsync(string, string, Dictionary<string, object?>)`](/reference/dotnet/signal-wire.rest.namespaces/compat-calls/stop-stream-async-string-string-dictionary-string-object)
- [`UpdateAsync(string, Dictionary<string, object?>)`](/reference/dotnet/signal-wire.rest.namespaces/compat-calls/update-async-string-dictionary-string-object) — UPDATE uses POST (Twilio compat) — overrides the generic CrudResource PUT.
- [`UpdateRecordingAsync(string, string, Dictionary<string, object?>)`](/reference/dotnet/signal-wire.rest.namespaces/compat-calls/update-recording-async-string-string-dictionary-string-object)
