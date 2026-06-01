---
slug: "/reference/php/signal-wire/rest/namespaces/namespaces/compat"
title: "Compat"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\REST\\Namespaces\\Compat"
  parent: "SignalWire\\REST\\Namespaces"
  module: "SignalWire.REST.Namespaces"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/REST/Namespaces/Compat.php"
---
# `Compat`

Compatibility (Twilio-compatible LAML) API namespace.

Mounted under `/api/laml/2010-04-01/Accounts/{AccountSid}` and exposes
the LAML-flavoured REST surface (Accounts, Calls, Messages, Faxes,
Conferences, IncomingPhoneNumbers + AvailablePhoneNumbers, Applications,
LamlBins, Queues, Recordings, Transcriptions, tokens) as object-style
sub-resources to mirror the Python `CompatNamespace` class.

## Signature

```php
class Compat
```

## Methods

- [`__construct`](/reference/php/signal-wire/rest/namespaces/namespaces/compat/construct)
- [`accounts`](/reference/php/signal-wire/rest/namespaces/namespaces/compat/accounts)
- [`applications`](/reference/php/signal-wire/rest/namespaces/namespaces/compat/applications)
- [`calls`](/reference/php/signal-wire/rest/namespaces/namespaces/compat/calls)
- [`conferences`](/reference/php/signal-wire/rest/namespaces/namespaces/compat/conferences)
- [`faxes`](/reference/php/signal-wire/rest/namespaces/namespaces/compat/faxes)
- [`getAccountBase`](/reference/php/signal-wire/rest/namespaces/namespaces/compat/get-account-base)
- [`getAccountSid`](/reference/php/signal-wire/rest/namespaces/namespaces/compat/get-account-sid)
- [`getHttp`](/reference/php/signal-wire/rest/namespaces/namespaces/compat/get-http)
- [`lamlBins`](/reference/php/signal-wire/rest/namespaces/namespaces/compat/laml-bins)
- [`messages`](/reference/php/signal-wire/rest/namespaces/namespaces/compat/messages)
- [`phoneNumbers`](/reference/php/signal-wire/rest/namespaces/namespaces/compat/phone-numbers)
- [`queues`](/reference/php/signal-wire/rest/namespaces/namespaces/compat/queues)
- [`recordings`](/reference/php/signal-wire/rest/namespaces/namespaces/compat/recordings)
- [`tokens`](/reference/php/signal-wire/rest/namespaces/namespaces/compat/tokens)
- [`transcriptions`](/reference/php/signal-wire/rest/namespaces/namespaces/compat/transcriptions)

## Source

[`/src/src/SignalWire/REST/Namespaces/Compat.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/REST/Namespaces/Compat.php)

Line 19.
