---
slug: "/reference/dotnet/signal-wire.skills.builtin/native-vector-search-skill"
title: "NativeVectorSearchSkill"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Skills.Builtin.NativeVectorSearchSkill"
  parent: "SignalWire.Skills.Builtin"
  module: "SignalWire.Skills.Builtin"
  visibility: "public"
---
# `NativeVectorSearchSkill`

Vector / keyword similarity search.

Mirrors signalwire-python's <code>signalwire.skills.native\_vector\_search.skill</code>
in <strong>remote mode only</strong>. Local-mode SQLite/pgvector
indexing relies on Python-only deps (sentence-transformers, FAISS,
pgvector) and is not portable to the .NET BCL — recorded in <code>PORT\_OMISSIONS.md</code>. The remote mode POSTs the query to the
configured search server, which returns a real-shape response the
audit verifies on the wire.

The handler reads <code>remote\_url</code> from skill params; the audit
fixture sets it to a loopback URL so the SDK exercises the real
transport against canned bytes.

**Modifiers:** `sealed`

## Signature

```dotnet
public sealed class NativeVectorSearchSkill : SkillBase
```

## Inheritance

**Extends:** [SignalWire.Skills.SkillBase](/reference/dotnet/signal-wire.skills/skill-base)

## Properties

| Name                        | Type                                                      | Required | Default | Description |
| --------------------------- | --------------------------------------------------------- | -------- | ------- | ----------- |
| `Description`               | `public override string Description { get; }`             | yes      | —       | —           |
| `Name`                      | `public override string Name { get; }`                    | yes      | —       | —           |
| `SupportsMultipleInstances` | `public override bool SupportsMultipleInstances { get; }` | yes      | —       | —           |

## Methods

- [`GetHints()`](/reference/dotnet/signal-wire.skills.builtin/native-vector-search-skill/get-hints)
- [`RegisterTools(AgentBase)`](/reference/dotnet/signal-wire.skills.builtin/native-vector-search-skill/register-tools-agent-base)
- [`Setup(AgentBase, Dictionary<string, object>)`](/reference/dotnet/signal-wire.skills.builtin/native-vector-search-skill/setup-agent-base-dictionary-string-object)
