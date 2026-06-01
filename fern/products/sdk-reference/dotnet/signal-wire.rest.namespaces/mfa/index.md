---
slug: "/reference/dotnet/signal-wire.rest.namespaces/mfa"
title: "Mfa"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.REST.Namespaces.Mfa"
  parent: "SignalWire.REST.Namespaces"
  module: "SignalWire.REST.Namespaces"
  visibility: "public"
---
# `Mfa`

Multi-Factor Authentication namespace (sms / call / verify dispatch).

Mirrors Python `signalwire.rest.namespaces.mfa.MfaResource`.
Extends CrudResource so the legacy `client.Mfa.BasePath` /
`client.Mfa.Create` surface keeps working.

## Signature

```dotnet
public class Mfa : CrudResource
```

## Inheritance

**Extends:** [SignalWire.REST.CrudResource](/reference/dotnet/signal-wire.rest/crud-resource)

## Methods

- [`CallAsync(Dictionary<string, object?>)`](/reference/dotnet/signal-wire.rest.namespaces/mfa/call-async-dictionary-string-object)
- [`Mfa(HttpClient)`](/reference/dotnet/signal-wire.rest.namespaces/mfa/mfa-http-client)
- [`SmsAsync(Dictionary<string, object?>)`](/reference/dotnet/signal-wire.rest.namespaces/mfa/sms-async-dictionary-string-object)
- [`VerifyAsync(string, Dictionary<string, object?>)`](/reference/dotnet/signal-wire.rest.namespaces/mfa/verify-async-string-dictionary-string-object)
