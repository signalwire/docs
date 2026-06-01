---
slug: "/reference/python/signalwire/livewire/job-context"
title: "JobContext"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.livewire.JobContext"
  parent: "signalwire.livewire"
  module: "signalwire.livewire"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/livewire/__init__.py"
---
# `JobContext`

Mirrors a livekit JobContext -- provides room and connection info.

## Signature

```python
class JobContext
```

## Properties

| Name   | Type   | Required | Default | Description |
| ------ | ------ | -------- | ------- | ----------- |
| `proc` | `proc` | yes      | —       | —           |
| `room` | `room` | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/livewire/job-context/init)
- [`connect`](/reference/python/signalwire/livewire/job-context/connect) — Noop -- SignalWire agents connect automatically when the platform invokes the SWML endpoint.
- [`wait_for_participant`](/reference/python/signalwire/livewire/job-context/wait-for-participant) — Noop -- SignalWire handles participant management automatically.

## Source

[`/src/signalwire/signalwire/livewire/__init__.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/livewire/__init__.py)

Line 653.
