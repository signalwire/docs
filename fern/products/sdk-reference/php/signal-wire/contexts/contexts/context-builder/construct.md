---
slug: "/reference/php/signal-wire/contexts/contexts/context-builder/construct"
title: "__construct"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "method"
  language: "php"
  qualified_name: "SignalWire\\Contexts\\ContextBuilder::__construct"
  parent: "SignalWire\\Contexts\\ContextBuilder"
  module: "SignalWire.Contexts"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Contexts/ContextBuilder.php"
  visibility: "public"
---
# `__construct`

Construct a builder. The optional $agent reference mirrors Python's

ContextBuilder(agent) so callers (typically AgentBase) can hand the
builder a reference to the owning agent for tool-name collision
checks during validate().

If $agent has a method named getRegisteredToolNames() returning an
array of strings, validate() will use it automatically — no
separate attachToolNameSupplier() call required.

## Signature

```php
public function __construct(?object $agent = NULL)
```

## Parameters

| Name    | Type      | Required | Default | Description |
| ------- | --------- | -------- | ------- | ----------- |
| `agent` | `?object` | no       | `NULL`  | —           |

## Source

[`/src/src/SignalWire/Contexts/ContextBuilder.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/Contexts/ContextBuilder.php)

Line 1090.
