---
slug: "/reference/php/signal-wire/rest/rest/crud-with-addresses"
title: "CrudWithAddresses"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\REST\\CrudWithAddresses"
  parent: "SignalWire\\REST"
  module: "SignalWire.REST"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/REST/CrudResource.php"
---
# `CrudWithAddresses`

CRUD resource that also supports listing addresses for an item.

Mirrors Python's signalwire.rest.\_base.CrudWithAddresses — adds
list\_addresses(resource\_id, \*\*params) on top of the standard CRUD set.

## Signature

```php
class CrudWithAddresses extends CrudResource
```

## Inheritance

**Extends:** [SignalWire\REST\CrudResource](/reference/php/signal-wire/rest/rest/crud-resource)

## Methods

- [`__construct`](/reference/php/signal-wire/rest/rest/crud-with-addresses/construct)
- [`create`](/reference/php/signal-wire/rest/rest/crud-with-addresses/create) — Create a new resource (POST basePath).
- [`delete`](/reference/php/signal-wire/rest/rest/crud-with-addresses/delete) — Delete a resource by ID (DELETE basePath/{id}).
- [`get`](/reference/php/signal-wire/rest/rest/crud-with-addresses/get) — Retrieve a single resource by ID (GET basePath/{id}).
- [`getBasePath`](/reference/php/signal-wire/rest/rest/crud-with-addresses/get-base-path)
- [`getClient`](/reference/php/signal-wire/rest/rest/crud-with-addresses/get-client)
- [`getHttp`](/reference/php/signal-wire/rest/rest/crud-with-addresses/get-http)
- [`list`](/reference/php/signal-wire/rest/rest/crud-with-addresses/list) — List resources (GET basePath).
- [`listAddresses`](/reference/php/signal-wire/rest/rest/crud-with-addresses/list-addresses) — List the addresses associated with a resource (GET basePath/{id}/addresses).
- [`update`](/reference/php/signal-wire/rest/rest/crud-with-addresses/update) — Update a resource by ID (PUT basePath/{id}).

## Source

[`/src/src/SignalWire/REST/CrudResource.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/REST/CrudResource.php)

Line 148.
