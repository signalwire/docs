---
slug: "/reference/php/signal-wire/skills/builtin/builtin/wikipedia-search"
title: "WikipediaSearch"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\Skills\\Builtin\\WikipediaSearch"
  parent: "SignalWire\\Skills\\Builtin"
  module: "SignalWire.Skills.Builtin"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Skills/Builtin/WikipediaSearch.php"
---
# `WikipediaSearch`

Wikipedia search skill backed by the public MediaWiki action API.

Mirrors signalwire-python's
`signalwire.skills.wikipedia_search.skill.WikipediaSearchSkill.search_wiki`:

1. GET en.wikipedia.org/w/api.php?action=query\&list=search\&srsearch=...
2. For each top result, GET ?action=query\&prop=extracts\&exintro&...
   to fetch the article intro extract.

Upstream URL override: `WIKIPEDIA_BASE_URL` for the audit fixture.
The path component (`/w/api.php`) is preserved.

## Signature

```php
class WikipediaSearch extends SkillBase
```

## Inheritance

**Extends:** [SignalWire\Skills\SkillBase](/reference/php/signal-wire/skills/skills/skill-base)

## Methods

- [`__construct`](/reference/php/signal-wire/skills/builtin/builtin/wikipedia-search/construct)
- [`cleanup`](/reference/php/signal-wire/skills/builtin/builtin/wikipedia-search/cleanup)
- [`getDescription`](/reference/php/signal-wire/skills/builtin/builtin/wikipedia-search/get-description)
- [`getGlobalData`](/reference/php/signal-wire/skills/builtin/builtin/wikipedia-search/get-global-data)
- [`getHints`](/reference/php/signal-wire/skills/builtin/builtin/wikipedia-search/get-hints)
- [`getInstanceKey`](/reference/php/signal-wire/skills/builtin/builtin/wikipedia-search/get-instance-key)
- [`getName`](/reference/php/signal-wire/skills/builtin/builtin/wikipedia-search/get-name)
- [`getParameterSchema`](/reference/php/signal-wire/skills/builtin/builtin/wikipedia-search/get-parameter-schema)
- [`getPromptSections`](/reference/php/signal-wire/skills/builtin/builtin/wikipedia-search/get-prompt-sections)
- [`getRequiredEnvVars`](/reference/php/signal-wire/skills/builtin/builtin/wikipedia-search/get-required-env-vars)
- [`getVersion`](/reference/php/signal-wire/skills/builtin/builtin/wikipedia-search/get-version)
- [`registerTools`](/reference/php/signal-wire/skills/builtin/builtin/wikipedia-search/register-tools)
- [`setup`](/reference/php/signal-wire/skills/builtin/builtin/wikipedia-search/setup)
- [`supportsMultipleInstances`](/reference/php/signal-wire/skills/builtin/builtin/wikipedia-search/supports-multiple-instances)
- [`validateEnvVars`](/reference/php/signal-wire/skills/builtin/builtin/wikipedia-search/validate-env-vars)

## Source

[`/src/src/SignalWire/Skills/Builtin/WikipediaSearch.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Skills/Builtin/WikipediaSearch.php)

Line 24.
