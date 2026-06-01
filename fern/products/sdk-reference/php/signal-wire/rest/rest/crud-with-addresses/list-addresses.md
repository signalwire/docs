---
slug: "/reference/php/signal-wire/rest/rest/crud-with-addresses/list-addresses"
title: "listAddresses"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\REST\\CrudWithAddresses::listAddresses"
  parent: "SignalWire\\REST\\CrudWithAddresses"
  module: "SignalWire.REST"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/REST/CrudResource.php"
  visibility: "public"
---
# `listAddresses`

List the addresses associated with a resource (GET basePath/{id}/addresses).

## Signature

```php
public function listAddresses(string $resource_id, array $params = array (
)): array
```

## Parameters

| Name          | Type     | Required | Default     | Description              |
| ------------- | -------- | -------- | ----------- | ------------------------ |
| `resource_id` | `string` | yes      | —           | —                        |
| `params`      | `array`  | no       | `array (
)` | Query-string parameters. |

## Returns

`array`

## Source

[`/src/src/SignalWire/REST/CrudResource.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/REST/CrudResource.php)

Line 156.
