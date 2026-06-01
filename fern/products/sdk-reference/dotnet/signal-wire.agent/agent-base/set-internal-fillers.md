---
slug: "/reference/dotnet/signal-wire.agent/agent-base/set-internal-fillers"
title: "SetInternalFillers"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Agent.AgentBase.SetInternalFillers(System.Collections.Generic.List<string>)"
  parent: "SignalWire.Agent.AgentBase"
  module: "SignalWire.Agent"
  visibility: "public"
---
# `SetInternalFillers`

Set internal fillers for native SWAIG functions.

<p>Internal fillers are short phrases the AI agent speaks (via
TTS) while an internal/native function is running, so the caller
doesn't hear dead air during transitions or background work.</p>

<p>Supported function names (match the SWAIGInternalFiller
schema): <code>hangup</code>, <code>check_time</code>, <code>wait_for_user</code>,
<code>wait_seconds</code>, <code>adjust_response_latency</code>,
<code>next_step</code>, <code>change_context</code>, <code>get_visual_input</code>,
<code>get_ideal_strategy</code>. See
<xref href="SignalWire.Agent.AgentBase.SupportedInternalFillerNames" data-throw-if-not-resolved="false"></xref>.</p>

<p>Notably NOT supported: <code>change_step</code>,
<code>gather_submit</code>, or arbitrary user-defined SWAIG function
names. The runtime only honors fillers for the names listed above;
everything else is silently ignored at the SWML level. This method
warns at registration time if you pass an unknown name so you
catch the typo early.</p>

## Signature

**Overload 1**

```dotnet
public AgentBase SetInternalFillers(List<string> fillers)
```

**Overload 2**

```dotnet
public AgentBase SetInternalFillers(Dictionary<string, Dictionary<string, List<string>>> fillers)
```

## Parameters (Overload 1)

| Name      | Type           | Required | Default | Description |
| --------- | -------------- | -------- | ------- | ----------- |
| `fillers` | `List<string>` | yes      | —       | —           |

## Parameters (Overload 2)

| Name      | Type                                                 | Required | Default | Description |
| --------- | ---------------------------------------------------- | -------- | ------- | ----------- |
| `fillers` | `Dictionary<string,Dictionary<string,List<string>>>` | yes      | —       | —           |

## Returns (Overload 1)

`SignalWire.Agent.AgentBase`

## Returns (Overload 2)

`SignalWire.Agent.AgentBase`
