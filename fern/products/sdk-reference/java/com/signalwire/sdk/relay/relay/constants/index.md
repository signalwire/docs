---
slug: "/reference/java/com/signalwire/sdk/relay/relay/constants"
title: "Constants"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.relay.Constants"
  parent: "com.signalwire.sdk.relay"
  module: "com.signalwire.sdk.relay"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Constants.java"
  visibility: "public"
---
# `Constants`

Constants for the SignalWire RELAY protocol.

<p>
 Includes call states, end reasons, message states, event types,
 and action terminal states used throughout the RELAY client.

**Modifiers:** `final`

## Signature

```java
public final class Constants
```

## Constants

| Name                                | Type                                                                                      | Required | Default | Description |
| ----------------------------------- | ----------------------------------------------------------------------------------------- | -------- | ------- | ----------- |
| `ACTION_STATE_ERROR`                | `java.lang.String ACTION_STATE_ERROR = error`                                             | yes      | —       | —           |
| `ACTION_STATE_FINISHED`             | `java.lang.String ACTION_STATE_FINISHED = finished`                                       | yes      | —       | —           |
| `ACTION_STATE_NO_INPUT`             | `java.lang.String ACTION_STATE_NO_INPUT = no_input`                                       | yes      | —       | —           |
| `ACTION_STATE_NO_MATCH`             | `java.lang.String ACTION_STATE_NO_MATCH = no_match`                                       | yes      | —       | —           |
| `ACTION_STATE_PAUSED`               | `java.lang.String ACTION_STATE_PAUSED = paused`                                           | yes      | —       | —           |
| `ACTION_STATE_PLAYING`              | `java.lang.String ACTION_STATE_PLAYING = playing`                                         | yes      | —       | —           |
| `ACTION_STATE_RECORDING`            | `java.lang.String ACTION_STATE_RECORDING = recording`                                     | yes      | —       | —           |
| `CALL_STATE_ANSWERED`               | `java.lang.String CALL_STATE_ANSWERED = answered`                                         | yes      | —       | —           |
| `CALL_STATE_CREATED`                | `java.lang.String CALL_STATE_CREATED = created`                                           | yes      | —       | —           |
| `CALL_STATE_ENDED`                  | `java.lang.String CALL_STATE_ENDED = ended`                                               | yes      | —       | —           |
| `CALL_STATE_ENDING`                 | `java.lang.String CALL_STATE_ENDING = ending`                                             | yes      | —       | —           |
| `CALL_STATE_RINGING`                | `java.lang.String CALL_STATE_RINGING = ringing`                                           | yes      | —       | —           |
| `CODE_CONFLICT`                     | `java.lang.String CODE_CONFLICT = 409`                                                    | yes      | —       | —           |
| `CODE_GONE`                         | `java.lang.String CODE_GONE = 410`                                                        | yes      | —       | —           |
| `CODE_NOT_FOUND`                    | `java.lang.String CODE_NOT_FOUND = 404`                                                   | yes      | —       | —           |
| `CODE_SUCCESS`                      | `java.lang.String CODE_SUCCESS = 200`                                                     | yes      | —       | —           |
| `DEVICE_TYPE_PHONE`                 | `java.lang.String DEVICE_TYPE_PHONE = phone`                                              | yes      | —       | —           |
| `DEVICE_TYPE_SIP`                   | `java.lang.String DEVICE_TYPE_SIP = sip`                                                  | yes      | —       | —           |
| `DEVICE_TYPE_WEBRTC`                | `java.lang.String DEVICE_TYPE_WEBRTC = webrtc`                                            | yes      | —       | —           |
| `DIAL_STATE_ANSWERED`               | `java.lang.String DIAL_STATE_ANSWERED = answered`                                         | yes      | —       | —           |
| `DIAL_STATE_DIALING`                | `java.lang.String DIAL_STATE_DIALING = dialing`                                           | yes      | —       | —           |
| `DIAL_STATE_FAILED`                 | `java.lang.String DIAL_STATE_FAILED = failed`                                             | yes      | —       | —           |
| `DIRECTION_BOTH`                    | `java.lang.String DIRECTION_BOTH = both`                                                  | yes      | —       | —           |
| `DIRECTION_LISTEN`                  | `java.lang.String DIRECTION_LISTEN = listen`                                              | yes      | —       | —           |
| `DIRECTION_SPEAK`                   | `java.lang.String DIRECTION_SPEAK = speak`                                                | yes      | —       | —           |
| `END_REASON_BUSY`                   | `java.lang.String END_REASON_BUSY = busy`                                                 | yes      | —       | —           |
| `END_REASON_CANCEL`                 | `java.lang.String END_REASON_CANCEL = cancel`                                             | yes      | —       | —           |
| `END_REASON_DECLINE`                | `java.lang.String END_REASON_DECLINE = decline`                                           | yes      | —       | —           |
| `END_REASON_ERROR`                  | `java.lang.String END_REASON_ERROR = error`                                               | yes      | —       | —           |
| `END_REASON_HANGUP`                 | `java.lang.String END_REASON_HANGUP = hangup`                                             | yes      | —       | —           |
| `END_REASON_NO_ANSWER`              | `java.lang.String END_REASON_NO_ANSWER = noAnswer`                                        | yes      | —       | —           |
| `EVENT_AUTHORIZATION_STATE`         | `java.lang.String EVENT_AUTHORIZATION_STATE = signalwire.authorization.state`             | yes      | —       | —           |
| `EVENT_CALL_COLLECT`                | `java.lang.String EVENT_CALL_COLLECT = calling.call.collect`                              | yes      | —       | —           |
| `EVENT_CALL_CONNECT`                | `java.lang.String EVENT_CALL_CONNECT = calling.call.connect`                              | yes      | —       | —           |
| `EVENT_CALL_DETECT`                 | `java.lang.String EVENT_CALL_DETECT = calling.call.detect`                                | yes      | —       | —           |
| `EVENT_CALL_DIAL`                   | `java.lang.String EVENT_CALL_DIAL = calling.call.dial`                                    | yes      | —       | —           |
| `EVENT_CALL_FAX`                    | `java.lang.String EVENT_CALL_FAX = calling.call.fax`                                      | yes      | —       | —           |
| `EVENT_CALL_PAY`                    | `java.lang.String EVENT_CALL_PAY = calling.call.pay`                                      | yes      | —       | —           |
| `EVENT_CALL_PLAY`                   | `java.lang.String EVENT_CALL_PLAY = calling.call.play`                                    | yes      | —       | —           |
| `EVENT_CALL_RECEIVE`                | `java.lang.String EVENT_CALL_RECEIVE = calling.call.receive`                              | yes      | —       | —           |
| `EVENT_CALL_RECORD`                 | `java.lang.String EVENT_CALL_RECORD = calling.call.record`                                | yes      | —       | —           |
| `EVENT_CALL_REFER`                  | `java.lang.String EVENT_CALL_REFER = calling.call.refer`                                  | yes      | —       | —           |
| `EVENT_CALL_SEND_DIGITS`            | `java.lang.String EVENT_CALL_SEND_DIGITS = calling.call.send_digits`                      | yes      | —       | —           |
| `EVENT_CALL_STATE`                  | `java.lang.String EVENT_CALL_STATE = calling.call.state`                                  | yes      | —       | —           |
| `EVENT_CALL_STREAM`                 | `java.lang.String EVENT_CALL_STREAM = calling.call.stream`                                | yes      | —       | —           |
| `EVENT_CALL_TAP`                    | `java.lang.String EVENT_CALL_TAP = calling.call.tap`                                      | yes      | —       | —           |
| `EVENT_CALL_TRANSCRIBE`             | `java.lang.String EVENT_CALL_TRANSCRIBE = calling.call.transcribe`                        | yes      | —       | —           |
| `EVENT_CONFERENCE`                  | `java.lang.String EVENT_CONFERENCE = calling.conference`                                  | yes      | —       | —           |
| `EVENT_MESSAGING_RECEIVE`           | `java.lang.String EVENT_MESSAGING_RECEIVE = messaging.receive`                            | yes      | —       | —           |
| `EVENT_MESSAGING_STATE`             | `java.lang.String EVENT_MESSAGING_STATE = messaging.state`                                | yes      | —       | —           |
| `EVENT_QUEUE`                       | `java.lang.String EVENT_QUEUE = calling.queue`                                            | yes      | —       | —           |
| `JSONRPC_VERSION`                   | `java.lang.String JSONRPC_VERSION = 2.0`                                                  | yes      | —       | —           |
| `MEDIA_TYPE_AUDIO`                  | `java.lang.String MEDIA_TYPE_AUDIO = audio`                                               | yes      | —       | —           |
| `MEDIA_TYPE_RINGTONE`               | `java.lang.String MEDIA_TYPE_RINGTONE = ringtone`                                         | yes      | —       | —           |
| `MEDIA_TYPE_SILENCE`                | `java.lang.String MEDIA_TYPE_SILENCE = silence`                                           | yes      | —       | —           |
| `MEDIA_TYPE_TTS`                    | `java.lang.String MEDIA_TYPE_TTS = tts`                                                   | yes      | —       | —           |
| `MESSAGE_STATE_DELIVERED`           | `java.lang.String MESSAGE_STATE_DELIVERED = delivered`                                    | yes      | —       | —           |
| `MESSAGE_STATE_FAILED`              | `java.lang.String MESSAGE_STATE_FAILED = failed`                                          | yes      | —       | —           |
| `MESSAGE_STATE_INITIATED`           | `java.lang.String MESSAGE_STATE_INITIATED = initiated`                                    | yes      | —       | —           |
| `MESSAGE_STATE_QUEUED`              | `java.lang.String MESSAGE_STATE_QUEUED = queued`                                          | yes      | —       | —           |
| `MESSAGE_STATE_RECEIVED`            | `java.lang.String MESSAGE_STATE_RECEIVED = received`                                      | yes      | —       | —           |
| `MESSAGE_STATE_SENT`                | `java.lang.String MESSAGE_STATE_SENT = sent`                                              | yes      | —       | —           |
| `MESSAGE_STATE_UNDELIVERED`         | `java.lang.String MESSAGE_STATE_UNDELIVERED = undelivered`                                | yes      | —       | —           |
| `METHOD_AI`                         | `java.lang.String METHOD_AI = calling.ai`                                                 | yes      | —       | —           |
| `METHOD_AI_HOLD`                    | `java.lang.String METHOD_AI_HOLD = calling.ai_hold`                                       | yes      | —       | —           |
| `METHOD_AI_MESSAGE`                 | `java.lang.String METHOD_AI_MESSAGE = calling.ai_message`                                 | yes      | —       | —           |
| `METHOD_AI_STOP`                    | `java.lang.String METHOD_AI_STOP = calling.ai.stop`                                       | yes      | —       | —           |
| `METHOD_AI_UNHOLD`                  | `java.lang.String METHOD_AI_UNHOLD = calling.ai_unhold`                                   | yes      | —       | —           |
| `METHOD_AMAZON_BEDROCK`             | `java.lang.String METHOD_AMAZON_BEDROCK = calling.amazon_bedrock`                         | yes      | —       | —           |
| `METHOD_ANSWER`                     | `java.lang.String METHOD_ANSWER = calling.answer`                                         | yes      | —       | —           |
| `METHOD_BIND_DIGIT`                 | `java.lang.String METHOD_BIND_DIGIT = calling.bind_digit`                                 | yes      | —       | —           |
| `METHOD_CLEAR_DIGIT_BINDINGS`       | `java.lang.String METHOD_CLEAR_DIGIT_BINDINGS = calling.clear_digit_bindings`             | yes      | —       | —           |
| `METHOD_COLLECT`                    | `java.lang.String METHOD_COLLECT = calling.collect`                                       | yes      | —       | —           |
| `METHOD_COLLECT_START_INPUT_TIMERS` | `java.lang.String METHOD_COLLECT_START_INPUT_TIMERS = calling.collect.start_input_timers` | yes      | —       | —           |
| `METHOD_COLLECT_STOP`               | `java.lang.String METHOD_COLLECT_STOP = calling.collect.stop`                             | yes      | —       | —           |
| `METHOD_CONNECT`                    | `java.lang.String METHOD_CONNECT = signalwire.connect`                                    | yes      | —       | —           |
| `METHOD_CONNECT_CALL`               | `java.lang.String METHOD_CONNECT_CALL = calling.connect`                                  | yes      | —       | —           |
| `METHOD_DENOISE`                    | `java.lang.String METHOD_DENOISE = calling.denoise`                                       | yes      | —       | —           |
| `METHOD_DENOISE_STOP`               | `java.lang.String METHOD_DENOISE_STOP = calling.denoise.stop`                             | yes      | —       | —           |
| `METHOD_DETECT`                     | `java.lang.String METHOD_DETECT = calling.detect`                                         | yes      | —       | —           |
| `METHOD_DETECT_STOP`                | `java.lang.String METHOD_DETECT_STOP = calling.detect.stop`                               | yes      | —       | —           |
| `METHOD_DIAL`                       | `java.lang.String METHOD_DIAL = calling.dial`                                             | yes      | —       | —           |
| `METHOD_DISCONNECT`                 | `java.lang.String METHOD_DISCONNECT = signalwire.disconnect`                              | yes      | —       | —           |
| `METHOD_DISCONNECT_CALL`            | `java.lang.String METHOD_DISCONNECT_CALL = calling.disconnect`                            | yes      | —       | —           |
| `METHOD_ECHO`                       | `java.lang.String METHOD_ECHO = calling.echo`                                             | yes      | —       | —           |
| `METHOD_END`                        | `java.lang.String METHOD_END = calling.end`                                               | yes      | —       | —           |
| `METHOD_EVENT`                      | `java.lang.String METHOD_EVENT = signalwire.event`                                        | yes      | —       | —           |
| `METHOD_HOLD`                       | `java.lang.String METHOD_HOLD = calling.hold`                                             | yes      | —       | —           |
| `METHOD_JOIN_CONFERENCE`            | `java.lang.String METHOD_JOIN_CONFERENCE = calling.join_conference`                       | yes      | —       | —           |
| `METHOD_JOIN_ROOM`                  | `java.lang.String METHOD_JOIN_ROOM = calling.join_room`                                   | yes      | —       | —           |
| `METHOD_LEAVE_CONFERENCE`           | `java.lang.String METHOD_LEAVE_CONFERENCE = calling.leave_conference`                     | yes      | —       | —           |
| `METHOD_LEAVE_ROOM`                 | `java.lang.String METHOD_LEAVE_ROOM = calling.leave_room`                                 | yes      | —       | —           |
| `METHOD_LIVE_TRANSCRIBE`            | `java.lang.String METHOD_LIVE_TRANSCRIBE = calling.live_transcribe`                       | yes      | —       | —           |
| `METHOD_LIVE_TRANSLATE`             | `java.lang.String METHOD_LIVE_TRANSLATE = calling.live_translate`                         | yes      | —       | —           |
| `METHOD_MESSAGING_SEND`             | `java.lang.String METHOD_MESSAGING_SEND = messaging.send`                                 | yes      | —       | —           |
| `METHOD_PASS`                       | `java.lang.String METHOD_PASS = calling.pass`                                             | yes      | —       | —           |
| `METHOD_PAY`                        | `java.lang.String METHOD_PAY = calling.pay`                                               | yes      | —       | —           |
| `METHOD_PAY_STOP`                   | `java.lang.String METHOD_PAY_STOP = calling.pay.stop`                                     | yes      | —       | —           |
| `METHOD_PING`                       | `java.lang.String METHOD_PING = signalwire.ping`                                          | yes      | —       | —           |
| `METHOD_PLAY`                       | `java.lang.String METHOD_PLAY = calling.play`                                             | yes      | —       | —           |
| `METHOD_PLAY_AND_COLLECT`           | `java.lang.String METHOD_PLAY_AND_COLLECT = calling.play_and_collect`                     | yes      | —       | —           |
| `METHOD_PLAY_AND_COLLECT_STOP`      | `java.lang.String METHOD_PLAY_AND_COLLECT_STOP = calling.play_and_collect.stop`           | yes      | —       | —           |
| `METHOD_PLAY_AND_COLLECT_VOLUME`    | `java.lang.String METHOD_PLAY_AND_COLLECT_VOLUME = calling.play_and_collect.volume`       | yes      | —       | —           |
| `METHOD_PLAY_PAUSE`                 | `java.lang.String METHOD_PLAY_PAUSE = calling.play.pause`                                 | yes      | —       | —           |
| `METHOD_PLAY_RESUME`                | `java.lang.String METHOD_PLAY_RESUME = calling.play.resume`                               | yes      | —       | —           |
| `METHOD_PLAY_STOP`                  | `java.lang.String METHOD_PLAY_STOP = calling.play.stop`                                   | yes      | —       | —           |
| `METHOD_PLAY_VOLUME`                | `java.lang.String METHOD_PLAY_VOLUME = calling.play.volume`                               | yes      | —       | —           |
| `METHOD_QUEUE_ENTER`                | `java.lang.String METHOD_QUEUE_ENTER = calling.queue.enter`                               | yes      | —       | —           |
| `METHOD_QUEUE_LEAVE`                | `java.lang.String METHOD_QUEUE_LEAVE = calling.queue.leave`                               | yes      | —       | —           |
| `METHOD_RECEIVE`                    | `java.lang.String METHOD_RECEIVE = signalwire.receive`                                    | yes      | —       | —           |
| `METHOD_RECEIVE_FAX`                | `java.lang.String METHOD_RECEIVE_FAX = calling.receive_fax`                               | yes      | —       | —           |
| `METHOD_RECEIVE_FAX_STOP`           | `java.lang.String METHOD_RECEIVE_FAX_STOP = calling.receive_fax.stop`                     | yes      | —       | —           |
| `METHOD_RECORD`                     | `java.lang.String METHOD_RECORD = calling.record`                                         | yes      | —       | —           |
| `METHOD_RECORD_PAUSE`               | `java.lang.String METHOD_RECORD_PAUSE = calling.record.pause`                             | yes      | —       | —           |
| `METHOD_RECORD_RESUME`              | `java.lang.String METHOD_RECORD_RESUME = calling.record.resume`                           | yes      | —       | —           |
| `METHOD_RECORD_STOP`                | `java.lang.String METHOD_RECORD_STOP = calling.record.stop`                               | yes      | —       | —           |
| `METHOD_REFER`                      | `java.lang.String METHOD_REFER = calling.refer`                                           | yes      | —       | —           |
| `METHOD_SEND_DIGITS`                | `java.lang.String METHOD_SEND_DIGITS = calling.send_digits`                               | yes      | —       | —           |
| `METHOD_SEND_FAX`                   | `java.lang.String METHOD_SEND_FAX = calling.send_fax`                                     | yes      | —       | —           |
| `METHOD_SEND_FAX_STOP`              | `java.lang.String METHOD_SEND_FAX_STOP = calling.send_fax.stop`                           | yes      | —       | —           |
| `METHOD_STREAM`                     | `java.lang.String METHOD_STREAM = calling.stream`                                         | yes      | —       | —           |
| `METHOD_STREAM_STOP`                | `java.lang.String METHOD_STREAM_STOP = calling.stream.stop`                               | yes      | —       | —           |
| `METHOD_TAP`                        | `java.lang.String METHOD_TAP = calling.tap`                                               | yes      | —       | —           |
| `METHOD_TAP_STOP`                   | `java.lang.String METHOD_TAP_STOP = calling.tap.stop`                                     | yes      | —       | —           |
| `METHOD_TRANSCRIBE`                 | `java.lang.String METHOD_TRANSCRIBE = calling.transcribe`                                 | yes      | —       | —           |
| `METHOD_TRANSCRIBE_STOP`            | `java.lang.String METHOD_TRANSCRIBE_STOP = calling.transcribe.stop`                       | yes      | —       | —           |
| `METHOD_TRANSFER`                   | `java.lang.String METHOD_TRANSFER = calling.transfer`                                     | yes      | —       | —           |
| `METHOD_UNHOLD`                     | `java.lang.String METHOD_UNHOLD = calling.unhold`                                         | yes      | —       | —           |
| `METHOD_UNRECEIVE`                  | `java.lang.String METHOD_UNRECEIVE = signalwire.unreceive`                                | yes      | —       | —           |
| `METHOD_USER_EVENT`                 | `java.lang.String METHOD_USER_EVENT = calling.user_event`                                 | yes      | —       | —           |
| `PROTOCOL_MAJOR`                    | `int PROTOCOL_MAJOR = 2`                                                                  | yes      | —       | —           |
| `PROTOCOL_MINOR`                    | `int PROTOCOL_MINOR = 0`                                                                  | yes      | —       | —           |
| `PROTOCOL_REVISION`                 | `int PROTOCOL_REVISION = 0`                                                               | yes      | —       | —           |
| `RECONNECT_BACKOFF_MULTIPLIER`      | `double RECONNECT_BACKOFF_MULTIPLIER = 2.0`                                               | yes      | —       | —           |
| `RECONNECT_INITIAL_DELAY_MS`        | `long RECONNECT_INITIAL_DELAY_MS = 1000`                                                  | yes      | —       | —           |
| `RECONNECT_MAX_DELAY_MS`            | `long RECONNECT_MAX_DELAY_MS = 30000`                                                     | yes      | —       | —           |
| `SDK_AGENT`                         | `java.lang.String SDK_AGENT = signalwire-agents-java/1.0.0`                               | yes      | —       | —           |

## Methods

- [`isCallGoneCode`](/reference/java/com/signalwire/sdk/relay/relay/constants/is-call-gone-code) — Check if an HTTP code indicates a "call gone" condition.
- [`isTerminalActionState`](/reference/java/com/signalwire/sdk/relay/relay/constants/is-terminal-action-state) — Check if an action state is terminal (applies to play, record, etc.).
- [`isTerminalCallState`](/reference/java/com/signalwire/sdk/relay/relay/constants/is-terminal-call-state) — Check if a call state is terminal.
- [`isTerminalMessageState`](/reference/java/com/signalwire/sdk/relay/relay/constants/is-terminal-message-state) — Check if a message state is terminal.

## Source

[`src/main/java/com/signalwire/sdk/relay/Constants.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Constants.java)

Line 15.
