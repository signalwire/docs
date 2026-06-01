---
slug: "/reference/php/signal-wire/contexts/contexts/context/add-step"
title: "addStep"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Contexts\\Context::addStep"
  parent: "SignalWire\\Contexts\\Context"
  module: "SignalWire.Contexts"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Contexts/ContextBuilder.php"
  visibility: "public"
---
# `addStep`

Add a new step to this context.

When called with only $name the returned Step can be configured with
the usual method-chaining API. When the optional keyword arguments are
supplied the step is fully configured in one call:

## Signature

```php
public function addStep(
    string $name,
    ?string $task = NULL,
    ?array $bullets = NULL,
    ?string $criteria = NULL,
    $functions = NULL,
    ?array $valid_steps = NULL
): SignalWire\Contexts\Step
```

## Parameters

| Name          | Type                                | Required | Default | Description                                                                                                          |
| ------------- | ----------------------------------- | -------- | ------- | -------------------------------------------------------------------------------------------------------------------- |
| `name`        | `string`                            | yes      | —       | Step name (must be unique within the context).                                                                       |
| `task`        | `?string`                           | no       | `NULL`  | Text for the "Task" section (≡ addSection("Task", $task)).                                                           |
| `bullets`     | `?array`                            | no       | `NULL`  | List of bullet strings for the "Process" section (≡ addBullets("Process", $bullets)). Requires $task to also be set. |
| `criteria`    | `?string`                           | no       | `NULL`  | Step-completion criteria (≡ setStepCriteria()).                                                                      |
| `functions`   | `(string \| array<string> \| null)` | no       | `NULL`  | Tool names the step may call, or 'none' (≡ setFunctions()).                                                          |
| `valid_steps` | `?array`                            | no       | `NULL`  | Names of steps the agent may transition to (≡ setValidSteps()).                                                      |

## Returns

`SignalWire\Contexts\Step` — The configured Step object for optional further chaining.

## Source

[`/src/src/SignalWire/Contexts/ContextBuilder.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Contexts/ContextBuilder.php)

Line 619.
