---
slug: "/reference/php/signal-wire/contexts/contexts/gather-question/construct"
title: "__construct"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Contexts\\GatherQuestion::__construct"
  parent: "SignalWire\\Contexts\\GatherQuestion"
  module: "SignalWire.Contexts"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Contexts/ContextBuilder.php"
  visibility: "public"
---
# `__construct`

## Signature

```php
public function __construct(
    string $key,
    string $question,
    string $type = 'string',
    bool $confirm = false,
    ?string $prompt = NULL,
    ?array $functions = NULL
)
```

## Parameters

| Name        | Type      | Required | Default    | Description                                         |
| ----------- | --------- | -------- | ---------- | --------------------------------------------------- |
| `key`       | `string`  | yes      | —          | Key name for storing the answer in global\_data.    |
| `question`  | `string`  | yes      | —          | The question text to ask.                           |
| `type`      | `string`  | no       | `'string'` | JSON schema type for the answer (default 'string'). |
| `confirm`   | `bool`    | no       | `false`    | If true, the model must confirm the answer.         |
| `prompt`    | `?string` | no       | `NULL`     | Extra instruction text appended after the question. |
| `functions` | `?array`  | no       | `NULL`     | Functions to unlock for this question.              |

## Source

[`/src/src/SignalWire/Contexts/ContextBuilder.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Contexts/ContextBuilder.php)

Line 44.
