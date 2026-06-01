---
slug: "/reference/python/signalwire/prefabs/concierge/concierge-agent"
title: "ConciergeAgent"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.prefabs.concierge.ConciergeAgent"
  parent: "signalwire.prefabs.concierge"
  module: "signalwire.prefabs.concierge"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/prefabs/concierge.py"
---
# `ConciergeAgent`

A prefab agent designed to act as a virtual concierge, providing information
and services to users.

This agent will:

1. Welcome users and explain available services
2. Answer questions about amenities, hours, and directions
3. Help with bookings and reservations
4. Provide personalized recommendations

> \[!NOTE]
> agent = ConciergeAgent(
> venue\_name="Grand Hotel",
> services=\["room service", "spa bookings", "restaurant reservations"],
> amenities={
> "pool": {"hours": "7 AM - 10 PM", "location": "2nd Floor"},
> "gym": {"hours": "24 hours", "location": "3rd Floor"}
> }
> )

## Signature

```python
class ConciergeAgent(AgentBase)
```

## Inheritance

**Extends:** [AgentBase](/reference/python/signalwire/core/agent-base/agent-base)

## Properties

| Name                   | Type                   | Required | Default | Description |
| ---------------------- | ---------------------- | -------- | ------- | ----------- |
| `amenities`            | `amenities`            | yes      | —       | —           |
| `hours_of_operation`   | `hours_of_operation`   | yes      | —       | —           |
| `services`             | `services`             | yes      | —       | —           |
| `special_instructions` | `special_instructions` | yes      | —       | —           |
| `venue_name`           | `venue_name`           | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/prefabs/concierge/concierge-agent/init) — Initialize a concierge agent
- [`check_availability`](/reference/python/signalwire/prefabs/concierge/concierge-agent/check-availability) — Check availability for a service on a specific date and time
- [`get_directions`](/reference/python/signalwire/prefabs/concierge/concierge-agent/get-directions) — Provide directions to a specific location or amenity
- [`on_summary`](/reference/python/signalwire/prefabs/concierge/concierge-agent/on-summary) — Process the interaction summary

## Source

[`/src/signalwire/signalwire/prefabs/concierge.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/prefabs/concierge.py)

Line 23.
