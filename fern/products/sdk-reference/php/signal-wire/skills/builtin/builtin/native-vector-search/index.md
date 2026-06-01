---
slug: "/reference/php/signal-wire/skills/builtin/builtin/native-vector-search"
title: "NativeVectorSearch"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\Skills\\Builtin\\NativeVectorSearch"
  parent: "SignalWire\\Skills\\Builtin"
  module: "SignalWire.Skills.Builtin"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Skills/Builtin/NativeVectorSearch.php"
---
# `NativeVectorSearch`

Native vector search skill — network/remote mode only.

Mirrors signalwire-python's
`signalwire.skills.native_vector_search.skill.NativeVectorSearchSkill`,
specifically the `_search_remote` branch:

POST {remote\_url}/search
Auth: Optional Basic (parsed from remote\_url's user:pass@ if set)
Body: { query, index\_name, count, similarity\_threshold, tags }
Response: { results: \[{ content, score, metadata }] }

The Python skill also supports a local SQLite/pgvector backend via
`signalwire.search`. PHP doesn't ship that backend; in remote mode
the SDK is just a thin HTTP client, which the audit verifies. Local
backend is recorded in PORT\_OMISSIONS.md.

## Signature

```php
class NativeVectorSearch extends SkillBase
```

## Inheritance

**Extends:** [SignalWire\Skills\SkillBase](/reference/php/signal-wire/skills/skills/skill-base)

## Methods

- [`__construct`](/reference/php/signal-wire/skills/builtin/builtin/native-vector-search/construct)
- [`cleanup`](/reference/php/signal-wire/skills/builtin/builtin/native-vector-search/cleanup)
- [`getDescription`](/reference/php/signal-wire/skills/builtin/builtin/native-vector-search/get-description)
- [`getGlobalData`](/reference/php/signal-wire/skills/builtin/builtin/native-vector-search/get-global-data)
- [`getHints`](/reference/php/signal-wire/skills/builtin/builtin/native-vector-search/get-hints)
- [`getInstanceKey`](/reference/php/signal-wire/skills/builtin/builtin/native-vector-search/get-instance-key)
- [`getName`](/reference/php/signal-wire/skills/builtin/builtin/native-vector-search/get-name)
- [`getParameterSchema`](/reference/php/signal-wire/skills/builtin/builtin/native-vector-search/get-parameter-schema)
- [`getPromptSections`](/reference/php/signal-wire/skills/builtin/builtin/native-vector-search/get-prompt-sections)
- [`getRequiredEnvVars`](/reference/php/signal-wire/skills/builtin/builtin/native-vector-search/get-required-env-vars)
- [`getVersion`](/reference/php/signal-wire/skills/builtin/builtin/native-vector-search/get-version)
- [`registerTools`](/reference/php/signal-wire/skills/builtin/builtin/native-vector-search/register-tools)
- [`setup`](/reference/php/signal-wire/skills/builtin/builtin/native-vector-search/setup)
- [`supportsMultipleInstances`](/reference/php/signal-wire/skills/builtin/builtin/native-vector-search/supports-multiple-instances)
- [`validateEnvVars`](/reference/php/signal-wire/skills/builtin/builtin/native-vector-search/validate-env-vars)

## Source

[`/src/src/SignalWire/Skills/Builtin/NativeVectorSearch.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Skills/Builtin/NativeVectorSearch.php)

Line 28.
