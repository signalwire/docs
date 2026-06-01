---
slug: "/reference/typescript/relay/constants"
title: "constants"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "module"
  language: "typescript"
  qualified_name: "relay.constants"
  module: "relay"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/constants.ts"
---
# `constants`

## Signature

```typescript
module constants
```

## Constants

| Name                           | Type                                                             | Required | Default | Description                                              |
| ------------------------------ | ---------------------------------------------------------------- | -------- | ------- | -------------------------------------------------------- |
| `AGENT_STRING`                 | `"@signalwire/sdk-typescript/2.0"`                               | yes      | —       | —                                                        |
| `CALL_STATE_ANSWERED`          | `"answered"`                                                     | yes      | —       | —                                                        |
| `CALL_STATE_CREATED`           | `"created"`                                                      | yes      | —       | —                                                        |
| `CALL_STATE_ENDED`             | `"ended"`                                                        | yes      | —       | —                                                        |
| `CALL_STATE_ENDING`            | `"ending"`                                                       | yes      | —       | —                                                        |
| `CALL_STATE_RINGING`           | `"ringing"`                                                      | yes      | —       | —                                                        |
| `CALL_STATES`                  | `readonly ["created", "ringing", "answered", "ending", "ended"]` | yes      | —       | —                                                        |
| `CLIENT_PING_INTERVAL`         | `30000`                                                          | yes      | —       | —                                                        |
| `CLIENT_PING_MAX_FAILURES`     | `3`                                                              | yes      | —       | —                                                        |
| `CONNECT_STATE_CONNECTED`      | `"connected"`                                                    | yes      | —       | —                                                        |
| `CONNECT_STATE_CONNECTING`     | `"connecting"`                                                   | yes      | —       | —                                                        |
| `CONNECT_STATE_DISCONNECTED`   | `"disconnected"`                                                 | yes      | —       | —                                                        |
| `CONNECT_STATE_FAILED`         | `"failed"`                                                       | yes      | —       | —                                                        |
| `DEFAULT_RELAY_HOST`           | `"relay.signalwire.com"`                                         | yes      | —       | —                                                        |
| `DETECT_TYPE_DIGIT`            | `"digit"`                                                        | yes      | —       | —                                                        |
| `DETECT_TYPE_FAX`              | `"fax"`                                                          | yes      | —       | —                                                        |
| `DETECT_TYPE_MACHINE`          | `"machine"`                                                      | yes      | —       | —                                                        |
| `END_REASON_ABANDONED`         | `"abandoned"`                                                    | yes      | —       | —                                                        |
| `END_REASON_BUSY`              | `"busy"`                                                         | yes      | —       | —                                                        |
| `END_REASON_CANCEL`            | `"cancel"`                                                       | yes      | —       | —                                                        |
| `END_REASON_DECLINE`           | `"decline"`                                                      | yes      | —       | —                                                        |
| `END_REASON_ERROR`             | `"error"`                                                        | yes      | —       | —                                                        |
| `END_REASON_HANGUP`            | `"hangup"`                                                       | yes      | —       | —                                                        |
| `END_REASON_MAX_DURATION`      | `"max_duration"`                                                 | yes      | —       | —                                                        |
| `END_REASON_NO_ANSWER`         | `"noAnswer"`                                                     | yes      | —       | —                                                        |
| `END_REASON_NOT_FOUND`         | `"not_found"`                                                    | yes      | —       | —                                                        |
| `EVENT_AUTHORIZATION_STATE`    | `"signalwire.authorization.state"`                               | yes      | —       | —                                                        |
| `EVENT_CALL_COLLECT`           | `"calling.call.collect"`                                         | yes      | —       | —                                                        |
| `EVENT_CALL_CONNECT`           | `"calling.call.connect"`                                         | yes      | —       | —                                                        |
| `EVENT_CALL_DENOISE`           | `"calling.call.denoise"`                                         | yes      | —       | —                                                        |
| `EVENT_CALL_DETECT`            | `"calling.call.detect"`                                          | yes      | —       | —                                                        |
| `EVENT_CALL_DIAL`              | `"calling.call.dial"`                                            | yes      | —       | —                                                        |
| `EVENT_CALL_ECHO`              | `"calling.call.echo"`                                            | yes      | —       | —                                                        |
| `EVENT_CALL_FAX`               | `"calling.call.fax"`                                             | yes      | —       | —                                                        |
| `EVENT_CALL_HOLD`              | `"calling.call.hold"`                                            | yes      | —       | —                                                        |
| `EVENT_CALL_PAY`               | `"calling.call.pay"`                                             | yes      | —       | —                                                        |
| `EVENT_CALL_PLAY`              | `"calling.call.play"`                                            | yes      | —       | —                                                        |
| `EVENT_CALL_QUEUE`             | `"calling.call.queue"`                                           | yes      | —       | —                                                        |
| `EVENT_CALL_RECEIVE`           | `"calling.call.receive"`                                         | yes      | —       | —                                                        |
| `EVENT_CALL_RECORD`            | `"calling.call.record"`                                          | yes      | —       | —                                                        |
| `EVENT_CALL_REFER`             | `"calling.call.refer"`                                           | yes      | —       | —                                                        |
| `EVENT_CALL_SEND_DIGITS`       | `"calling.call.send_digits"`                                     | yes      | —       | —                                                        |
| `EVENT_CALL_STATE`             | `"calling.call.state"`                                           | yes      | —       | —                                                        |
| `EVENT_CALL_STREAM`            | `"calling.call.stream"`                                          | yes      | —       | —                                                        |
| `EVENT_CALL_TAP`               | `"calling.call.tap"`                                             | yes      | —       | —                                                        |
| `EVENT_CALL_TRANSCRIBE`        | `"calling.call.transcribe"`                                      | yes      | —       | —                                                        |
| `EVENT_CALLING_ERROR`          | `"calling.error"`                                                | yes      | —       | —                                                        |
| `EVENT_CONFERENCE`             | `"calling.conference"`                                           | yes      | —       | —                                                        |
| `EVENT_MESSAGING_RECEIVE`      | `"messaging.receive"`                                            | yes      | —       | —                                                        |
| `EVENT_MESSAGING_STATE`        | `"messaging.state"`                                              | yes      | —       | —                                                        |
| `EXECUTE_QUEUE_MAX`            | `500`                                                            | yes      | —       | —                                                        |
| `MESSAGE_STATE_DELIVERED`      | `"delivered"`                                                    | yes      | —       | —                                                        |
| `MESSAGE_STATE_FAILED`         | `"failed"`                                                       | yes      | —       | —                                                        |
| `MESSAGE_STATE_INITIATED`      | `"initiated"`                                                    | yes      | —       | —                                                        |
| `MESSAGE_STATE_QUEUED`         | `"queued"`                                                       | yes      | —       | —                                                        |
| `MESSAGE_STATE_RECEIVED`       | `"received"`                                                     | yes      | —       | —                                                        |
| `MESSAGE_STATE_SENT`           | `"sent"`                                                         | yes      | —       | —                                                        |
| `MESSAGE_STATE_UNDELIVERED`    | `"undelivered"`                                                  | yes      | —       | —                                                        |
| `MESSAGE_TERMINAL_STATES`      | `readonly ["delivered", "undelivered", "failed"]`                | yes      | —       | —                                                        |
| `METHOD_SIGNALWIRE_CONNECT`    | `"signalwire.connect"`                                           | yes      | —       | —                                                        |
| `METHOD_SIGNALWIRE_DISCONNECT` | `"signalwire.disconnect"`                                        | yes      | —       | —                                                        |
| `METHOD_SIGNALWIRE_EVENT`      | `"signalwire.event"`                                             | yes      | —       | —                                                        |
| `METHOD_SIGNALWIRE_PING`       | `"signalwire.ping"`                                              | yes      | —       | —                                                        |
| `METHOD_SIGNALWIRE_RECEIVE`    | `"signalwire.receive"`                                           | yes      | —       | —                                                        |
| `METHOD_SIGNALWIRE_UNRECEIVE`  | `"signalwire.unreceive"`                                         | yes      | —       | —                                                        |
| `PLAY_STATE_ERROR`             | `"error"`                                                        | yes      | —       | —                                                        |
| `PLAY_STATE_FINISHED`          | `"finished"`                                                     | yes      | —       | —                                                        |
| `PLAY_STATE_PAUSED`            | `"paused"`                                                       | yes      | —       | —                                                        |
| `PLAY_STATE_PLAYING`           | `"playing"`                                                      | yes      | —       | —                                                        |
| `PROTOCOL_VERSION`             | `{ major: number; minor: number; revision: number }`             | yes      | —       | Protocol constants for the SignalWire RELAY calling API. |
| `RECONNECT_BACKOFF_FACTOR`     | `2`                                                              | yes      | —       | —                                                        |
| `RECONNECT_MAX_DELAY`          | `30`                                                             | yes      | —       | —                                                        |
| `RECONNECT_MIN_DELAY`          | `1`                                                              | yes      | —       | —                                                        |
| `RECORD_STATE_FINISHED`        | `"finished"`                                                     | yes      | —       | —                                                        |
| `RECORD_STATE_NO_INPUT`        | `"no_input"`                                                     | yes      | —       | —                                                        |
| `RECORD_STATE_PAUSED`          | `"paused"`                                                       | yes      | —       | —                                                        |
| `RECORD_STATE_RECORDING`       | `"recording"`                                                    | yes      | —       | —                                                        |
| `REQUEST_TIMEOUT`              | `30000`                                                          | yes      | —       | —                                                        |
| `ROOM_STATE_JOIN`              | `"join"`                                                         | yes      | —       | —                                                        |
| `ROOM_STATE_JOINING`           | `"joining"`                                                      | yes      | —       | —                                                        |
| `ROOM_STATE_LEAVE`             | `"leave"`                                                        | yes      | —       | —                                                        |
| `ROOM_STATE_LEAVING`           | `"leaving"`                                                      | yes      | —       | —                                                        |
| `SERVER_PING_TIMEOUT`          | `15000`                                                          | yes      | —       | —                                                        |

## Source

[`src/relay/constants.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/constants.ts)

Line 1.
