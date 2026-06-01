---
slug: "/reference/python/signalwire/rest/client/rest-client"
title: "RestClient"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.rest.client.RestClient"
  parent: "signalwire.rest.client"
  module: "signalwire.rest.client"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/rest/client.py"
---
# `RestClient`

REST client for the SignalWire platform APIs.

> \[!NOTE]
> client = RestClient(
> project="your-project-id",
> token="your-api-token",
> host="your-space.signalwire.com",
> )
>
> # Or use environment variables:
>
> # SIGNALWIRE\_PROJECT\_ID, SIGNALWIRE\_API\_TOKEN, SIGNALWIRE\_SPACE
>
> client = RestClient()
>
> # Use namespaced resources
>
> client.fabric.ai\_agents.list()
> client.calling.play(call\_id, play=\[...])
> client.phone\_numbers.search(area\_code="512")
> client.video.rooms.create(name="standup")
> client.compat.calls.list()

## Signature

```python
class RestClient
```

## Examples

```python
# Or use environment variables:
#   SIGNALWIRE_PROJECT_ID, SIGNALWIRE_API_TOKEN, SIGNALWIRE_SPACE
client = RestClient()

# Use namespaced resources
client.fabric.ai_agents.list()
client.calling.play(call_id, play=[...])
client.phone_numbers.search(area_code="512")
client.video.rooms.create(name="standup")
client.compat.calls.list()
```

## Properties

| Name               | Type               | Required | Default | Description |
| ------------------ | ------------------ | -------- | ------- | ----------- |
| `addresses`        | `addresses`        | yes      | —       | —           |
| `calling`          | `calling`          | yes      | —       | —           |
| `chat`             | `chat`             | yes      | —       | —           |
| `compat`           | `compat`           | yes      | —       | —           |
| `datasphere`       | `datasphere`       | yes      | —       | —           |
| `fabric`           | `fabric`           | yes      | —       | —           |
| `imported_numbers` | `imported_numbers` | yes      | —       | —           |
| `logs`             | `logs`             | yes      | —       | —           |
| `lookup`           | `lookup`           | yes      | —       | —           |
| `mfa`              | `mfa`              | yes      | —       | —           |
| `number_groups`    | `number_groups`    | yes      | —       | —           |
| `phone_numbers`    | `phone_numbers`    | yes      | —       | —           |
| `project`          | `project`          | yes      | —       | —           |
| `pubsub`           | `pubsub`           | yes      | —       | —           |
| `queues`           | `queues`           | yes      | —       | —           |
| `recordings`       | `recordings`       | yes      | —       | —           |
| `registry`         | `registry`         | yes      | —       | —           |
| `short_codes`      | `short_codes`      | yes      | —       | —           |
| `sip_profile`      | `sip_profile`      | yes      | —       | —           |
| `verified_callers` | `verified_callers` | yes      | —       | —           |
| `video`            | `video`            | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/rest/client/rest-client/init)

## Source

[`/src/signalwire/signalwire/rest/client.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/rest/client.py)

Line 39.
