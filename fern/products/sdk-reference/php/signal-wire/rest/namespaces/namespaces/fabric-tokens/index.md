---
slug: "/reference/php/signal-wire/rest/namespaces/namespaces/fabric-tokens"
title: "FabricTokens"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\REST\\Namespaces\\FabricTokens"
  parent: "SignalWire\\REST\\Namespaces"
  module: "SignalWire.REST.Namespaces"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/REST/Namespaces/FabricTokens.php"
---
# `FabricTokens`

Subscriber, guest, invite, and embed token creation under

`/api/fabric/...`.

Note: token endpoints sit under different sub-paths inside the Fabric
mount point (`subscribers/tokens`, `subscriber/invites`, `guests`,
`embeds`) — singular vs plural is API-specific so each helper has the
exact path the API expects.

## Signature

```php
class FabricTokens
```

## Methods

- [`__construct`](/reference/php/signal-wire/rest/namespaces/namespaces/fabric-tokens/construct)
- [`createEmbedToken`](/reference/php/signal-wire/rest/namespaces/namespaces/fabric-tokens/create-embed-token)
- [`createGuestToken`](/reference/php/signal-wire/rest/namespaces/namespaces/fabric-tokens/create-guest-token)
- [`createInviteToken`](/reference/php/signal-wire/rest/namespaces/namespaces/fabric-tokens/create-invite-token) — Note the singular `subscriber` here — the invite endpoint uses
- [`createSubscriberToken`](/reference/php/signal-wire/rest/namespaces/namespaces/fabric-tokens/create-subscriber-token)
- [`getBasePath`](/reference/php/signal-wire/rest/namespaces/namespaces/fabric-tokens/get-base-path)
- [`refreshSubscriberToken`](/reference/php/signal-wire/rest/namespaces/namespaces/fabric-tokens/refresh-subscriber-token)

## Source

[`/src/src/SignalWire/REST/Namespaces/FabricTokens.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/REST/Namespaces/FabricTokens.php)

Line 18.
