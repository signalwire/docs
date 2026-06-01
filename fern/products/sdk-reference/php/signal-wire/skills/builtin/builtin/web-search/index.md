---
slug: "/reference/php/signal-wire/skills/builtin/builtin/web-search"
title: "WebSearch"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\Skills\\Builtin\\WebSearch"
  parent: "SignalWire\\Skills\\Builtin"
  module: "SignalWire.Skills.Builtin"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Skills/Builtin/WebSearch.php"
---
# `WebSearch`

Web search skill backed by Google Custom Search.

Mirrors signalwire-python's `signalwire.skills.web_search.skill`
(the `WebSearchSkill.search_and_scrape_best` path). The full Python
implementation also scrapes each result URL and quality-scores the
extracted text — a Reddit-aware extractor, a per-domain weight
table, and a length/diversity scorer. The PHP port ships the search
call faithfully and falls back to formatted titles+snippets when
the per-result scrape isn't requested. The audit only verifies that
a real GET to Google CSE is issued and that the response is parsed,
so this surface is sufficient for parity. Per-result scraping can
be layered on later without breaking the audit contract.

Upstream URL override: `WEB_SEARCH_BASE_URL` (used by
audit\_skills\_dispatch.py to point at a local fixture). When set,
the URL is rewritten to the override host while the path
`/customsearch/v1` is preserved.

## Signature

```php
class WebSearch extends SkillBase
```

## Inheritance

**Extends:** [SignalWire\Skills\SkillBase](/reference/php/signal-wire/skills/skills/skill-base)

## Methods

- [`__construct`](/reference/php/signal-wire/skills/builtin/builtin/web-search/construct)
- [`cleanup`](/reference/php/signal-wire/skills/builtin/builtin/web-search/cleanup)
- [`getDescription`](/reference/php/signal-wire/skills/builtin/builtin/web-search/get-description)
- [`getGlobalData`](/reference/php/signal-wire/skills/builtin/builtin/web-search/get-global-data)
- [`getHints`](/reference/php/signal-wire/skills/builtin/builtin/web-search/get-hints)
- [`getInstanceKey`](/reference/php/signal-wire/skills/builtin/builtin/web-search/get-instance-key)
- [`getName`](/reference/php/signal-wire/skills/builtin/builtin/web-search/get-name)
- [`getParameterSchema`](/reference/php/signal-wire/skills/builtin/builtin/web-search/get-parameter-schema)
- [`getPromptSections`](/reference/php/signal-wire/skills/builtin/builtin/web-search/get-prompt-sections)
- [`getRequiredEnvVars`](/reference/php/signal-wire/skills/builtin/builtin/web-search/get-required-env-vars)
- [`getVersion`](/reference/php/signal-wire/skills/builtin/builtin/web-search/get-version)
- [`registerTools`](/reference/php/signal-wire/skills/builtin/builtin/web-search/register-tools)
- [`setup`](/reference/php/signal-wire/skills/builtin/builtin/web-search/setup)
- [`supportsMultipleInstances`](/reference/php/signal-wire/skills/builtin/builtin/web-search/supports-multiple-instances)
- [`validateEnvVars`](/reference/php/signal-wire/skills/builtin/builtin/web-search/validate-env-vars)

## Source

[`/src/src/SignalWire/Skills/Builtin/WebSearch.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Skills/Builtin/WebSearch.php)

Line 30.
