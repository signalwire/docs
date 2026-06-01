---
slug: "/reference/dotnet/signal-wire.agent/agent-options"
title: "AgentOptions"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Agent.AgentOptions"
  parent: "SignalWire.Agent"
  module: "SignalWire.Agent"
  visibility: "public"
---
# `AgentOptions`

Configuration options for an AI agent, extending the base SWML service options.

**Modifiers:** `sealed`

## Signature

```dotnet
public sealed class AgentOptions
```

## Properties

| Name                     | Type                                                | Required | Default | Description                                                                                                                                                                                                                                                                                                                                                                                                              |
| ------------------------ | --------------------------------------------------- | -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `AutoAnswer`             | `public bool AutoAnswer { get; init; }`             | yes      | —       | —                                                                                                                                                                                                                                                                                                                                                                                                                        |
| `BasicAuthPassword`      | `public string? BasicAuthPassword { get; init; }`   | yes      | —       | —                                                                                                                                                                                                                                                                                                                                                                                                                        |
| `BasicAuthUser`          | `public string? BasicAuthUser { get; init; }`       | yes      | —       | —                                                                                                                                                                                                                                                                                                                                                                                                                        |
| `Host`                   | `public string Host { get; init; }`                 | yes      | —       | —                                                                                                                                                                                                                                                                                                                                                                                                                        |
| `Name`                   | `public required string Name { get; init; }`        | yes      | —       | —                                                                                                                                                                                                                                                                                                                                                                                                                        |
| `Port`                   | `public int? Port { get; init; }`                   | yes      | —       | —                                                                                                                                                                                                                                                                                                                                                                                                                        |
| `RecordCall`             | `public bool RecordCall { get; init; }`             | yes      | —       | —                                                                                                                                                                                                                                                                                                                                                                                                                        |
| `RecordFormat`           | `public string RecordFormat { get; init; }`         | yes      | —       | —                                                                                                                                                                                                                                                                                                                                                                                                                        |
| `RecordStereo`           | `public bool RecordStereo { get; init; }`           | yes      | —       | —                                                                                                                                                                                                                                                                                                                                                                                                                        |
| `Route`                  | `public string Route { get; init; }`                | yes      | —       | —                                                                                                                                                                                                                                                                                                                                                                                                                        |
| `SigningKey`             | `public string? SigningKey { get; init; }`          | yes      | —       | Optional SignalWire Signing Key (from Dashboard → API Credentials). When set, webhook signature validation is enforced on POST /, /swaig, /post\_prompt — unsigned or invalidly-signed requests get a 403. Falls back to the <code>SIGNALWIRE\_SIGNING\_KEY</code> env var if not passed. See <code>porting-sdk/webhooks.md</code> for the contract. (Python parity: <code>AgentBase.**init**(signing\_key=...)</code>.) |
| `TrustProxyForSignature` | `public bool TrustProxyForSignature { get; init; }` | yes      | —       | If true, honor <code>X-Forwarded-Proto</code> / <code>X-Forwarded-Host</code> headers when reconstructing the URL for signature validation. Default false because proxy headers are spoofable; opt in only when you control the proxy chain. (Python parity: <code>AgentBase.**init**(trust\_proxy\_for\_signature=...)</code>.)                                                                                         |
| `UsePom`                 | `public bool UsePom { get; init; }`                 | yes      | —       | —                                                                                                                                                                                                                                                                                                                                                                                                                        |
