---
slug: "/reference/ruby/signal-wire/agent-base/initialize"
title: "initialize"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::AgentBase#initialize"
  parent: "SignalWire::AgentBase"
  module: "SignalWire.AgentBase"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/agent/agent_base.rb"
  visibility: "public"
---
# `initialize`

***

## Construction

## Signature

```ruby
def initialize(name: 'agent', route: '/', host: '0.0.0.0', port: nil, basic_auth: nil, use_pom: true, token_expiry_secs: 3600, auto_answer: true, record_call: false, record_format: 'mp4', record_stereo: true, default_webhook_url: nil, agent_id: nil, native_functions: nil, schema_path: nil, suppress_logs: false, enable_post_prompt_override: false, check_for_input_override: false, config_file: nil, schema_validation: true, signing_key: nil, trust_proxy_for_signature: false)
```

## Parameters

| Name                           | Type | Required | Default     | Description |
| ------------------------------ | ---- | -------- | ----------- | ----------- |
| `name:`                        | —    | no       | `'agent'`   | —           |
| `route:`                       | —    | no       | `'/'`       | —           |
| `host:`                        | —    | no       | `'0.0.0.0'` | —           |
| `port:`                        | —    | no       | `nil`       | —           |
| `basic_auth:`                  | —    | no       | `nil`       | —           |
| `use_pom:`                     | —    | no       | `true`      | —           |
| `token_expiry_secs:`           | —    | no       | `3600`      | —           |
| `auto_answer:`                 | —    | no       | `true`      | —           |
| `record_call:`                 | —    | no       | `false`     | —           |
| `record_format:`               | —    | no       | `'mp4'`     | —           |
| `record_stereo:`               | —    | no       | `true`      | —           |
| `default_webhook_url:`         | —    | no       | `nil`       | —           |
| `agent_id:`                    | —    | no       | `nil`       | —           |
| `native_functions:`            | —    | no       | `nil`       | —           |
| `schema_path:`                 | —    | no       | `nil`       | —           |
| `suppress_logs:`               | —    | no       | `false`     | —           |
| `enable_post_prompt_override:` | —    | no       | `false`     | —           |
| `check_for_input_override:`    | —    | no       | `false`     | —           |
| `config_file:`                 | —    | no       | `nil`       | —           |
| `schema_validation:`           | —    | no       | `true`      | —           |
| `signing_key:`                 | —    | no       | `nil`       | —           |
| `trust_proxy_for_signature:`   | —    | no       | `false`     | —           |

## Returns

`AgentBase` — a new instance of AgentBase

## Source

[`lib/signalwire/agent/agent_base.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/agent/agent_base.rb)

Line 59.
