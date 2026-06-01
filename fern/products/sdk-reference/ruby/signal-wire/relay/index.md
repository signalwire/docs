---
slug: "/reference/ruby/signal-wire/relay"
title: "Relay"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "module"
  language: "ruby"
  qualified_name: "SignalWire::Relay"
  parent: "SignalWire"
  module: "SignalWire"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/call.rb"
  visibility: "public"
---
# `Relay`

## Signature

```ruby
module Relay
```

## Constants

| Name                           | Type                                                                                                         | Required | Default | Description                                     |
| ------------------------------ | ------------------------------------------------------------------------------------------------------------ | -------- | ------- | ----------------------------------------------- |
| `AGENT_STRING`                 | `AGENT_STRING = 'signalwire-agents-ruby/1.0'`                                                                | yes      | —       | —                                               |
| `CALL_STATE_ANSWERED`          | `CALL_STATE_ANSWERED = 'answered'`                                                                           | yes      | —       | —                                               |
| `CALL_STATE_CREATED`           | `CALL_STATE_CREATED = 'created'`                                                                             | yes      | —       | Call states                                     |
| `CALL_STATE_ENDED`             | `CALL_STATE_ENDED = 'ended'`                                                                                 | yes      | —       | —                                               |
| `CALL_STATE_ENDING`            | `CALL_STATE_ENDING = 'ending'`                                                                               | yes      | —       | —                                               |
| `CALL_STATE_RINGING`           | `CALL_STATE_RINGING = 'ringing'`                                                                             | yes      | —       | —                                               |
| `CALL_STATES`                  | `CALL_STATES = [
  CALL_STATE_CREATED,
  CALL_STATE_RINGING,
  CALL_STATE_ANSWERED,
  CALL_STAT`             | yes      | —       | —                                               |
