---
slug: "/reference/php/signal-wire/rest/rest/rest-client"
title: "RestClient"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\REST\\RestClient"
  parent: "SignalWire\\REST"
  module: "SignalWire.REST"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/REST/RestClient.php"
---
# `RestClient`

Top-level SignalWire REST client.

Provides lazy access to every API namespace (fabric, calling,
phone\_numbers, datasphere, video, compat, etc.).  Credentials can be
supplied explicitly or pulled from environment variables.

## Signature

```php
class RestClient
```

## Methods

- [`__construct`](/reference/php/signal-wire/rest/rest/rest-client/construct)
- [`addresses`](/reference/php/signal-wire/rest/rest/rest-client/addresses) — Addresses (list / create / get / delete — no update).
- [`calling`](/reference/php/signal-wire/rest/rest/rest-client/calling) — Calling API (37 call-control commands).
- [`chat`](/reference/php/signal-wire/rest/rest/rest-client/chat) — Chat tokens.
- [`compat`](/reference/php/signal-wire/rest/rest/rest-client/compat) — Compatibility (Twilio-compatible LaML) API.
- [`datasphere`](/reference/php/signal-wire/rest/rest/rest-client/datasphere) — Datasphere documents (CRUD + chunks + search).
- [`fabric`](/reference/php/signal-wire/rest/rest/rest-client/fabric) — Fabric API (sub-resources: subscribers, sip\_endpoints, call\_flows, ...).
- [`getBaseUrl`](/reference/php/signal-wire/rest/rest/rest-client/get-base-url)
- [`getHttp`](/reference/php/signal-wire/rest/rest/rest-client/get-http)
- [`getProjectId`](/reference/php/signal-wire/rest/rest/rest-client/get-project-id)
- [`getSpace`](/reference/php/signal-wire/rest/rest/rest-client/get-space)
- [`getToken`](/reference/php/signal-wire/rest/rest/rest-client/get-token)
- [`importedNumbers`](/reference/php/signal-wire/rest/rest/rest-client/imported-numbers) — Imported phone numbers (create only).
- [`logs`](/reference/php/signal-wire/rest/rest/rest-client/logs) — Logs (messages, voice, fax, conferences).
- [`lookup`](/reference/php/signal-wire/rest/rest/rest-client/lookup) — Phone number lookup.
- [`mfa`](/reference/php/signal-wire/rest/rest/rest-client/mfa) — Multi-factor authentication (sms / call / verify).
- [`numberGroups`](/reference/php/signal-wire/rest/rest/rest-client/number-groups) — Number groups (CRUD + membership operations).
- [`phoneNumbers`](/reference/php/signal-wire/rest/rest/rest-client/phone-numbers) — Phone numbers.
- [`project`](/reference/php/signal-wire/rest/rest/rest-client/project) — Project management (project tokens).
- [`pubsub`](/reference/php/signal-wire/rest/rest/rest-client/pubsub) — PubSub tokens.
- [`queues`](/reference/php/signal-wire/rest/rest/rest-client/queues) — Queues (CRUD + member operations).
- [`recordings`](/reference/php/signal-wire/rest/rest/rest-client/recordings) — Recordings (list / get / delete only).
- [`registry`](/reference/php/signal-wire/rest/rest/rest-client/registry) — Registry (10DLC brands, campaigns, orders, numbers).
- [`shortCodes`](/reference/php/signal-wire/rest/rest/rest-client/short-codes) — Short codes (list / get / update only).
- [`sipProfile`](/reference/php/signal-wire/rest/rest/rest-client/sip-profile) — SIP profile (singleton, get + update).
- [`verifiedCallers`](/reference/php/signal-wire/rest/rest/rest-client/verified-callers) — Verified callers.
- [`video`](/reference/php/signal-wire/rest/rest/rest-client/video) — Video API namespace (rooms, room\_sessions, room\_recordings,

## Source

[`/src/src/SignalWire/REST/RestClient.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/REST/RestClient.php)

Line 31.
