---
slug: "/reference/php/signal-wire/contexts/contexts/gather-info/add-question"
title: "addQuestion"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Contexts\\GatherInfo::addQuestion"
  parent: "SignalWire\\Contexts\\GatherInfo"
  module: "SignalWire.Contexts"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Contexts/ContextBuilder.php"
  visibility: "public"
---
# `addQuestion`

Add a question to gather.

## Signature

```php
public function addQuestion(
    string $key,
    string $question,
    array $kwargs = array (
)
): SignalWire\Contexts\GatherInfo
```

## Parameters

| Name       | Type     | Required | Default     | Description                                           |
| ---------- | -------- | -------- | ----------- | ----------------------------------------------------- |
| `key`      | `string` | yes      | —           | Key name for storing the answer in global\_data.      |
| `question` | `string` | yes      | —           | The question text to ask.                             |
| `kwargs`   | `array`  | no       | `array (
)` | Optional named arguments forwarded to GatherQuestion. |

## Returns

`SignalWire\Contexts\GatherInfo`

## Source

[`/src/src/SignalWire/Contexts/ContextBuilder.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Contexts/ContextBuilder.php)

Line 117.