| `CONNECT_STATE_CONNECTED`      | `CONNECT_STATE_CONNECTED = 'connected'`                                                                      | yes      | —       | —                                               |
| `CONNECT_STATE_CONNECTING`     | `CONNECT_STATE_CONNECTING = 'connecting'`                                                                    | yes      | —       | Connect states                                  |
| `CONNECT_STATE_DISCONNECTED`   | `CONNECT_STATE_DISCONNECTED = 'disconnected'`                                                                | yes      | —       | —                                               |
| `CONNECT_STATE_FAILED`         | `CONNECT_STATE_FAILED = 'failed'`                                                                            | yes      | —       | —                                               |
| `DEFAULT_RELAY_HOST`           | `DEFAULT_RELAY_HOST = 'relay.signalwire.com'`                                                                | yes      | —       | Default host                                    |
| `DETECT_TYPE_DIGIT`            | `DETECT_TYPE_DIGIT = 'digit'`                                                                                | yes      | —       | —                                               |
| `DETECT_TYPE_FAX`              | `DETECT_TYPE_FAX = 'fax'`                                                                                    | yes      | —       | —                                               |
| `DETECT_TYPE_MACHINE`          | `DETECT_TYPE_MACHINE = 'machine'`                                                                            | yes      | —       | Detect types                                    |
| `END_REASON_ABANDONED`         | `END_REASON_ABANDONED = 'abandoned'`                                                                         | yes      | —       | —                                               |
| `END_REASON_BUSY`              | `END_REASON_BUSY = 'busy'`                                                                                   | yes      | —       | —                                               |
| `END_REASON_CANCEL`            | `END_REASON_CANCEL = 'cancel'`                                                                               | yes      | —       | —                                               |
| `END_REASON_DECLINE`           | `END_REASON_DECLINE = 'decline'`                                                                             | yes      | —       | —                                               |
| `END_REASON_ERROR`             | `END_REASON_ERROR = 'error'`                                                                                 | yes      | —       | —                                               |
| `END_REASON_HANGUP`            | `END_REASON_HANGUP = 'hangup'`                                                                               | yes      | —       | End reasons                                     |
| `END_REASON_MAX_DURATION`      | `END_REASON_MAX_DURATION = 'max_duration'`                                                                   | yes      | —       | —                                               |
| `END_REASON_NO_ANSWER`         | `END_REASON_NO_ANSWER = 'noAnswer'`                                                                          | yes      | —       | —                                               |
| `END_REASON_NOT_FOUND`         | `END_REASON_NOT_FOUND = 'not_found'`                                                                         | yes      | —       | —                                               |
| `EVENT_AUTHORIZATION_STATE`    | `EVENT_AUTHORIZATION_STATE = 'signalwire.authorization.state'`                                               | yes      | —       | Authorization state event                       |
| `EVENT_CALL_COLLECT`           | `EVENT_CALL_COLLECT = 'calling.call.collect'`                                                                | yes      | —       | —                                               |
| `EVENT_CALL_CONNECT`           | `EVENT_CALL_CONNECT = 'calling.call.connect'`                                                                | yes      | —       | —                                               |
| `EVENT_CALL_DENOISE`           | `EVENT_CALL_DENOISE = 'calling.call.denoise'`                                                                | yes      | —       | —                                               |
| `EVENT_CALL_DETECT`            | `EVENT_CALL_DETECT = 'calling.call.detect'`                                                                  | yes      | —       | —                                               |
| `EVENT_CALL_DIAL`              | `EVENT_CALL_DIAL = 'calling.call.dial'`                                                                      | yes      | —       | —                                               |
| `EVENT_CALL_ECHO`              | `EVENT_CALL_ECHO = 'calling.call.echo'`                                                                      | yes      | —       | —                                               |
| `EVENT_CALL_FAX`               | `EVENT_CALL_FAX = 'calling.call.fax'`                                                                        | yes      | —       | —                                               |
| `EVENT_CALL_PAY`               | `EVENT_CALL_PAY = 'calling.call.pay'`                                                                        | yes      | —       | —                                               |
| `EVENT_CALL_PLAY`              | `EVENT_CALL_PLAY = 'calling.call.play'`                                                                      | yes      | —       | —                                               |
| `EVENT_CALL_QUEUE`             | `EVENT_CALL_QUEUE = 'calling.call.queue'`                                                                    | yes      | —       | —                                               |
| `EVENT_CALL_RECEIVE`           | `EVENT_CALL_RECEIVE = 'calling.call.receive'`                                                                | yes      | —       | —                                               |
| `EVENT_CALL_RECORD`            | `EVENT_CALL_RECORD = 'calling.call.record'`                                                                  | yes      | —       | —                                               |
| `EVENT_CALL_REFER`             | `EVENT_CALL_REFER = 'calling.call.refer'`                                                                    | yes      | —       | —                                               |
| `EVENT_CALL_SEND_DIGITS`       | `EVENT_CALL_SEND_DIGITS = 'calling.call.send_digits'`                                                        | yes      | —       | —                                               |
| `EVENT_CALL_STATE`             | `EVENT_CALL_STATE = 'calling.call.state'`                                                                    | yes      | —       | Event types — calling                           |
| `EVENT_CALL_STREAM`            | `EVENT_CALL_STREAM = 'calling.call.stream'`                                                                  | yes      | —       | —                                               |
| `EVENT_CALL_TAP`               | `EVENT_CALL_TAP = 'calling.call.tap'`                                                                        | yes      | —       | —                                               |
| `EVENT_CALL_TRANSCRIBE`        | `EVENT_CALL_TRANSCRIBE = 'calling.call.transcribe'`                                                          | yes      | —       | —                                               |
| `EVENT_CALLING_ERROR`          | `EVENT_CALLING_ERROR = 'calling.error'`                                                                      | yes      | —       | —                                               |
| `EVENT_CLASS_MAP`              | `EVENT_CLASS_MAP = {
  'calling.call.state'       => CallStateEvent,
  'calling.call.receive'     =`         | yes      | —       | Map event\_type string to typed event class     |
| `EVENT_CONFERENCE`             | `EVENT_CONFERENCE = 'calling.conference'`                                                                    | yes      | —       | —                                               |
| `EVENT_MESSAGING_RECEIVE`      | `EVENT_MESSAGING_RECEIVE = 'messaging.receive'`                                                              | yes      | —       | Messaging event types                           |
| `EVENT_MESSAGING_STATE`        | `EVENT_MESSAGING_STATE = 'messaging.state'`                                                                  | yes      | —       | —                                               |
| `MESSAGE_STATE_DELIVERED`      | `MESSAGE_STATE_DELIVERED = 'delivered'`                                                                      | yes      | —       | —                                               |
| `MESSAGE_STATE_FAILED`         | `MESSAGE_STATE_FAILED = 'failed'`                                                                            | yes      | —       | —                                               |
| `MESSAGE_STATE_INITIATED`      | `MESSAGE_STATE_INITIATED = 'initiated'`                                                                      | yes      | —       | —                                               |
| `MESSAGE_STATE_QUEUED`         | `MESSAGE_STATE_QUEUED = 'queued'`                                                                            | yes      | —       | Message states                                  |
| `MESSAGE_STATE_RECEIVED`       | `MESSAGE_STATE_RECEIVED = 'received'`                                                                        | yes      | —       | —                                               |
| `MESSAGE_STATE_SENT`           | `MESSAGE_STATE_SENT = 'sent'`                                                                                | yes      | —       | —                                               |
| `MESSAGE_STATE_UNDELIVERED`    | `MESSAGE_STATE_UNDELIVERED = 'undelivered'`                                                                  | yes      | —       | —                                               |
| `MESSAGE_TERMINAL_STATES`      | `MESSAGE_TERMINAL_STATES = [
  MESSAGE_STATE_DELIVERED,
  MESSAGE_STATE_UNDELIVERED,
  MESSAGE_STATE_FAILED` | yes      | —       | —                                               |
