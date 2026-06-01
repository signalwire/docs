---
slug: "/reference/php/signal-wire/swaig/swaig/function-result/rpc-dial"
title: "rpcDial"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\SWAIG\\FunctionResult::rpcDial"
  parent: "SignalWire\\SWAIG\\FunctionResult"
  module: "SignalWire.SWAIG"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/SWAIG/FunctionResult.php"
  visibility: "public"
---
# `rpcDial`

## Signature

```php
public function rpcDial(
    string $to,
    string $from = '',
    ?string $destSwml = NULL,
    ?int $callTimeout = NULL,
    string $region = ''
): SignalWire\SWAIG\FunctionResult
```

## Parameters

| Name          | Type      | Required | Default | Description |
| ------------- | --------- | -------- | ------- | ----------- |
| `to`          | `string`  | yes      | —       | —           |
| `from`        | `string`  | no       | `''`    | —           |
| `destSwml`    | `?string` | no       | `NULL`  | —           |
| `callTimeout` | `?int`    | no       | `NULL`  | —           |
| `region`      | `string`  | no       | `''`    | —           |

## Returns

`SignalWire\SWAIG\FunctionResult`

## Source

[`/src/src/SignalWire/SWAIG/FunctionResult.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/SWAIG/FunctionResult.php)

Line 473.
