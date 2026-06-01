---
slug: "/reference/dotnet/signal-wire.agent/agent-base/handle-request-string-string-dictionary-string-string-string"
title: "HandleRequest(string, string, Dictionary<string, string>, string?)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Agent.AgentBase.HandleRequest(string, string, System.Collections.Generic.Dictionary<string, string>, string?)"
  parent: "SignalWire.Agent.AgentBase"
  module: "SignalWire.Agent"
  visibility: "public"
---
# `HandleRequest(string, string, Dictionary<string, string>, string?)`

Override the base dispatch to enforce webhook signature validation on
POST requests targeting the signed routes (<code>/</code>, <code>/swaig</code>, <code>/post\_prompt</code>) when <xref href="SignalWire.Agent.AgentBase.SigningKey" data-throw-if-not-resolved="false"></xref> is configured.

<p>Validation is gated behind Basic Auth: callers must already
satisfy the SWMLService basic-auth check (it always runs first in
<xref href="SignalWire.SWML.Service.HandleRequest(System.String%2cSystem.String%2cSystem.Collections.Generic.Dictionary%7bSystem.String%2cSystem.String%7d%2cSystem.String)" data-throw-if-not-resolved="false"></xref>) before we even look at
signatures, matching Python where <code>signing_key</code> is layered on
top of <code>basic_auth</code>.</p>

<p>On invalid signature: returns 403 directly without dispatching
to the agent's POST handler. On valid signature (or non-POST, or
non-signed route): delegates to <xref href="SignalWire.SWML.Service.HandleRequest(System.String%2cSystem.String%2cSystem.Collections.Generic.Dictionary%7bSystem.String%2cSystem.String%7d%2cSystem.String)" data-throw-if-not-resolved="false"></xref>.
</p>

<p>(Python parity: <code>web_mixin._register_routes</code> wraps the
signed POST routes in a FastAPI <code>Depends(sig_dep)</code> dependency
when <code>signing_key</code> is set; this is the .NET equivalent.)</p>

**Modifiers:** `override`

## Signature

```dotnet
public override (int Status, Dictionary<string, string> Headers, string Body) HandleRequest(string method, string path, Dictionary<string, string> headers, string? body)
```

## Parameters

| Name      | Type                        | Required | Default | Description |
| --------- | --------------------------- | -------- | ------- | ----------- |
| `method`  | `string`                    | yes      | —       | —           |
| `path`    | `string`                    | yes      | —       | —           |
| `headers` | `Dictionary<string,string>` | yes      | —       | —           |
| `body`    | `string`                    | yes      | —       | —           |

## Returns

`System.ValueTuple<int,Dictionary<string,string>,string>`
