---
slug: "/reference/dotnet/signal-wire.skills.builtin/datasphere-skill"
title: "DatasphereSkill"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Skills.Builtin.DatasphereSkill"
  parent: "SignalWire.Skills.Builtin"
  module: "SignalWire.Skills.Builtin"
  visibility: "public"
---
# `DatasphereSkill`

SignalWire DataSphere knowledge-base search skill.

Mirrors signalwire-python's <code>signalwire.skills.datasphere.skill</code>.
POSTs a JSON body to <code>https://\<space\_name>.signalwire.com
/api/datasphere/documents/search</code> with HTTP Basic auth
(project\_id : token). Real DataSphere returns matches under <code>chunks</code>; the porting-sdk audit fixture uses <code>results</code>;
accept either so the skill round-trips against the live API and the
offline audit alike (matching the precedent already in Java/PHP/Perl/
Rust).

Upstream URL override: <code>DATASPHERE\_BASE\_URL</code>. Path <code>/api/datasphere/documents/search</code> is preserved.

**Modifiers:** `sealed`

## Signature

```dotnet
public sealed class DatasphereSkill : SkillBase
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

- [`GetGlobalData()`](/reference/dotnet/signal-wire.skills.builtin/datasphere-skill/get-global-data)
- [`GetPromptSections()`](/reference/dotnet/signal-wire.skills.builtin/datasphere-skill/get-prompt-sections)
- [`RegisterTools(AgentBase)`](/reference/dotnet/signal-wire.skills.builtin/datasphere-skill/register-tools-agent-base)
- [`Setup(AgentBase, Dictionary<string, object>)`](/reference/dotnet/signal-wire.skills.builtin/datasphere-skill/setup-agent-base-dictionary-string-object)
