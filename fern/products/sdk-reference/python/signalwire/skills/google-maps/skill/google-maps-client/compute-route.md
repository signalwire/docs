---
slug: "/reference/python/signalwire/skills/google-maps/skill/google-maps-client/compute-route"
title: "compute_route"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.skills.google_maps.skill.GoogleMapsClient.compute_route"
  parent: "signalwire.skills.google_maps.skill.GoogleMapsClient"
  module: "signalwire.skills.google_maps.skill"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/google_maps/skill.py"
---
# `compute_route`

Compute route using Google Routes API.

Returns: {"distance\_meters": int, "duration\_seconds": int} or None

## Signature

```python
compute_route(origin_lat, origin_lng, dest_lat, dest_lng)
```

## Parameters

| Name         | Type | Required | Default | Description |
| ------------ | ---- | -------- | ------- | ----------- |
| `origin_lat` | —    | yes      | —       | —           |
| `origin_lng` | —    | yes      | —       | —           |
| `dest_lat`   | —    | yes      | —       | —           |
| `dest_lng`   | —    | yes      | —       | —           |

## Source

[`/src/signalwire/signalwire/skills/google_maps/skill.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/skills/google_maps/skill.py)

Line 316.
