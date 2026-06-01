---
slug: "/reference/dotnet/signal-wire.rest.namespaces/sip-profile"
title: "SipProfile"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.REST.Namespaces.SipProfile"
  parent: "SignalWire.REST.Namespaces"
  module: "SignalWire.REST.Namespaces"
  visibility: "public"
---
# `SipProfile`

Project SIP profile (singleton resource — get/update only, update via PUT).

Mirrors Python `signalwire.rest.namespaces.sip_profile.SipProfileResource`.
Extends CrudResource for the legacy `client.SipProfile.BasePath` test
— the Python-parity singleton path is /api/relay/rest/sip\_profile;
the legacy .NET path was /api/relay/rest/sip\_profiles. The legacy
accessor target is preserved while `GetAsync()/UpdateAsync(kwargs)`
hit the singleton path.

## Signature

```dotnet
public class SipProfile : CrudResource
```

## Inheritance

**Extends:** [SignalWire.REST.CrudResource](/reference/dotnet/signal-wire.rest/crud-resource)

## Properties

| Name            | Type                                                                | Required | Default | Description                              |
| --------------- | ------------------------------------------------------------------- | -------- | ------- | ---------------------------------------- |
| `SingletonPath` | `public const string SingletonPath = "/api/relay/rest/sip_profile"` | yes      | —       | Singleton resource path (Python parity). |

## Methods

- [`GetAsync()`](/reference/dotnet/signal-wire.rest.namespaces/sip-profile/get-async)
- [`SipProfile(HttpClient)`](/reference/dotnet/signal-wire.rest.namespaces/sip-profile/sip-profile-http-client)
- [`UpdateAsync(Dictionary<string, object?>)`](/reference/dotnet/signal-wire.rest.namespaces/sip-profile/update-async-dictionary-string-object)
