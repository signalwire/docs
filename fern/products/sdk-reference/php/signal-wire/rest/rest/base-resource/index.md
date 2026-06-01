---
slug: "/reference/php/signal-wire/rest/rest/base-resource"
title: "BaseResource"
sdk_label: "PHP SDK"
icon: "php"
lustri:
  auto_generated: true
  kind: "class"
  language: "php"
  qualified_name: "SignalWire\\REST\\BaseResource"
  parent: "SignalWire\\REST"
  module: "SignalWire.REST"
  source_url: "https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/REST/CrudResource.php"
---
# `BaseResource`

Common base class for namespace and resource classes.

Mirrors Python's signalwire.rest.\_base.BaseResource — minimal wrapper
around an HttpClient and a base path. CrudResource extends this for
standard REST collection+item access; namespace classes that want a
shared base path (without inheriting list/create/get/update/delete)
can subclass BaseResource directly.

## Signature

```php
class BaseResource
```

## Methods

- [`__construct`](/reference/php/signal-wire/rest/rest/base-resource/construct)
- [`getBasePath`](/reference/php/signal-wire/rest/rest/base-resource/get-base-path)
- [`getHttp`](/reference/php/signal-wire/rest/rest/base-resource/get-http)

## Source

[`/src/src/SignalWire/REST/CrudResource.php`](https://github.com/signalwire/signalwire-php/blob/main//src/src/SignalWire/REST/CrudResource.php)

Line 16.
