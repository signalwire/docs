---
slug: "/reference/php/signal-wire/security/security/session-manager/create-session"
title: "createSession"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Security\\SessionManager::createSession"
  parent: "SignalWire\\Security\\SessionManager"
  module: "SignalWire.Security"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Security/SessionManager.php"
  visibility: "public"
---
# `createSession`

Create or confirm a session, returning the call ID.

## Signature

```php
public function createSession(?string $callId = NULL): string
```

## Parameters

| Name     | Type      | Required | Default | Description                                   |
| -------- | --------- | -------- | ------- | --------------------------------------------- |
| `callId` | `?string` | no       | `NULL`  | An existing call ID, or null to generate one. |

## Returns

`string` — The call ID for this session.

## Source

[`/src/src/SignalWire/Security/SessionManager.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Security/SessionManager.php)

Line 41.
