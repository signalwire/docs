---
slug: "/reference/php/signal-wire/rest/rest/crud-resource"
title: "CrudResource"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\REST\\CrudResource"
  parent: "SignalWire\\REST"
  module: "SignalWire.REST"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/REST/CrudResource.php"
---
# `CrudResource`

Generic CRUD wrapper around an HttpClient and a base API path.

Provides list / create / get / update / delete for any REST resource that
follows the standard SignalWire collection+item URL pattern.

## Signature

```php
class CrudResource extends BaseResource
```

## Inheritance

**Extends:** [SignalWire\REST\BaseResource](/reference/php/signal-wire/rest/rest/base-resource)

## Methods

- [`__construct`](/reference/php/signal-wire/rest/rest/crud-resource/construct)
- [`create`](/reference/php/signal-wire/rest/rest/crud-resource/create) — Create a new resource (POST basePath).
- [`delete`](/reference/php/signal-wire/rest/rest/crud-resource/delete) — Delete a resource by ID (DELETE basePath/{id}).
- [`get`](/reference/php/signal-wire/rest/rest/crud-resource/get) — Retrieve a single resource by ID (GET basePath/{id}).
- [`getBasePath`](/reference/php/signal-wire/rest/rest/crud-resource/get-base-path)
- [`getClient`](/reference/php/signal-wire/rest/rest/crud-resource/get-client)
- [`getHttp`](/reference/php/signal-wire/rest/rest/crud-resource/get-http)
- [`list`](/reference/php/signal-wire/rest/rest/crud-resource/list) — List resources (GET basePath).
- [`update`](/reference/php/signal-wire/rest/rest/crud-resource/update) — Update a resource by ID (PUT basePath/{id}).

## Source

[`/src/src/SignalWire/REST/CrudResource.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/REST/CrudResource.php)

Line 55.
