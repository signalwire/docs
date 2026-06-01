---
slug: "/reference/php/signal-wire/rest/rest/paginated-iterator/construct"
title: "__construct"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\REST\\PaginatedIterator::__construct"
  parent: "SignalWire\\REST\\PaginatedIterator"
  module: "SignalWire.REST"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/REST/PaginatedIterator.php"
  visibility: "public"
---
# `__construct`

## Signature

```php
public function __construct(
    SignalWire\REST\HttpClient $http,
    string $path,
    ?array $params = NULL,
    string $dataKey = 'data'
)
```

## Parameters

| Name      | Type                         | Required | Default  | Description                      |
| --------- | ---------------------------- | -------- | -------- | -------------------------------- |
| `http`    | `SignalWire\REST\HttpClient` | yes      | —        | —                                |
| `path`    | `string`                     | yes      | —        | —                                |
| `params`  | `?array`                     | no       | `NULL`   | Initial query-string parameters. |
| `dataKey` | `string`                     | no       | `'data'` | —                                |

## Source

[`/src/src/SignalWire/REST/PaginatedIterator.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/REST/PaginatedIterator.php)

Line 35.
