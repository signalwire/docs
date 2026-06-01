---
slug: "/reference/dotnet/signal-wire.agent/agent-base/add-internal-filler"
title: "AddInternalFiller"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Agent.AgentBase.AddInternalFiller(string)"
  parent: "SignalWire.Agent.AgentBase"
  module: "SignalWire.Agent"
  visibility: "public"
---
# `AddInternalFiller`

Add internal fillers for a single internal function and language.

<p>See
<xref href="SignalWire.Agent.AgentBase.SetInternalFillers(System.Collections.Generic.Dictionary%7bSystem.String%2cSystem.Collections.Generic.Dictionary%7bSystem.String%2cSystem.Collections.Generic.List%7bSystem.String%7d%7d%7d)" data-throw-if-not-resolved="false"></xref>
for the complete list of supported function names and what fillers
do. Names outside the supported set log a warning.</p>

## Signature

**Overload 1**

```dotnet
public AgentBase AddInternalFiller(string filler)
```

**Overload 2**

```dotnet
public AgentBase AddInternalFiller(string functionName, string languageCode, List<string> fillers)
```

## Parameters (Overload 1)

| Name     | Type     | Required | Default | Description |
| -------- | -------- | -------- | ------- | ----------- |
| `filler` | `string` | yes      | —       | —           |

## Parameters (Overload 2)

| Name           | Type           | Required | Default | Description |
| -------------- | -------------- | -------- | ------- | ----------- |
| `functionName` | `string`       | yes      | —       | —           |
| `languageCode` | `string`       | yes      | —       | —           |
| `fillers`      | `List<string>` | yes      | —       | —           |

## Returns (Overload 1)

`SignalWire.Agent.AgentBase`

## Returns (Overload 2)

`SignalWire.Agent.AgentBase`
