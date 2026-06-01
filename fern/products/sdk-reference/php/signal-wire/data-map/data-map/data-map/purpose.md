---
slug: "/reference/php/signal-wire/data-map/data-map/data-map/purpose"
title: "purpose"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\DataMap\\DataMap::purpose"
  parent: "SignalWire\\DataMap\\DataMap"
  module: "SignalWire.DataMap"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/DataMap/DataMap.php"
  visibility: "public"
---
# `purpose`

Set the LLM-facing tool description (the "purpose"). PROMPT

ENGINEERING, not developer documentation.

The description string is rendered into the OpenAI tool schema
`description` field on every LLM turn. The model reads it to
decide WHEN to call this tool. A vague purpose() is the #1
cause of "the model has the right tool but doesn't call it"
failures with data-map tools.

Bad vs good:

BAD : ->purpose('weather api')
GOOD: ->purpose('Get the current weather conditions and '
. 'forecast for a specific city. Use this '
. 'whenever the user asks about weather, '
. 'temperature, rain, or similar conditions '
. 'in a named location.')

## Signature

```php
public function purpose(string $desc): SignalWire\DataMap\DataMap
```

## Parameters

| Name   | Type     | Required | Default | Description |
| ------ | -------- | -------- | ------- | ----------- |
| `desc` | `string` | yes      | —       | —           |

## Returns

`SignalWire\DataMap\DataMap`

## Source

[`/src/src/SignalWire/DataMap/DataMap.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/DataMap/DataMap.php)

Line 57.
