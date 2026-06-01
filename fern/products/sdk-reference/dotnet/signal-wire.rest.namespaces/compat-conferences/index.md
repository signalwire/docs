---
slug: "/reference/dotnet/signal-wire.rest.namespaces/compat-conferences"
title: "CompatConferences"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.REST.Namespaces.CompatConferences"
  parent: "SignalWire.REST.Namespaces"
  module: "SignalWire.REST.Namespaces"
  visibility: "public"
---
# `CompatConferences`

Compat conferences with participant, recording, and stream sub-resources.

## Signature

```dotnet
public class CompatConferences
```

## Properties

| Name       | Type                              | Required | Default | Description |
| ---------- | --------------------------------- | -------- | ------- | ----------- |
| `BasePath` | `public string BasePath { get; }` | yes      | —       | —           |

## Methods

- [`CompatConferences(HttpClient, string)`](/reference/dotnet/signal-wire.rest.namespaces/compat-conferences/compat-conferences-http-client-string)
- [`DeleteRecordingAsync(string, string)`](/reference/dotnet/signal-wire.rest.namespaces/compat-conferences/delete-recording-async-string-string)
- [`GetAsync(string)`](/reference/dotnet/signal-wire.rest.namespaces/compat-conferences/get-async-string)
- [`GetParticipantAsync(string, string)`](/reference/dotnet/signal-wire.rest.namespaces/compat-conferences/get-participant-async-string-string)
- [`GetRecordingAsync(string, string)`](/reference/dotnet/signal-wire.rest.namespaces/compat-conferences/get-recording-async-string-string)
- [`ListAsync(Dictionary<string, string>?)`](/reference/dotnet/signal-wire.rest.namespaces/compat-conferences/list-async-dictionary-string-string)
- [`ListParticipantsAsync(string, Dictionary<string, string>?)`](/reference/dotnet/signal-wire.rest.namespaces/compat-conferences/list-participants-async-string-dictionary-string-string)
- [`ListRecordingsAsync(string, Dictionary<string, string>?)`](/reference/dotnet/signal-wire.rest.namespaces/compat-conferences/list-recordings-async-string-dictionary-string-string)
- [`RemoveParticipantAsync(string, string)`](/reference/dotnet/signal-wire.rest.namespaces/compat-conferences/remove-participant-async-string-string)
- [`StartStreamAsync(string, Dictionary<string, object?>)`](/reference/dotnet/signal-wire.rest.namespaces/compat-conferences/start-stream-async-string-dictionary-string-object)
- [`StopStreamAsync(string, string, Dictionary<string, object?>)`](/reference/dotnet/signal-wire.rest.namespaces/compat-conferences/stop-stream-async-string-string-dictionary-string-object)
- [`UpdateAsync(string, Dictionary<string, object?>)`](/reference/dotnet/signal-wire.rest.namespaces/compat-conferences/update-async-string-dictionary-string-object)
- [`UpdateParticipantAsync(string, string, Dictionary<string, object?>)`](/reference/dotnet/signal-wire.rest.namespaces/compat-conferences/update-participant-async-string-string-dictionary-string-object)
- [`UpdateRecordingAsync(string, string, Dictionary<string, object?>)`](/reference/dotnet/signal-wire.rest.namespaces/compat-conferences/update-recording-async-string-string-dictionary-string-object)
