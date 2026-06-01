---
slug: "/reference/dotnet/signal-wire.rest.namespaces/compat"
title: "Compat"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.REST.Namespaces.Compat"
  parent: "SignalWire.REST.Namespaces"
  module: "SignalWire.REST.Namespaces"
  visibility: "public"
---
# `Compat`

Twilio-compatible (LaML) API namespace with AccountSid scoping.

Mirrors Python `signalwire.rest.namespaces.compat.CompatNamespace`:
the entry-point exposes 12 sub-resources (accounts, calls, messages,
faxes, conferences, phone\_numbers, applications, laml\_bins, queues,
recordings, transcriptions, tokens) under a shared per-account prefix.

<p>Inherits from <xref href="SignalWire.REST.CrudResource" data-throw-if-not-resolved="false"></xref> so the historical
``client.Compat.List()`` / ``Create`` / ``Get`` / ``Update`` / ``Delete``
surface continues to work; the per-account collection accessors are
added on top.</p>

## Signature

```dotnet
public class Compat : CrudResource
```

## Inheritance

**Extends:** [SignalWire.REST.CrudResource](/reference/dotnet/signal-wire.rest/crud-resource)

## Properties

| Name             | Type                                                  | Required | Default | Description |
| ---------------- | ----------------------------------------------------- | -------- | ------- | ----------- |
| `Accounts`       | `public CompatAccounts Accounts { get; }`             | yes      | —       | —           |
| `AccountSid`     | `public string AccountSid { get; }`                   | yes      | —       | —           |
| `Applications`   | `public CompatApplications Applications { get; }`     | yes      | —       | —           |
| `Calls`          | `public CompatCalls Calls { get; }`                   | yes      | —       | —           |
| `Conferences`    | `public CompatConferences Conferences { get; }`       | yes      | —       | —           |
| `Faxes`          | `public CompatFaxes Faxes { get; }`                   | yes      | —       | —           |
| `LamlBins`       | `public CompatLamlBins LamlBins { get; }`             | yes      | —       | —           |
| `Messages`       | `public CompatMessages Messages { get; }`             | yes      | —       | —           |
| `PhoneNumbers`   | `public CompatPhoneNumbers PhoneNumbers { get; }`     | yes      | —       | —           |
| `Queues`         | `public CompatQueues Queues { get; }`                 | yes      | —       | —           |
| `Recordings`     | `public CompatRecordings Recordings { get; }`         | yes      | —       | —           |
| `Tokens`         | `public CompatTokens Tokens { get; }`                 | yes      | —       | —           |
| `Transcriptions` | `public CompatTranscriptions Transcriptions { get; }` | yes      | —       | —           |

## Methods

- [`Compat(HttpClient, string)`](/reference/dotnet/signal-wire.rest.namespaces/compat/compat-http-client-string)
