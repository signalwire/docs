---
slug: "/reference/ruby/signal-wire"
title: "SignalWire"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "module"
  language: "ruby"
  qualified_name: "SignalWire"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/runtime.rb"
  visibility: "public"
---
# `SignalWire`

Copyright (c) 2025 SignalWire

Licensed under the MIT License.
See LICENSE file in the project root for full license information.

## Signature

```ruby
module SignalWire
```

## Constants

| Name      | Type                | Required | Default | Description |
| --------- | ------------------- | -------- | ------- | ----------- |
| `VERSION` | `VERSION = '1.1.0'` | yes      | —       | —           |

## Methods

- [`add_skill_directory`](/reference/ruby/signal-wire/add-skill-directory) — Add a directory to search for skills.
- [`list_skills_with_params`](/reference/ruby/signal-wire/list-skills-with-params) — Get complete schema for all available skills, including parameter metadata.
- [`register_skill`](/reference/ruby/signal-wire/register-skill) — Register a custom skill class with the global skill registry.
- [`RestClient`](/reference/ruby/signal-wire/rest-client) — Construct a {SignalWire::REST::RestClient} instance.

## Classes

- [`AgentBase`](/reference/ruby/signal-wire/agent-base) — Central agent class that composes SWML rendering, tool dispatch, prompt management, AI config, and HTTP serving.
- [`AgentServer`](/reference/ruby/signal-wire/agent-server) — Multi-agent hosting on a single Rack application.
- [`DataMap`](/reference/ruby/signal-wire/data-map) — Fluent builder for server-side DataMap tools.

## Modules

- [`Contexts`](/reference/ruby/signal-wire/contexts)
- [`Core`](/reference/ruby/signal-wire/core)
- [`Logging`](/reference/ruby/signal-wire/logging)
- [`POM`](/reference/ruby/signal-wire/pom)
- [`Prefabs`](/reference/ruby/signal-wire/prefabs)
- [`Relay`](/reference/ruby/signal-wire/relay)
- [`REST`](/reference/ruby/signal-wire/rest)
- [`Runtime`](/reference/ruby/signal-wire/runtime) — Runtime environment detection.
- [`Security`](/reference/ruby/signal-wire/security)
- [`Serverless`](/reference/ruby/signal-wire/serverless)
- [`Skills`](/reference/ruby/signal-wire/skills)
- [`Swaig`](/reference/ruby/signal-wire/swaig)
- [`SWML`](/reference/ruby/signal-wire/swml)
- [`Utils`](/reference/ruby/signal-wire/utils)

## Source

[`lib/signalwire/runtime.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/runtime.rb)

Line 8.
