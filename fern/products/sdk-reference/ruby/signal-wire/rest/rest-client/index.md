---
slug: "/reference/ruby/signal-wire/rest/rest-client"
title: "RestClient"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "class"
  language: "ruby"
  qualified_name: "SignalWire::REST::RestClient"
  parent: "SignalWire::REST"
  module: "SignalWire.REST"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/rest_client.rb"
  visibility: "public"
---
# `RestClient`

REST client for the SignalWire platform APIs.

Usage:
client = SignalWire::REST::RestClient.new(
project: 'your-project-id',
token:   'your-api-token',
host:    'your-space.signalwire.com'
)

# Or use environment variables:

# SIGNALWIRE\_PROJECT\_ID, SIGNALWIRE\_API\_TOKEN, SIGNALWIRE\_SPACE

client = SignalWire::REST::RestClient.new

# Use namespaced resources

client.fabric.ai\_agents.list
client.calling.play(call\_id, play: \[...])
client.phone\_numbers.search(area\_code: '512')
client.video.rooms.create(name: 'standup')
client.compat.calls.list

## Signature

```ruby
class RestClient < Object
```

## Inheritance

**Extends:** `Object`

## Methods

- [`addresses`](/reference/ruby/signal-wire/rest/rest-client/addresses) — Returns the value of attribute addresses.
- [`calling`](/reference/ruby/signal-wire/rest/rest-client/calling) — Returns the value of attribute calling.
- [`chat`](/reference/ruby/signal-wire/rest/rest-client/chat) — Returns the value of attribute chat.
- [`compat`](/reference/ruby/signal-wire/rest/rest-client/compat) — Returns the value of attribute compat.
- [`datasphere`](/reference/ruby/signal-wire/rest/rest-client/datasphere) — Returns the value of attribute datasphere.
- [`fabric`](/reference/ruby/signal-wire/rest/rest-client/fabric) — Returns the value of attribute fabric.
- [`http`](/reference/ruby/signal-wire/rest/rest-client/http) — Returns the value of attribute http.
- [`imported_numbers`](/reference/ruby/signal-wire/rest/rest-client/imported-numbers) — Returns the value of attribute imported\_numbers.
- [`initialize`](/reference/ruby/signal-wire/rest/rest-client/initialize) — +base\_url+ overrides the derived +https://{space}+ default. The audit harness uses this to point at the local fixture server.
- [`logs`](/reference/ruby/signal-wire/rest/rest-client/logs) — Returns the value of attribute logs.
- [`lookup`](/reference/ruby/signal-wire/rest/rest-client/lookup) — Returns the value of attribute lookup.
- [`mfa`](/reference/ruby/signal-wire/rest/rest-client/mfa) — Returns the value of attribute mfa.
- [`number_groups`](/reference/ruby/signal-wire/rest/rest-client/number-groups) — Returns the value of attribute number\_groups.
- [`phone_numbers`](/reference/ruby/signal-wire/rest/rest-client/phone-numbers) — Returns the value of attribute phone\_numbers.
- [`project`](/reference/ruby/signal-wire/rest/rest-client/project) — Returns the value of attribute project.
- [`project_id`](/reference/ruby/signal-wire/rest/rest-client/project-id) — Returns the value of attribute project\_id.
- [`pubsub`](/reference/ruby/signal-wire/rest/rest-client/pubsub) — Returns the value of attribute pubsub.
- [`queues`](/reference/ruby/signal-wire/rest/rest-client/queues) — Returns the value of attribute queues.
- [`recordings`](/reference/ruby/signal-wire/rest/rest-client/recordings) — Returns the value of attribute recordings.
- [`registry`](/reference/ruby/signal-wire/rest/rest-client/registry) — Returns the value of attribute registry.
- [`short_codes`](/reference/ruby/signal-wire/rest/rest-client/short-codes) — Returns the value of attribute short\_codes.
- [`sip_profile`](/reference/ruby/signal-wire/rest/rest-client/sip-profile) — Returns the value of attribute sip\_profile.
- [`verified_callers`](/reference/ruby/signal-wire/rest/rest-client/verified-callers) — Returns the value of attribute verified\_callers.
- [`video`](/reference/ruby/signal-wire/rest/rest-client/video) — Returns the value of attribute video.

## Source

[`lib/signalwire/rest/rest_client.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/rest/rest_client.rb)

Line 49.
