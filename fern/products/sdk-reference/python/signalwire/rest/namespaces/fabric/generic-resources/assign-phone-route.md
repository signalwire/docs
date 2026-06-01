---
slug: "/reference/python/signalwire/rest/namespaces/fabric/generic-resources/assign-phone-route"
title: "assign_phone_route"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.rest.namespaces.fabric.GenericResources.assign_phone_route"
  parent: "signalwire.rest.namespaces.fabric.GenericResources"
  module: "signalwire.rest.namespaces.fabric"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/rest/namespaces/fabric.py"
---
# `assign_phone_route`

Deprecated for the common binding cases. Use `phone_numbers.set_*` helpers.

This endpoint (`POST /api/fabric/resources/{id}/phone_routes`) accepts
only a narrow set of legacy resource types as the attach target. It
**does not work** for `swml_webhook` / `cxml_webhook` / `ai_agent`
bindings — those are configured on the phone number and the Fabric
resource is auto-materialized (see `phone_numbers.set_swml_webhook`
etc.). The authoritative list of accepting resource types lives in the
OpenAPI spec; routing here for those types returns 404 or 422.

## Signature

```python
assign_phone_route(resource_id, **kwargs = {})
```

## Parameters

| Name          | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `resource_id` | —    | yes      | —       | —           |
| `...kwargs`   | —    | no       | `{}`    | —           |

## Source

[`/src/signalwire/signalwire/rest/namespaces/fabric.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/rest/namespaces/fabric.py)

Line 146.
