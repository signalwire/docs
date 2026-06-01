---
slug: "/reference/php/signal-wire/signal-wire/signal-wire/rest-client"
title: "RestClient"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\SignalWire::RestClient"
  parent: "SignalWire\\SignalWire"
  module: "SignalWire"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/SignalWire.php"
  visibility: "public"
---
# `RestClient`

Construct a REST client.

Mirrors Python's top-level `signalwire.RestClient(*args, **kwargs)`
factory — a thin wrapper that lazy-imports
`signalwire.rest.RestClient` and instantiates it.

The signature accepts two parallel parameters that mirror Python's
variadic shape (`*args` -> `$args` array, `**kwargs` ->
`$kwargs` associative array). Either positional credentials in
`$args` or keyword credentials in `$kwargs` (or both) work.
The cross-language audit recognises `list<*>` ↔ var\_positional
and `dict<string,*>` ↔ var\_keyword via type-driven leniency.

**Modifiers:** `static`

## Signature

```php
public static function RestClient(
    array $args = array (
),
    array $kwargs = array (
)
): SignalWire\REST\RestClient
```

## Parameters

| Name     | Type    | Required | Default     | Description                                    |
| -------- | ------- | -------- | ----------- | ---------------------------------------------- |
| `args`   | `array` | no       | `array (
)` | Positional credentials (project, token, space) |
| `kwargs` | `array` | no       | `array (
)` | Keyword credentials                            |

## Returns

`SignalWire\REST\RestClient`

## Source

[`/src/src/SignalWire/SignalWire.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/SignalWire.php)

Line 42.
