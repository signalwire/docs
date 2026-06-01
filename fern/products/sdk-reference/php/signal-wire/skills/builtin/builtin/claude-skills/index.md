---
slug: "/reference/php/signal-wire/skills/builtin/builtin/claude-skills"
title: "ClaudeSkills"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\Skills\\Builtin\\ClaudeSkills"
  parent: "SignalWire\\Skills\\Builtin"
  module: "SignalWire.Skills.Builtin"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Skills/Builtin/ClaudeSkills.php"
---
# `ClaudeSkills`

Claude Skills loader.

Mirrors signalwire-python's
`signalwire.skills.claude_skills.skill.ClaudeSkillsSkill`:

- Walks `skills_path` for `<dir>/SKILL.md` files.
- Parses YAML frontmatter (name, description, argument-hint,
  disable-model-invocation, user-invocable).
- Discovers companion `*.md` files inside each skill dir as
  selectable sections.
- Registers one SWAIG tool per loadable skill with a `(arguments,
  section)` parameter pair, where `section` enums over the
  discovered companion docs.
- When invoked, returns the SKILL.md body (or the requested
  section), with `$ARGUMENTS`, `$ARGUMENTS[N]`, `$N`,
  `${CLAUDE_SKILL_DIR}` and `${CLAUDE_SESSION_ID}` substituted.

Two deliberate omissions vs Python (each documented in
PORT\_OMISSIONS.md):

- `allow_shell_injection`: Python preprocesses `!`cmd\`\` patterns
  by shelling out. PHP prefers not to ship a hot path that
  subprocess() any user-controlled string by default — Python
  itself defaults this off too. The flag is accepted but the
  processor is a no-op (the pattern is left in place); set
  `allow_shell_injection=false` (the default) and the behavior
  matches Python.
- YAML frontmatter parser: PHP has no first-class YAML in
  core. Implemented a small tolerant subset that handles the
  forms Claude Code itself emits (string scalars, bool, list of
  strings on continuation lines). Skill files using deeply
  nested YAML constructs aren't supported and will hit a
  graceful "frontmatter parse failed" warning at load.

## Signature

```php
class ClaudeSkills extends SkillBase
```

## Inheritance

**Extends:** [SignalWire\Skills\SkillBase](/reference/php/signal-wire/skills/skills/skill-base)

## Methods

- [`__construct`](/reference/php/signal-wire/skills/builtin/builtin/claude-skills/construct)
- [`cleanup`](/reference/php/signal-wire/skills/builtin/builtin/claude-skills/cleanup)
- [`getDescription`](/reference/php/signal-wire/skills/builtin/builtin/claude-skills/get-description)
- [`getGlobalData`](/reference/php/signal-wire/skills/builtin/builtin/claude-skills/get-global-data)
- [`getHints`](/reference/php/signal-wire/skills/builtin/builtin/claude-skills/get-hints)
- [`getInstanceKey`](/reference/php/signal-wire/skills/builtin/builtin/claude-skills/get-instance-key)
- [`getName`](/reference/php/signal-wire/skills/builtin/builtin/claude-skills/get-name)
- [`getParameterSchema`](/reference/php/signal-wire/skills/builtin/builtin/claude-skills/get-parameter-schema)
- [`getPromptSections`](/reference/php/signal-wire/skills/builtin/builtin/claude-skills/get-prompt-sections)
- [`getRequiredEnvVars`](/reference/php/signal-wire/skills/builtin/builtin/claude-skills/get-required-env-vars)
- [`getVersion`](/reference/php/signal-wire/skills/builtin/builtin/claude-skills/get-version)
- [`registerTools`](/reference/php/signal-wire/skills/builtin/builtin/claude-skills/register-tools)
- [`setup`](/reference/php/signal-wire/skills/builtin/builtin/claude-skills/setup)
- [`supportsMultipleInstances`](/reference/php/signal-wire/skills/builtin/builtin/claude-skills/supports-multiple-instances)
- [`validateEnvVars`](/reference/php/signal-wire/skills/builtin/builtin/claude-skills/validate-env-vars)

## Source

[`/src/src/SignalWire/Skills/Builtin/ClaudeSkills.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Skills/Builtin/ClaudeSkills.php)

Line 45.
