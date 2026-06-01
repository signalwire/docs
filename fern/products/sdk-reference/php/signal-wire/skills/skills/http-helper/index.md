---
slug: "/reference/php/signal-wire/skills/skills/http-helper"
title: "HttpHelper"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\Skills\\HttpHelper"
  parent: "SignalWire\\Skills"
  module: "SignalWire.Skills"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Skills/HttpHelper.php"
---
# `HttpHelper`

Tiny HTTP helper for skill upstream calls.

The REST client uses cURL behind a Basic-auth wrapper bound to
`https://<space>` — that's the wrong shape for skills, which talk to
arbitrary third-party services with their own URL bases, headers,
and auth schemes. Each skill could call cURL inline, but they all
need the same handful of mechanics (URL building, headers, basic
auth, JSON encode/decode, base-URL override for testing). This
helper centralises that and gives skills a way to honor the
`<SKILL>_BASE_URL` env-var override that audit\_skills\_dispatch
relies on without each skill duplicating the env lookup.

## Signature

```php
class HttpHelper
```

## Constants

| Name              | Type                         | Required | Default | Description                         |
| ----------------- | ---------------------------- | -------- | ------- | ----------------------------------- |
| `DEFAULT_TIMEOUT` | `const DEFAULT_TIMEOUT = 15` | yes      | —       | Default request timeout in seconds. |

## Methods

- [`applyBaseUrlOverride`](/reference/php/signal-wire/skills/skills/http-helper/apply-base-url-override) — Look up a URL override env var and rewrite the URL host/scheme
- [`get`](/reference/php/signal-wire/skills/skills/http-helper/get) — Issue a GET. Returns \[status, body, parsed\_json\_or\_null].
- [`postJson`](/reference/php/signal-wire/skills/skills/http-helper/post-json) — Issue a POST with a JSON body. Returns \[status, body, parsed].
- [`request`](/reference/php/signal-wire/skills/skills/http-helper/request) — Inner request engine using cURL. Other skills may use this

## Source

[`/src/src/SignalWire/Skills/HttpHelper.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Skills/HttpHelper.php)

Line 20.
