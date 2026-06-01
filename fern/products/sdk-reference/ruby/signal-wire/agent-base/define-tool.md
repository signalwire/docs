---
slug: "/reference/ruby/signal-wire/agent-base/define-tool"
title: "define_tool"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "method"
  language: "ruby"
  qualified_name: "SignalWire::AgentBase#define_tool"
  parent: "SignalWire::AgentBase"
  module: "SignalWire.AgentBase"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/agent/agent_base.rb"
  visibility: "public"
---
# `define_tool`

Register a SWAIG tool (function) that the AI can invoke during a
call.

\== How this becomes a tool the model sees

A SWAIG function is _exactly the same concept_ as a "tool" in
native OpenAI / Anthropic tool calling. On every LLM turn, the
SDK renders each registered SWAIG function into the OpenAI tool
schema:

```
{
  "type": "function",
  "function": {
    "name":        "your_name_here",
    "description": "your description text",
    "parameters":  { ... your JSON schema ... }
  }
}
```

That schema is sent to the model as part of the same API call
that produces the next assistant message. The model reads:

- the function +description+ to decide WHEN to call this tool
- each parameter +description+ (inside +parameters+) to decide
  HOW to fill in that argument from the user's utterance

This means _descriptions are prompt engineering_, not developer
comments. A vague description is the #1 cause of "the model has
the right tool but doesn't call it" failures.

\== Bad vs good descriptions

BAD : description: "Lookup function"
GOOD: description: "Look up a customer's account details by " \
"account number. Use this BEFORE quoting "  \
"any account-specific info (balance, plan, " \
"status). Do not use for general product "  \
"questions."

BAD : parameters: { id: { type: 'string', description: 'the id' } }
GOOD: parameters: { account\_number: { type: 'string',
description: "The customer's 8-digit account " \
"number, no dashes or spaces. Ask the user if they " \
"don't provide it." } }

\== Tool count matters

LLM tool selection accuracy degrades past ~7-8
simultaneously-active tools per call. Use
Contexts::Step#set\_functions to partition tools across steps so
only the relevant subset is active at any moment.

Define a SWAIG tool.

Python parity:
`define_tool(name, description, parameters, handler,
secure=True, fillers=None, wait_file=None, wait_file_loops=None,
webhook_url=None, required=None, is_typed_handler=False, **swaig_fields)`.

## Signature

```ruby
def define_tool(name:, description:, parameters: {}, handler: nil, secure: false, fillers: nil, wait_file: nil, wait_file_loops: nil, webhook_url: nil, required: nil, is_typed_handler: false, swaig_fields: nil, &block)
```

## Parameters

| Name                | Type | Required | Default | Description |
| ------------------- | ---- | -------- | ------- | ----------- |
| `name:`             | —    | yes      | —       | —           |
| `description:`      | —    | yes      | —       | —           |
| `parameters:`       | —    | no       | `{}`    | —           |
| `handler:`          | —    | no       | `nil`   | —           |
| `secure:`           | —    | no       | `false` | —           |
| `fillers:`          | —    | no       | `nil`   | —           |
| `wait_file:`        | —    | no       | `nil`   | —           |
| `wait_file_loops:`  | —    | no       | `nil`   | —           |
| `webhook_url:`      | —    | no       | `nil`   | —           |
| `required:`         | —    | no       | `nil`   | —           |
| `is_typed_handler:` | —    | no       | `false` | —           |
| `swaig_fields:`     | —    | no       | `nil`   | —           |
| `...block`          | —    | no       | —       | —           |

## Yields

- `args, raw_data` — the tool handler
- `args, raw_data` — tool handler body (alternative to passing `handler:`)

## Source

[`lib/signalwire/agent/agent_base.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/agent/agent_base.rb)

Line 523.
