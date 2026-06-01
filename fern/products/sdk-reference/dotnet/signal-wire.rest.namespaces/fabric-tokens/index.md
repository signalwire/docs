---
slug: "/reference/dotnet/signal-wire.rest.namespaces/fabric-tokens"
title: "FabricTokens"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.REST.Namespaces.FabricTokens"
  parent: "SignalWire.REST.Namespaces"
  module: "SignalWire.REST.Namespaces"
  visibility: "public"
---
# `FabricTokens`

Fabric tokens — subscriber/guest/invite/embed token creation.

All endpoints sit under /api/fabric (NOT /api/fabric/resources or
/api/fabric/tokens). Mirrors Python's
`signalwire.rest.namespaces.fabric.FabricTokens`.

## Signature

```dotnet
public class FabricTokens
```

## Methods

- [`CreateEmbedTokenAsync(Dictionary<string, object?>)`](/reference/dotnet/signal-wire.rest.namespaces/fabric-tokens/create-embed-token-async-dictionary-string-object)
- [`CreateGuestTokenAsync(Dictionary<string, object?>)`](/reference/dotnet/signal-wire.rest.namespaces/fabric-tokens/create-guest-token-async-dictionary-string-object)
- [`CreateInviteTokenAsync(Dictionary<string, object?>)`](/reference/dotnet/signal-wire.rest.namespaces/fabric-tokens/create-invite-token-async-dictionary-string-object)
- [`CreateSubscriberTokenAsync(Dictionary<string, object?>)`](/reference/dotnet/signal-wire.rest.namespaces/fabric-tokens/create-subscriber-token-async-dictionary-string-object)
- [`FabricTokens(HttpClient)`](/reference/dotnet/signal-wire.rest.namespaces/fabric-tokens/fabric-tokens-http-client)
- [`RefreshSubscriberTokenAsync(Dictionary<string, object?>)`](/reference/dotnet/signal-wire.rest.namespaces/fabric-tokens/refresh-subscriber-token-async-dictionary-string-object)