| `METHOD_SIGNALWIRE_CONNECT`    | `METHOD_SIGNALWIRE_CONNECT = 'signalwire.connect'`                                                           | yes      | —       | JSON-RPC methods                                |
| `METHOD_SIGNALWIRE_DISCONNECT` | `METHOD_SIGNALWIRE_DISCONNECT = 'signalwire.disconnect'`                                                     | yes      | —       | —                                               |
| `METHOD_SIGNALWIRE_EVENT`      | `METHOD_SIGNALWIRE_EVENT = 'signalwire.event'`                                                               | yes      | —       | —                                               |
| `METHOD_SIGNALWIRE_PING`       | `METHOD_SIGNALWIRE_PING = 'signalwire.ping'`                                                                 | yes      | —       | —                                               |
| `METHOD_SIGNALWIRE_RECEIVE`    | `METHOD_SIGNALWIRE_RECEIVE = 'signalwire.receive'`                                                           | yes      | —       | —                                               |
| `METHOD_SIGNALWIRE_UNRECEIVE`  | `METHOD_SIGNALWIRE_UNRECEIVE = 'signalwire.unreceive'`                                                       | yes      | —       | —                                               |
| `PLAY_STATE_ERROR`             | `PLAY_STATE_ERROR = 'error'`                                                                                 | yes      | —       | —                                               |
| `PLAY_STATE_FINISHED`          | `PLAY_STATE_FINISHED = 'finished'`                                                                           | yes      | —       | —                                               |
| `PLAY_STATE_PAUSED`            | `PLAY_STATE_PAUSED = 'paused'`                                                                               | yes      | —       | —                                               |
| `PLAY_STATE_PLAYING`           | `PLAY_STATE_PLAYING = 'playing'`                                                                             | yes      | —       | Play states                                     |
| `PROTOCOL_VERSION`             | `PROTOCOL_VERSION = { 'major' => 2, 'minor' => 0, 'revision' => 0 }.freeze`                                  | yes      | —       | Protocol version sent during signalwire.connect |
| `RECONNECT_BACKOFF_FACTOR`     | `RECONNECT_BACKOFF_FACTOR = 2.0`                                                                             | yes      | —       | —                                               |
| `RECONNECT_MAX_DELAY`          | `RECONNECT_MAX_DELAY = 30.0`                                                                                 | yes      | —       | —                                               |
| `RECONNECT_MIN_DELAY`          | `RECONNECT_MIN_DELAY = 1.0`                                                                                  | yes      | —       | Reconnect settings                              |
| `RECORD_STATE_FINISHED`        | `RECORD_STATE_FINISHED = 'finished'`                                                                         | yes      | —       | —                                               |
| `RECORD_STATE_NO_INPUT`        | `RECORD_STATE_NO_INPUT = 'no_input'`                                                                         | yes      | —       | —                                               |
| `RECORD_STATE_PAUSED`          | `RECORD_STATE_PAUSED = 'paused'`                                                                             | yes      | —       | —                                               |
| `RECORD_STATE_RECORDING`       | `RECORD_STATE_RECORDING = 'recording'`                                                                       | yes      | —       | Record states                                   |
| `ROOM_STATE_JOIN`              | `ROOM_STATE_JOIN = 'join'`                                                                                   | yes      | —       | —                                               |
| `ROOM_STATE_JOINING`           | `ROOM_STATE_JOINING = 'joining'`                                                                             | yes      | —       | Join room states                                |
| `ROOM_STATE_LEAVE`             | `ROOM_STATE_LEAVE = 'leave'`                                                                                 | yes      | —       | —                                               |
| `ROOM_STATE_LEAVING`           | `ROOM_STATE_LEAVING = 'leaving'`                                                                             | yes      | —       | —                                               |

## Methods

- [`parse_event`](/reference/ruby/signal-wire/relay/parse-event) — Parse a raw signalwire.event params hash into a typed event object.

## Classes

