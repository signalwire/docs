---
slug: "/reference/php/signal-wire/skills/builtin/builtin/datasphere"
title: "Datasphere"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\Skills\\Builtin\\Datasphere"
  parent: "SignalWire\\Skills\\Builtin"
  module: "SignalWire.Skills.Builtin"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Skills/Builtin/Datasphere.php"
---
# `Datasphere`

SignalWire DataSphere knowledge-search skill.

Mirrors signalwire-python's
`signalwire.skills.datasphere.skill.DataSphereSkill._search_knowledge_handler`:

POST https://{space\_name}.signalwire.com/api/datasphere/documents/search
Auth: Basic project\_id:token
Body: { document\_id, query\_string, distance, count, \[tags, language, ...] }

The response carries `chunks: [{text, score, ...}]` (NOT `results`).
The handler stringifies the chunks the same way the Python skill does.

Upstream URL override: `DATASPHERE_BASE_URL` for the audit fixture.
The path `/api/datasphere/documents/search` is preserved.

## Signature

```php
class Datasphere extends SkillBase
```

## Inheritance

**Extends:** [SignalWire\Skills\SkillBase](/reference/php/signal-wire/skills/skills/skill-base)

## Methods

- [`__construct`](/reference/php/signal-wire/skills/builtin/builtin/datasphere/construct)
- [`cleanup`](/reference/php/signal-wire/skills/builtin/builtin/datasphere/cleanup)
- [`getDescription`](/reference/php/signal-wire/skills/builtin/builtin/datasphere/get-description)
- [`getGlobalData`](/reference/php/signal-wire/skills/builtin/builtin/datasphere/get-global-data)
- [`getHints`](/reference/php/signal-wire/skills/builtin/builtin/datasphere/get-hints)
- [`getInstanceKey`](/reference/php/signal-wire/skills/builtin/builtin/datasphere/get-instance-key)
- [`getName`](/reference/php/signal-wire/skills/builtin/builtin/datasphere/get-name)
- [`getParameterSchema`](/reference/php/signal-wire/skills/builtin/builtin/datasphere/get-parameter-schema)
- [`getPromptSections`](/reference/php/signal-wire/skills/builtin/builtin/datasphere/get-prompt-sections)
- [`getRequiredEnvVars`](/reference/php/signal-wire/skills/builtin/builtin/datasphere/get-required-env-vars)
- [`getVersion`](/reference/php/signal-wire/skills/builtin/builtin/datasphere/get-version)
- [`registerTools`](/reference/php/signal-wire/skills/builtin/builtin/datasphere/register-tools)
- [`setup`](/reference/php/signal-wire/skills/builtin/builtin/datasphere/setup)
- [`supportsMultipleInstances`](/reference/php/signal-wire/skills/builtin/builtin/datasphere/supports-multiple-instances)
- [`validateEnvVars`](/reference/php/signal-wire/skills/builtin/builtin/datasphere/validate-env-vars)

## Source

[`/src/src/SignalWire/Skills/Builtin/Datasphere.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Skills/Builtin/Datasphere.php)

Line 27.
