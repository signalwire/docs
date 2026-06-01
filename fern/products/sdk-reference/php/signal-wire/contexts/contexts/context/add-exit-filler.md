---
slug: "/reference/php/signal-wire/contexts/contexts/context/add-exit-filler"
title: "addExitFiller"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Contexts\\Context::addExitFiller"
  parent: "SignalWire\\Contexts\\Context"
  module: "SignalWire.Contexts"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Contexts/ContextBuilder.php"
  visibility: "public"
---
# `addExitFiller`

Add exit fillers for a specific language.

Mirrors Python's Context.add\_exit\_filler(language\_code: str, fillers:
List\[str]) — pass a list of phrases to associate with this language code.

## Signature

```php
public function addExitFiller(
    string $language_code,
    array $fillers
): SignalWire\Contexts\Context
```

## Parameters

| Name            | Type     | Required | Default | Description                                                    |
| --------------- | -------- | -------- | ------- | -------------------------------------------------------------- |
| `language_code` | `string` | yes      | —       | Language code (e.g. "en-US", "es") or "default" for catch-all. |
| `fillers`       | `array`  | yes      | —       | List of filler phrases.                                        |

## Returns

`SignalWire\Contexts\Context`

## Source

[`/src/src/SignalWire/Contexts/ContextBuilder.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Contexts/ContextBuilder.php)

Line 902.
