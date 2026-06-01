---
slug: "/reference/php/signal-wire/skills/builtin/builtin/spider"
title: "Spider"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\Skills\\Builtin\\Spider"
  parent: "SignalWire\\Skills\\Builtin"
  module: "SignalWire.Skills.Builtin"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Skills/Builtin/Spider.php"
---
# `Spider`

Spider scraping skill.

Mirrors signalwire-python's `signalwire.skills.spider.skill` (the
`_scrape_url_handler` / `_crawl_site_handler` paths). PHP doesn't
ship `lxml`, so HTML extraction uses a strip\_tags + regex pipeline
that handles the audit's canned `<html><body>...</body></html>`
sentinel and basic real-world pages — the Python version's quality
scorer and Reddit-aware extractor are not yet ported, but the
upstream contract (real GET, real text extraction) is met.

Upstream URL override: `SPIDER_BASE_URL` for the audit fixture.
The audit fixture is a generic JSON server, so the response body
may either be a raw HTML string (production) or a JSON object with
an `_raw_html` field (audit fixture). We accept both.

## Signature

```php
class Spider extends SkillBase
```

## Inheritance

**Extends:** [SignalWire\Skills\SkillBase](/reference/php/signal-wire/skills/skills/skill-base)

## Methods

- [`__construct`](/reference/php/signal-wire/skills/builtin/builtin/spider/construct)
- [`cleanup`](/reference/php/signal-wire/skills/builtin/builtin/spider/cleanup)
- [`getDescription`](/reference/php/signal-wire/skills/builtin/builtin/spider/get-description)
- [`getGlobalData`](/reference/php/signal-wire/skills/builtin/builtin/spider/get-global-data)
- [`getHints`](/reference/php/signal-wire/skills/builtin/builtin/spider/get-hints)
- [`getInstanceKey`](/reference/php/signal-wire/skills/builtin/builtin/spider/get-instance-key)
- [`getName`](/reference/php/signal-wire/skills/builtin/builtin/spider/get-name)
- [`getParameterSchema`](/reference/php/signal-wire/skills/builtin/builtin/spider/get-parameter-schema)
- [`getPromptSections`](/reference/php/signal-wire/skills/builtin/builtin/spider/get-prompt-sections)
- [`getRequiredEnvVars`](/reference/php/signal-wire/skills/builtin/builtin/spider/get-required-env-vars)
- [`getVersion`](/reference/php/signal-wire/skills/builtin/builtin/spider/get-version)
- [`registerTools`](/reference/php/signal-wire/skills/builtin/builtin/spider/register-tools)
- [`setup`](/reference/php/signal-wire/skills/builtin/builtin/spider/setup)
- [`supportsMultipleInstances`](/reference/php/signal-wire/skills/builtin/builtin/spider/supports-multiple-instances)
- [`validateEnvVars`](/reference/php/signal-wire/skills/builtin/builtin/spider/validate-env-vars)

## Source

[`/src/src/SignalWire/Skills/Builtin/Spider.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Skills/Builtin/Spider.php)

Line 27.
