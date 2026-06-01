---
slug: "/reference/dotnet/signal-wire.agent/agent-base/add-language"
title: "AddLanguage"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Agent.AgentBase.AddLanguage(string, string, string)"
  parent: "SignalWire.Agent.AgentBase"
  module: "SignalWire.Agent"
  visibility: "public"
---
# `AddLanguage`

Add a language configuration with optional per-language engine-specific
params (e.g. voice stability/similarity for ElevenLabs, model knobs).
The <code>params</code> key is only emitted into SWML when non-empty, so
existing language entries stay byte-identical when no params are passed.
Mirrors signalwire-python's <code>AIConfigMixin.add\_language(params=...)</code>.

## Signature

**Overload 1**

```dotnet
public AgentBase AddLanguage(string name, string code, string voice)
```

**Overload 2**

```dotnet
public AgentBase AddLanguage(string name, string code, string voice, Dictionary<string, object?>? languageParams)
```

## Parameters (Overload 1)

| Name    | Type     | Required | Default | Description |
| ------- | -------- | -------- | ------- | ----------- |
| `name`  | `string` | yes      | —       | —           |
| `code`  | `string` | yes      | —       | —           |
| `voice` | `string` | yes      | —       | —           |

## Parameters (Overload 2)

| Name             | Type                        | Required | Default | Description                                                                                              |
| ---------------- | --------------------------- | -------- | ------- | -------------------------------------------------------------------------------------------------------- |
| `name`           | `string`                    | yes      | —       | Language name (e.g. "English").                                                                          |
| `code`           | `string`                    | yes      | —       | Language code (e.g. "en-US").                                                                            |
| `voice`          | `string`                    | yes      | —       | TTS voice name or combined "engine.voice:model".                                                         |
| `languageParams` | `Dictionary<string,object>` | yes      | —       | Optional engine-specific params dict. <code>null</code> or empty omits the SWML <code>params</code> key. |

## Returns (Overload 1)

`SignalWire.Agent.AgentBase`

## Returns (Overload 2)

`SignalWire.Agent.AgentBase`
