---
slug: "/reference/php/signal-wire/contexts/contexts/step/set-functions"
title: "setFunctions"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Contexts\\Step::setFunctions"
  parent: "SignalWire\\Contexts\\Step"
  module: "SignalWire.Contexts"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Contexts/ContextBuilder.php"
  visibility: "public"
---
# `setFunctions`

Set which non-internal functions are callable while this step is

active.

IMPORTANT — inheritance behavior:
If you do NOT call this method, the step inherits whichever
function set was active on the previous step (or the previous
context's last step). The server-side runtime only resets the
active set when a step explicitly declares its `functions`
field. This is the most common source of bugs in multi-step
agents: forgetting setFunctions() on a later step lets the
previous step's tools leak through. Best practice is to call
setFunctions() explicitly on every step that should differ
from the previous one.

Keep the per-step active set small: LLM tool selection accuracy
degrades noticeably past ~7-8 simultaneously-active tools per
call. Use per-step whitelisting to partition large tool
collections.

Internal functions (e.g. gather\_submit, hangup hook) are ALWAYS
protected and cannot be deactivated by this whitelist. The
native navigation tools next\_step and change\_context are
injected automatically when setValidSteps / setValidContexts is
used; they are not affected by this list and do not need to
appear in it.

## Signature

```php
public function setFunctions($functions): SignalWire\Contexts\Step
```

## Parameters

| Name        | Type                | Required | Default | Description |
| ----------- | ------------------- | -------- | ------- | ----------- |
| `functions` | `(string \| array)` | yes      | —       | One of:     |

## Returns

`SignalWire\Contexts\Step`

## Source

[`/src/src/SignalWire/Contexts/ContextBuilder.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Contexts/ContextBuilder.php)

Line 297.
