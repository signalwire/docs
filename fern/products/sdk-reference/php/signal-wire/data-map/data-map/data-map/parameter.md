---
slug: "/reference/php/signal-wire/data-map/data-map/data-map/parameter"
title: "parameter"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\DataMap\\DataMap::parameter"
  parent: "SignalWire\\DataMap\\DataMap"
  module: "SignalWire.DataMap"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/DataMap/DataMap.php"
  visibility: "public"
---
# `parameter`

Add a parameter to this data-map tool — the `$description` is

LLM-FACING.

Each parameter description is rendered into the OpenAI tool
schema under parameters.properties.<name>.description and sent
to the model. The model uses it to decide HOW to fill in the
argument from user speech. It is prompt engineering, not
developer FYI.

Bad vs good:

BAD : ->parameter('city', 'string', 'the city')
GOOD: ->parameter('city', 'string',
'The name of the city to get weather for, e.g. '
. '"San Francisco". Ask the user if they did not '
. 'provide one. Include the state or country if the '
. 'city name is ambiguous.')

## Signature

```php
public function parameter(
    string $name,
    string $type,
    string $description,
    bool $required = false,
    array $enum = array (
)
): SignalWire\DataMap\DataMap
```

## Parameters

| Name          | Type     | Required | Default     | Description |
| ------------- | -------- | -------- | ----------- | ----------- |
| `name`        | `string` | yes      | —           | —           |
| `type`        | `string` | yes      | —           | —           |
| `description` | `string` | yes      | —           | —           |
| `required`    | `bool`   | no       | `false`     | —           |
| `enum`        | `array`  | no       | `array (
)` | —           |

## Returns

`SignalWire\DataMap\DataMap`

## Source

[`/src/src/SignalWire/DataMap/DataMap.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/DataMap/DataMap.php)

Line 94.