- [`Action`](/reference/ruby/signal-wire/relay/action) — Base class for async action handles (play, record, detect, etc.).
- [`ActionTimeoutError`](/reference/ruby/signal-wire/relay/action-timeout-error) — Raised when an action times out waiting for completion.
- [`AIAction`](/reference/ruby/signal-wire/relay/ai-action) — Handle for an active AI agent session.
- [`Call`](/reference/ruby/signal-wire/relay/call) — Represents a live RELAY call.
- [`CallingErrorEvent`](/reference/ruby/signal-wire/relay/calling-error-event) — calling.error
- [`CallReceiveEvent`](/reference/ruby/signal-wire/relay/call-receive-event) — calling.call.receive
- [`CallStateEvent`](/reference/ruby/signal-wire/relay/call-state-event) — calling.call.state
- [`Client`](/reference/ruby/signal-wire/relay/client) — RelayClient -- WebSocket + JSON-RPC 2.0 protocol + event dispatch.
- [`CollectAction`](/reference/ruby/signal-wire/relay/collect-action) — Handle for play\_and\_collect or standalone collect.
- [`CollectEvent`](/reference/ruby/signal-wire/relay/collect-event) — calling.call.collect
- [`ConferenceEvent`](/reference/ruby/signal-wire/relay/conference-event) — calling.conference
- [`ConnectEvent`](/reference/ruby/signal-wire/relay/connect-event) — calling.call.connect
- [`DenoiseEvent`](/reference/ruby/signal-wire/relay/denoise-event) — calling.call.denoise
- [`DetectAction`](/reference/ruby/signal-wire/relay/detect-action) — Handle for an active detect operation.
- [`DetectEvent`](/reference/ruby/signal-wire/relay/detect-event) — calling.call.detect
- [`DialEvent`](/reference/ruby/signal-wire/relay/dial-event) — calling.call.dial
- [`EchoEvent`](/reference/ruby/signal-wire/relay/echo-event) — calling.call.echo
- [`FaxAction`](/reference/ruby/signal-wire/relay/fax-action) — Handle for send\_fax or receive\_fax.
- [`FaxEvent`](/reference/ruby/signal-wire/relay/fax-event) — calling.call.fax
- [`HoldEvent`](/reference/ruby/signal-wire/relay/hold-event) — calling.call.hold
- [`Message`](/reference/ruby/signal-wire/relay/message) — Represents a single SMS/MMS message.
- [`MessageReceiveEvent`](/reference/ruby/signal-wire/relay/message-receive-event) — messaging.receive
- [`MessageStateEvent`](/reference/ruby/signal-wire/relay/message-state-event) — messaging.state
- [`PayAction`](/reference/ruby/signal-wire/relay/pay-action) — Handle for an active pay operation.
- [`PayEvent`](/reference/ruby/signal-wire/relay/pay-event) — calling.call.pay
- [`PlayAction`](/reference/ruby/signal-wire/relay/play-action) — Handle for an active play operation.
- [`PlayEvent`](/reference/ruby/signal-wire/relay/play-event) — calling.call.play
- [`QueueEvent`](/reference/ruby/signal-wire/relay/queue-event) — calling.call.queue
- [`RecordAction`](/reference/ruby/signal-wire/relay/record-action) — Handle for an active record operation.
- [`RecordEvent`](/reference/ruby/signal-wire/relay/record-event) — calling.call.record
- [`ReferEvent`](/reference/ruby/signal-wire/relay/refer-event) — calling.call.refer
- [`RelayError`](/reference/ruby/signal-wire/relay/relay-error) — Raised for RELAY JSON-RPC errors.
- [`RelayEvent`](/reference/ruby/signal-wire/relay/relay-event) — Base event wrapper for raw signalwire.event payloads. Subclasses provide typed accessors for specific event types.
- [`SendDigitsEvent`](/reference/ruby/signal-wire/relay/send-digits-event) — calling.call.send\_digits
- [`StandaloneCollectAction`](/reference/ruby/signal-wire/relay/standalone-collect-action) — Handle for standalone calling.collect (without play).
- [`StreamAction`](/reference/ruby/signal-wire/relay/stream-action) — Handle for an active stream operation.
- [`StreamEvent`](/reference/ruby/signal-wire/relay/stream-event) — calling.call.stream
- [`TapAction`](/reference/ruby/signal-wire/relay/tap-action) — Handle for an active tap operation.
- [`TapEvent`](/reference/ruby/signal-wire/relay/tap-event) — calling.call.tap
- [`TranscribeAction`](/reference/ruby/signal-wire/relay/transcribe-action) — Handle for an active transcribe operation.
- [`TranscribeEvent`](/reference/ruby/signal-wire/relay/transcribe-event) — calling.call.transcribe

## Source

[`lib/signalwire/relay/call.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/call.rb)

Line 6.
