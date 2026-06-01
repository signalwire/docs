---
slug: "/reference/python/signalwire/skills/google-maps/skill/google-maps-client/validate-address"
title: "validate_address"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.skills.google_maps.skill.GoogleMapsClient.validate_address"
  parent: "signalwire.skills.google_maps.skill.GoogleMapsClient"
  module: "signalwire.skills.google_maps.skill"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/google_maps/skill.py"
---
# `validate_address`

Validate and geocode an address or business name.

When bias\_lat/bias\_lng are provided (destination search with known pickup):

1. First tries Nearby Search with rankby=distance to find the CLOSEST
   matching business (e.g. "Walmart" → nearest Walmart to pickup).
2. Falls back to Autocomplete with location bias (no strictbounds) for
   street addresses or if Nearby Search finds nothing.

Without bias coords (pickup search): uses plain Autocomplete.

Returns: {"address": str, "lat": float, "lng": float} or None

## Signature

```python
validate_address(input_text, bias_lat = None, bias_lng = None)
```

## Parameters

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| `input_text` | —    | yes      | —       | —           |
| `bias_lat`   | —    | no       | `None`  | —           |
| `bias_lng`   | —    | no       | `None`  | —           |

## Source

[`/src/signalwire/signalwire/skills/google_maps/skill.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/google_maps/skill.py)

Line 120.
