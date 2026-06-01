---
slug: "/reference/python/signalwire/rest/namespaces/fabric/auto-materialized-webhook"
title: "AutoMaterializedWebhook"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.rest.namespaces.fabric.AutoMaterializedWebhook"
  parent: "signalwire.rest.namespaces.fabric"
  module: "signalwire.rest.namespaces.fabric"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/rest/namespaces/fabric.py"
---
# `AutoMaterializedWebhook`

Fabric webhook resource that's normally auto-created by phone\_numbers.set\_\*.

Exposed for backwards compatibility. The binding model for these resources
is on the phone number (see `phone_numbers.set_swml_webhook` /
`set_cxml_webhook`) — setting `call_handler` on a phone number
auto-materializes the webhook. Calling `create` here produces an orphan
resource that isn't bound to any phone number.

## Signature

```python
class AutoMaterializedWebhook(FabricResource)
```

## Inheritance

**Extends:** [FabricResource](/reference/python/signalwire/rest/namespaces/fabric/fabric-resource)

## Methods

- [`create`](/reference/python/signalwire/rest/namespaces/fabric/auto-materialized-webhook/create)

## Source

[`/src/signalwire/signalwire/rest/namespaces/fabric.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/rest/namespaces/fabric.py)

Line 29.
