---
slug: "/reference/php/signal-wire/swaig/swaig/function-result/join-conference"
title: "joinConference"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\SWAIG\\FunctionResult::joinConference"
  parent: "SignalWire\\SWAIG\\FunctionResult"
  module: "SignalWire.SWAIG"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/SWAIG/FunctionResult.php"
  visibility: "public"
---
# `joinConference`

## Signature

```php
public function joinConference(
    string $name,
    bool $muted = false,
    string $beep = 'true',
    string $holdAudio = 'ring'
): SignalWire\SWAIG\FunctionResult
```

## Parameters

| Name        | Type     | Required | Default  | Description |
| ----------- | -------- | -------- | -------- | ----------- |
| `name`      | `string` | yes      | —        | —           |
| `muted`     | `bool`   | no       | `false`  | —           |
| `beep`      | `string` | no       | `'true'` | —           |
| `holdAudio` | `string` | no       | `'ring'` | —           |

## Returns

`SignalWire\SWAIG\FunctionResult`

## Source

[`/src/src/SignalWire/SWAIG/FunctionResult.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/SWAIG/FunctionResult.php)

Line 353.
