---
slug: "/reference/php/signal-wire/relay/relay/constants"
title: "Constants"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\Relay\\Constants"
  parent: "SignalWire\\Relay"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Constants.php"
---
# `Constants`

**Modifiers:** `final`

## Signature

```php
final class Constants
```

## Constants

| Name                        | Type                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | Required | Default | Description |
| --------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- | ------- | ----------- |
| `ACTION_TERMINAL_STATES`    | `const ACTION_TERMINAL_STATES = array (
  'calling.call.play' => 
  array (
    'finished' => true,
    'error' => true,
  ),
  'calling.call.record' => 
  array (
    'finished' => true,
    'no_input' => true,
  ),
  'calling.call.detect' => 
  array (
    'finished' => true,
    'error' => true,
  ),
  'calling.call.collect' => 
  array (
    'finished' => true,
    'error' => true,
    'no_input' => true,
    'no_match' => true,
  ),
  'calling.call.fax' => 
  array (
    'finished' => true,
    'error' => true,
  ),
  'calling.call.tap' => 
  array (
    'finished' => true,
  ),
  'calling.call.stream' => 
  array (
    'finished' => true,
  ),
  'calling.call.transcribe' => 
  array (
    'finished' => true,
  ),
  'calling.call.pay' => 
  array (
    'finished' => true,
    'error' => true,
  ),
)` | yes      | —       | —           |
| `CALL_STATE_ANSWERED`       | `const CALL_STATE_ANSWERED = 'answered'`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | yes      | —       | —           |
| `CALL_STATE_CREATED`        | `const CALL_STATE_CREATED = 'created'`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | yes      | —       | —           |
| `CALL_STATE_ENDED`          | `const CALL_STATE_ENDED = 'ended'`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               | yes      | —       | —           |
| `CALL_STATE_ENDING`         | `const CALL_STATE_ENDING = 'ending'`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | yes      | —       | —           |
| `CALL_STATE_RINGING`        | `const CALL_STATE_RINGING = 'ringing'`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | yes      | —       | —           |
| `CALL_TERMINAL_STATES`      | `const CALL_TERMINAL_STATES = array (
  'ended' => true,
)`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | yes      | —       | —           |
| `DIAL_STATE_ANSWERED`       | `const DIAL_STATE_ANSWERED = 'answered'`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | yes      | —       | —           |
| `DIAL_STATE_DIALING`        | `const DIAL_STATE_DIALING = 'dialing'`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | yes      | —       | —           |
| `DIAL_STATE_FAILED`         | `const DIAL_STATE_FAILED = 'failed'`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | yes      | —       | —           |
| `MESSAGE_STATE_DELIVERED`   | `const MESSAGE_STATE_DELIVERED = 'delivered'`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | yes      | —       | —           |
| `MESSAGE_STATE_FAILED`      | `const MESSAGE_STATE_FAILED = 'failed'`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | yes      | —       | —           |
| `MESSAGE_STATE_INITIATED`   | `const MESSAGE_STATE_INITIATED = 'initiated'`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | yes      | —       | —           |
| `MESSAGE_STATE_QUEUED`      | `const MESSAGE_STATE_QUEUED = 'queued'`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | yes      | —       | —           |
| `MESSAGE_STATE_RECEIVED`    | `const MESSAGE_STATE_RECEIVED = 'received'`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | yes      | —       | —           |
| `MESSAGE_STATE_SENT`        | `const MESSAGE_STATE_SENT = 'sent'`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | yes      | —       | —           |
| `MESSAGE_STATE_UNDELIVERED` | `const MESSAGE_STATE_UNDELIVERED = 'undelivered'`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | yes      | —       | —           |
| `MESSAGE_TERMINAL_STATES`   | `const MESSAGE_TERMINAL_STATES = array (
  'delivered' => true,
  'undelivered' => true,
  'failed' => true,
)`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | yes      | —       | —           |
| `PROTOCOL_VERSION`          | `const PROTOCOL_VERSION = array (
  'major' => 2,
  'minor' => 0,
  'revision' => 0,
)`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | yes      | —       | —           |

## Source

[`/src/src/SignalWire/Relay/Constants.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Relay/Constants.php)

Line 7.
