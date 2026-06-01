---
slug: "/reference/php/signal-wire/security/security/session-manager/construct"
title: "__construct"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Security\\SessionManager::__construct"
  parent: "SignalWire\\Security\\SessionManager"
  module: "SignalWire.Security"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Security/SessionManager.php"
  visibility: "public"
---
# `__construct`

## Signature

```php
public function __construct(int $tokenExpirySecs = 3600)
```

## Parameters

| Name              | Type  | Required | Default | Description                               |
| ----------------- | ----- | -------- | ------- | ----------------------------------------- |
| `tokenExpirySecs` | `int` | no       | `3600`  | Token lifetime in seconds (default 3600). |

## Throws

- `RuntimeException` — If secure random bytes cannot be generated.

## Source

[`/src/src/SignalWire/Security/SessionManager.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Security/SessionManager.php)

Line 19.
