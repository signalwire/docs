---
slug: "/reference/php/signal-wire/security/security/session-manager/validate-token"
title: "validateToken"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Security\\SessionManager::validateToken"
  parent: "SignalWire\\Security\\SessionManager"
  module: "SignalWire.Security"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Security/SessionManager.php"
  visibility: "public"
---
# `validateToken`

Validate a token against the expected call ID and function name.

All comparisons use timing-safe equality checks to prevent side-channel attacks.

## Signature

```php
public function validateToken(
    string $callId,
    string $functionName,
    string $token
): bool
```

## Parameters

| Name           | Type     | Required | Default | Description                              |
| -------------- | -------- | -------- | ------- | ---------------------------------------- |
| `callId`       | `string` | yes      | —       | The expected call ID.                    |
| `functionName` | `string` | yes      | —       | The expected function name.              |
| `token`        | `string` | yes      | —       | The base64url-encoded token to validate. |

## Returns

`bool` — True if the token is valid and not expired.

## Source

[`/src/src/SignalWire/Security/SessionManager.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Security/SessionManager.php)

Line 95.
