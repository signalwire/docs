---
slug: "/reference/dotnet/signal-wire.rest.namespaces/video-conferences"
title: "VideoConferences"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.REST.Namespaces.VideoConferences"
  parent: "SignalWire.REST.Namespaces"
  module: "SignalWire.REST.Namespaces"
  visibility: "public"
---
# `VideoConferences`

Video conferences (CRUD with PUT update + tokens/streams subresources).

## Signature

```dotnet
public class VideoConferences : CrudResource
```

## Inheritance

**Extends:** [SignalWire.REST.CrudResource](/reference/dotnet/signal-wire.rest/crud-resource)

## Methods

- [`CreateStreamAsync(string, Dictionary<string, object?>)`](/reference/dotnet/signal-wire.rest.namespaces/video-conferences/create-stream-async-string-dictionary-string-object)
- [`ListConferenceTokensAsync(string, Dictionary<string, string>?)`](/reference/dotnet/signal-wire.rest.namespaces/video-conferences/list-conference-tokens-async-string-dictionary-string-string)
- [`ListStreamsAsync(string, Dictionary<string, string>?)`](/reference/dotnet/signal-wire.rest.namespaces/video-conferences/list-streams-async-string-dictionary-string-string)
- [`UpdateAsync(string, Dictionary<string, object?>)`](/reference/dotnet/signal-wire.rest.namespaces/video-conferences/update-async-string-dictionary-string-object) — Update a resource by ID (PUT basePath/{id}).
- [`VideoConferences(HttpClient, string)`](/reference/dotnet/signal-wire.rest.namespaces/video-conferences/video-conferences-http-client-string)
