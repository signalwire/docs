---
slug: "/reference/php/signal-wire/rest/rest/crud-with-addresses/update"
title: "update"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\REST\\CrudWithAddresses::update"
  parent: "SignalWire\\REST\\CrudWithAddresses"
  module: "SignalWire.REST"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/REST/CrudResource.php"
  visibility: "public"
---
# `update`

Update a resource by ID (PUT basePath/{id}).

## Signature

```php
public function update(string $id, array $data): array
```

## Parameters

| Name   | Type     | Required | Default | Description |
| ------ | -------- | -------- | ------- | ----------- |
| `id`   | `string` | yes      | —       | —           |
| `data` | `array`  | yes      | —       | JSON body.  |

## Returns

`array`

## Source

[`/src/src/SignalWire/REST/CrudResource.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/REST/CrudResource.php)

Line 126.
