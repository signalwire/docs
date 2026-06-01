---
slug: "/reference/dotnet/signal-wire.skills.builtin/claude-skills-skill"
title: "ClaudeSkillsSkill"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Skills.Builtin.ClaudeSkillsSkill"
  parent: "SignalWire.Skills.Builtin"
  module: "SignalWire.Skills.Builtin"
  visibility: "public"
---
# `ClaudeSkillsSkill`

Load Claude SKILL.md files as agent tools.

Mirrors signalwire-python's <code>signalwire.skills.claude\_skills.skill</code>.
At setup time, the skill walks <code>skills\_path</code> for child directories
containing <code>SKILL.md</code>; each such file is parsed for YAML
frontmatter (the bit between two <code>---</code> lines) plus a markdown
body. Each loaded skill becomes one SWAIG tool whose handler returns
the body with three substitutions:

<ul><li><code>$ARGUMENTS</code> / <code>$ARGUMENTS[N]</code> / <code>$N</code> — the
    <code>arguments</code> string passed to the tool, optionally split into
    positional pieces by whitespace.</li><li><code>${CLAUDE_SKILL_DIR}</code> — absolute path to the skill's
    directory.</li><li><code>${CLAUDE_SESSION_ID}</code> — call id from raw_data.</li></ul>

The full Python implementation also runs a frontmatter-driven invocation
gate (skip-tool / skip-prompt), tolerates supporting reference sections,
and offers an opt-in shell-injection preprocessor (<code>!`cmd`</code>). The
.NET port ships the discovery/parse/handler core; the optional shell
preprocessor is left out by design (set <code>allow\_shell\_injection</code>
to a no-op — the surface is preserved for future expansion).

**Modifiers:** `sealed`

## Signature

```dotnet
public sealed class ClaudeSkillsSkill : SkillBase
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

- [`GetHints()`](/reference/dotnet/signal-wire.skills.builtin/claude-skills-skill/get-hints)
- [`GetInstanceKey()`](/reference/dotnet/signal-wire.skills.builtin/claude-skills-skill/get-instance-key)
- [`GetPromptSections()`](/reference/dotnet/signal-wire.skills.builtin/claude-skills-skill/get-prompt-sections)
- [`RegisterTools(AgentBase)`](/reference/dotnet/signal-wire.skills.builtin/claude-skills-skill/register-tools-agent-base)
- [`Setup(AgentBase, Dictionary<string, object>)`](/reference/dotnet/signal-wire.skills.builtin/claude-skills-skill/setup-agent-base-dictionary-string-object)
