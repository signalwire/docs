---
slug: "/reference/php/signal-wire/security/security/session-manager/validate-tool-token"
title: "validateToolToken"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Security\\SessionManager::validateToolToken"
  parent: "SignalWire\\Security\\SessionManager"
  module: "SignalWire.Security"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Security/SessionManager.php"
  visibility: "public"
---
# `validateToolToken`

Alias for validateToken() with reordered parameters.

## Signature

```php
public function validateToolToken(
    string $functionName,
    string $token,
    string $callId
): bool
```

## Parameters

| Name           | Type     | Required | Default | Description                              |
| -------------- | -------- | -------- | ------- | ---------------------------------------- |
| `functionName` | `string` | yes      | —       | The expected function name.              |
| `token`        | `string` | yes      | —       | The base64url-encoded token to validate. |
| `callId`       | `string` | yes      | —       | The expected call ID.                    |

## Returns

`bool` — True if the token is valid and not expired.

## Source

[`/src/src/SignalWire/Security/SessionManager.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Security/SessionManager.php)

Line 144.
