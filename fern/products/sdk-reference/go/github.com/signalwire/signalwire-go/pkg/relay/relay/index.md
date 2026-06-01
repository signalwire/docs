---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay"
title: "relay"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "module"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
---
# `relay`

Package relay implements real-time WebSocket call control over the SignalWire Blade protocol (JSON-RPC 2.0). It provides a RELAY client that manages WebSocket connections, authentication, and event routing for calling, messaging, and other real-time communication primitives.

## Signature

```go
package relay
```

## Constants

| Name                         | Type                         | Required | Default | Description                                                                                                                                                                                                                           |
| ---------------------------- | ---------------------------- | -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `AgentString`                | `AgentString`                | yes      | —       | AgentString is the SDK identifier the connect frame announces to the RELAY server. Mirrors Python's AGENT\_STRING at relay/constants.py:5, translated to identify this language's port. Sent as `params.agent` on signalwire.connect. |
| `CallStateAnswered`          | `CallStateAnswered`          | yes      | —       | Call states represent the lifecycle of a call.                                                                                                                                                                                        |
| `CallStateCreated`           | `CallStateCreated`           | yes      | —       | Call states represent the lifecycle of a call.                                                                                                                                                                                        |
| `CallStateEnded`             | `CallStateEnded`             | yes      | —       | Call states represent the lifecycle of a call.                                                                                                                                                                                        |
| `CallStateEnding`            | `CallStateEnding`            | yes      | —       | Call states represent the lifecycle of a call.                                                                                                                                                                                        |
| `CallStateRinging`           | `CallStateRinging`           | yes      | —       | Call states represent the lifecycle of a call.                                                                                                                                                                                        |
| `DirectionInbound`           | `DirectionInbound`           | yes      | —       | Call directions.                                                                                                                                                                                                                      |
| `DirectionOutbound`          | `DirectionOutbound`          | yes      | —       | Call directions.                                                                                                                                                                                                                      |
| `EndReasonBusy`              | `EndReasonBusy`              | yes      | —       | Call end reasons indicate why a call ended.                                                                                                                                                                                           |
| `EndReasonCancel`            | `EndReasonCancel`            | yes      | —       | Call end reasons indicate why a call ended.                                                                                                                                                                                           |
| `EndReasonDecline`           | `EndReasonDecline`           | yes      | —       | Call end reasons indicate why a call ended.                                                                                                                                                                                           |
| `EndReasonError`             | `EndReasonError`             | yes      | —       | Call end reasons indicate why a call ended.                                                                                                                                                                                           |
| `EndReasonHangup`            | `EndReasonHangup`            | yes      | —       | Call end reasons indicate why a call ended.                                                                                                                                                                                           |
| `EndReasonNoAnswer`          | `EndReasonNoAnswer`          | yes      | —       | Call end reasons indicate why a call ended.                                                                                                                                                                                           |
| `EventAuthorizationState`    | `EventAuthorizationState`    | yes      | —       | Authorization-state event used to refresh reconnect material. Mirrors Python's EVENT\_AUTHORIZATION\_STATE = "signalwire.authorization.state" (relay/constants.py:16).                                                                |
| `EventCallingCallAI`         | `EventCallingCallAI`         | yes      | —       | Event types for calling events.                                                                                                                                                                                                       |
| `EventCallingCallCollect`    | `EventCallingCallCollect`    | yes      | —       | Event types for calling events.                                                                                                                                                                                                       |
| `EventCallingCallConference` | `EventCallingCallConference` | yes      | —       | Event types for calling events.                                                                                                                                                                                                       |
| `EventCallingCallConnect`    | `EventCallingCallConnect`    | yes      | —       | Event types for calling events.                                                                                                                                                                                                       |
| `EventCallingCallDenoise`    | `EventCallingCallDenoise`    | yes      | —       | Event types for calling events.                                                                                                                                                                                                       |
| `EventCallingCallDetect`     | `EventCallingCallDetect`     | yes      | —       | Event types for calling events.                                                                                                                                                                                                       |
| `EventCallingCallDial`       | `EventCallingCallDial`       | yes      | —       | Event types for calling events.                                                                                                                                                                                                       |
| `EventCallingCallEcho`       | `EventCallingCallEcho`       | yes      | —       | Event types for calling events.                                                                                                                                                                                                       |
| `EventCallingCallError`      | `EventCallingCallError`      | yes      | —       | Event types for calling events.                                                                                                                                                                                                       |
| `EventCallingCallFax`        | `EventCallingCallFax`        | yes      | —       | Event types for calling events.                                                                                                                                                                                                       |
| `EventCallingCallHold`       | `EventCallingCallHold`       | yes      | —       | Event types for calling events.                                                                                                                                                                                                       |
| `EventCallingCallPay`        | `EventCallingCallPay`        | yes      | —       | Event types for calling events.                                                                                                                                                                                                       |
| `EventCallingCallPlay`       | `EventCallingCallPlay`       | yes      | —       | Event types for calling events.                                                                                                                                                                                                       |
| `EventCallingCallQueue`      | `EventCallingCallQueue`      | yes      | —       | Event types for calling events.                                                                                                                                                                                                       |
| `EventCallingCallReceive`    | `EventCallingCallReceive`    | yes      | —       | Event types for calling events.                                                                                                                                                                                                       |
| `EventCallingCallRecord`     | `EventCallingCallRecord`     | yes      | —       | Event types for calling events.                                                                                                                                                                                                       |
| `EventCallingCallRefer`      | `EventCallingCallRefer`      | yes      | —       | Event types for calling events.                                                                                                                                                                                                       |
| `EventCallingCallSendDigits` | `EventCallingCallSendDigits` | yes      | —       | Event types for calling events.                                                                                                                                                                                                       |
| `EventCallingCallState`      | `EventCallingCallState`      | yes      | —       | Event types for calling events.                                                                                                                                                                                                       |
| `EventCallingCallStream`     | `EventCallingCallStream`     | yes      | —       | Event types for calling events.                                                                                                                                                                                                       |
| `EventCallingCallTap`        | `EventCallingCallTap`        | yes      | —       | Event types for calling events.                                                                                                                                                                                                       |
| `EventCallingCallTranscribe` | `EventCallingCallTranscribe` | yes      | —       | Event types for calling events.                                                                                                                                                                                                       |
| `EventMessagingReceive`      | `EventMessagingReceive`      | yes      | —       | Event types for messaging events.                                                                                                                                                                                                     |
| `EventMessagingState`        | `EventMessagingState`        | yes      | —       | Event types for messaging events.                                                                                                                                                                                                     |
| `MessageStateDelivered`      | `MessageStateDelivered`      | yes      | —       | Message states represent the lifecycle of an SMS/MMS message.                                                                                                                                                                         |
| `MessageStateFailed`         | `MessageStateFailed`         | yes      | —       | Message states represent the lifecycle of an SMS/MMS message.                                                                                                                                                                         |
| `MessageStateInitiated`      | `MessageStateInitiated`      | yes      | —       | Message states represent the lifecycle of an SMS/MMS message.                                                                                                                                                                         |
| `MessageStateQueued`         | `MessageStateQueued`         | yes      | —       | Message states represent the lifecycle of an SMS/MMS message.                                                                                                                                                                         |
| `MessageStateReceived`       | `MessageStateReceived`       | yes      | —       | Message states represent the lifecycle of an SMS/MMS message.                                                                                                                                                                         |
| `MessageStateSent`           | `MessageStateSent`           | yes      | —       | Message states represent the lifecycle of an SMS/MMS message.                                                                                                                                                                         |
| `MessageStateUndelivered`    | `MessageStateUndelivered`    | yes      | —       | Message states represent the lifecycle of an SMS/MMS message.                                                                                                                                                                         |
| `MethodCalling`              | `MethodCalling`              | yes      | —       | Blade/SignalWire internal method constants.                                                                                                                                                                                           |
| `MethodMessaging`            | `MethodMessaging`            | yes      | —       | Blade/SignalWire internal method constants.                                                                                                                                                                                           |
| `MethodSignalWireConnect`    | `MethodSignalWireConnect`    | yes      | —       | Blade/SignalWire internal method constants.                                                                                                                                                                                           |
| `MethodSignalWireEvent`      | `MethodSignalWireEvent`      | yes      | —       | Blade/SignalWire internal method constants.                                                                                                                                                                                           |
| `MethodSignalWirePing`       | `MethodSignalWirePing`       | yes      | —       | Blade/SignalWire internal method constants.                                                                                                                                                                                           |
| `ProtocolVersionMajor`       | `ProtocolVersionMajor`       | yes      | —       | Protocol version for the SignalWire Blade protocol.                                                                                                                                                                                   |
| `ProtocolVersionMinor`       | `ProtocolVersionMinor`       | yes      | —       | Protocol version for the SignalWire Blade protocol.                                                                                                                                                                                   |
| `ProtocolVersionRevision`    | `ProtocolVersionRevision`    | yes      | —       | Protocol version for the SignalWire Blade protocol.                                                                                                                                                                                   |

## Functions

- [`NewAIEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/new-ai-event) — NewAIEvent constructs an AIEvent from raw params.
- [`NewCallingErrorEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/new-calling-error-event) — NewCallingErrorEvent constructs a CallingErrorEvent from raw params.
- [`NewCallReceiveEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/new-call-receive-event) — NewCallReceiveEvent constructs a CallReceiveEvent from raw params.
- [`NewCallStateEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/new-call-state-event) — NewCallStateEvent constructs a CallStateEvent from raw params.
- [`NewCollectEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/new-collect-event) — NewCollectEvent constructs a CollectEvent from raw params.
- [`NewConferenceEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/new-conference-event) — NewConferenceEvent constructs a ConferenceEvent from raw params.
- [`NewConnectEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/new-connect-event) — NewConnectEvent constructs a ConnectEvent from raw params.
- [`NewDenoiseEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/new-denoise-event) — NewDenoiseEvent constructs a DenoiseEvent from raw params.
- [`NewDetectEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/new-detect-event) — NewDetectEvent constructs a DetectEvent from raw params.
- [`NewDialEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/new-dial-event) — NewDialEvent constructs a DialEvent from raw params.
- [`NewEchoEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/new-echo-event) — NewEchoEvent constructs an EchoEvent from raw params.
- [`NewFaxEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/new-fax-event) — NewFaxEvent constructs a FaxEvent from raw params.
- [`NewHoldEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/new-hold-event) — NewHoldEvent constructs a HoldEvent from raw params.
- [`NewMessageReceiveEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/new-message-receive-event) — NewMessageReceiveEvent constructs a MessageReceiveEvent from raw params.
- [`NewMessageStateEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/new-message-state-event) — NewMessageStateEvent constructs a MessageStateEvent from raw params.
- [`NewPayEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/new-pay-event) — NewPayEvent constructs a PayEvent from raw params.
- [`NewPlayEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/new-play-event) — NewPlayEvent constructs a PlayEvent from raw params.
- [`NewQueueEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/new-queue-event) — NewQueueEvent constructs a QueueEvent from raw params.
- [`NewRecordEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/new-record-event) — NewRecordEvent constructs a RecordEvent from raw params. URL, Duration, and Size are extracted from the nested "record" dict first, falling back to top-level params — matching Python's from\_payload behavior.
- [`NewReferEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/new-refer-event) — NewReferEvent constructs a ReferEvent from raw params.
- [`NewRelayClient`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/new-relay-client) — NewRelayClient creates a new RELAY Client with the given options.
- [`NewRelayError`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/new-relay-error) — NewRelayError constructs a RelayError with the given code and message.
- [`NewRelayEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/new-relay-event) — NewRelayEvent creates a new RelayEvent from the given type and params.
- [`NewSendDigitsEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/new-send-digits-event) — NewSendDigitsEvent constructs a SendDigitsEvent from raw params.
- [`NewStreamEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/new-stream-event) — NewStreamEvent constructs a StreamEvent from raw params.
- [`NewTapEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/new-tap-event) — NewTapEvent constructs a TapEvent from raw params.
- [`NewTranscribeEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/new-transcribe-event) — NewTranscribeEvent constructs a TranscribeEvent from raw params.
- [`ParseEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/parse-event) — ParseEvent parses a raw signalwire event payload dict into a typed event object. It reads "event\_type" from the top-level payload and "params" as the inner parameter map, then dispatches to the appropriate typed constructor. If the event\_type is not recognised, a plain \*RelayEvent is returned. Callers can type-assert or type-switch on the result to access the concrete event fields.
- [`WithAIControlID`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-ai-control-id) — WithAIControlID supplies an explicit control\_id for the AI action, matching Python's ai(control\_id=...).
- [`WithAIEngine`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-ai-engine) — WithAIEngine sets the AI engine to use.
- [`WithAIParams`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-ai-params) — WithAIParams sets arbitrary AI parameters.
- [`WithAIPostPrompt`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-ai-post-prompt) — WithAIPostPrompt sets the AI post-prompt configuration.
- [`WithAIPrompt`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-ai-prompt) — WithAIPrompt sets the AI prompt text.
- [`WithConferenceBeep`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-conference-beep) — WithConferenceBeep enables beep on join/leave.
- [`WithConferenceDeaf`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-conference-deaf) — WithConferenceDeaf joins deaf (cannot hear others).
- [`WithConferenceMuted`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-conference-muted) — WithConferenceMuted joins muted.
- [`WithConnectRingback`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-connect-ringback) — WithConnectRingback sets ringback media for the connect operation.
- [`WithContexts`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-contexts) — WithContexts sets the contexts to subscribe to for inbound events.
- [`WithDialClientTimeout`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-dial-client-timeout) — WithDialClientTimeout bounds how long Dial() will wait for the calling.call.dial event before raising a timeout error. Mirrors Python's dial(dial\_timeout=\<seconds>). Default is 120s when omitted.
- [`WithDialFromNumber`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-dial-from-number) — WithDialFromNumber sets the caller ID for the outbound call.
- [`WithDialMaxDuration`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-dial-max-duration) — WithDialMaxDuration sets the maximum call duration in minutes. Mirrors Python's dial(max\_duration=...) parameter.
- [`WithDialTag`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-dial-tag) — WithDialTag sets an explicit caller-supplied dial tag. When omitted the SDK generates a UUID, mirroring Python's `tag = tag or str(uuid.uuid4())` at relay/client.py:368.
- [`WithDialTimeout`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-dial-timeout) — WithDialTimeout sets the legacy per-leg dial timeout in seconds. (Was the only Go option; retained for back-compat. To bound the overall Dial() call use WithDialClientTimeout.)
- [`WithEnvDefaults`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-env-defaults) — WithEnvDefaults is now a no-op pass-through retained for backwards compatibility — env defaults are loaded automatically at the end of NewRelayClient (mirroring Python RelayClient.**init**). New code can rely on the auto-load behavior and omit this option entirely.
- [`WithFaxControlID`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-fax-control-id) — WithFaxControlID supplies an explicit control\_id for the fax action, matching Python's send\_fax(control\_id=...) / receive\_fax(control\_id=...).
- [`WithFaxHeaderInfo`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-fax-header-info) — WithFaxHeaderInfo sets the fax header info string (matches Python's header\_info param).
- [`WithJWT`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-jwt) — WithJWT sets a pre-existing JWT for authentication.
- [`WithMaxActiveCalls`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-max-active-calls) — WithMaxActiveCalls limits the number of concurrent active calls.
- [`WithMessageContext`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-message-context) — WithMessageContext sets the routing context for the message. Mirrors Python's send\_message(context=...) parameter — defaults to the relay protocol when omitted.
- [`WithMessageMedia`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-message-media) — WithMessageMedia adds media URLs to the message (MMS).
- [`WithMessageOnCompleted`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-message-on-completed) — WithMessageOnCompleted registers a callback invoked when the message reaches a terminal state (delivered, undelivered, or failed). The callback receives both the message and the terminal RelayEvent, mirroring Python's \_on\_completed callback contract (relay/message.py:115-117) which receives the event directly. Mirrors Python's send\_message(on\_completed=...) parameter.
- [`WithMessageRegion`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-message-region) — WithMessageRegion sets the region for message delivery.
- [`WithMessageTags`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-message-tags) — WithMessageTags sets tags on the message for tracking.
- [`WithPayChargeAmount`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-pay-charge-amount) — WithPayChargeAmount sets the charge amount.
- [`WithPayControlID`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-pay-control-id) — WithPayControlID supplies an explicit control\_id for the pay action, matching Python's pay(control\_id=...).
- [`WithPayCurrency`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-pay-currency) — WithPayCurrency sets the payment currency.
- [`WithPayDescription`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-pay-description) — WithPayDescription sets a description for the payment.
- [`WithPayInputMethod`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-pay-input-method) — WithPayInputMethod sets the payment input method.
- [`WithPayLanguage`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-pay-language) — WithPayLanguage sets the language for payment prompts.
- [`WithPayMaxAttempts`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-pay-max-attempts) — WithPayMaxAttempts sets the maximum number of payment attempts.
- [`WithPayMinPostalCodeLength`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-pay-min-postal-code-length) — WithPayMinPostalCodeLength sets the minimum postal code length.
- [`WithPayParameters`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-pay-parameters) — WithPayParameters sets additional payment parameters.
- [`WithPayPaymentMethod`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-pay-payment-method) — WithPayPaymentMethod sets the payment method (e.g. "credit-card").
- [`WithPayPostalCode`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-pay-postal-code) — WithPayPostalCode sets whether to collect postal code.
- [`WithPayPrompts`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-pay-prompts) — WithPayPrompts sets custom payment prompts.
- [`WithPaySecurityCode`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-pay-security-code) — WithPaySecurityCode sets whether to collect security code.
- [`WithPayStatusURL`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-pay-status-url) — WithPayStatusURL sets the payment status callback URL.
- [`WithPayTimeout`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-pay-timeout) — WithPayTimeout sets the timeout string for the payment session.
- [`WithPayTokenType`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-pay-token-type) — WithPayTokenType sets the payment token type.
- [`WithPayValidCardTypes`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-pay-valid-card-types) — WithPayValidCardTypes sets the valid card types string.
- [`WithPayVoice`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-pay-voice) — WithPayVoice sets the voice for payment prompts.
- [`WithPlayControlID`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-play-control-id) — WithPlayControlID sets an explicit control\_id for the play action. Mirrors Python's play(control\_id=...). When omitted the SDK auto-generates a UUID. The same key is honored by play\_and\_collect.
- [`WithPlayDirection`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-play-direction) — WithPlayDirection sets the play direction (e.g. "self" / "peer" / "both").
- [`WithPlayLoop`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-play-loop) — WithPlayLoop sets the number of loop iterations for playback.
- [`WithPlayOnCompleted`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-play-on-completed) — WithPlayOnCompleted registers a callback fired when the play action reaches a terminal state. Mirrors Python's play(on\_completed=...).
- [`WithPlayVolume`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-play-volume) — WithPlayVolume sets the volume for playback in dB.
- [`WithProject`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-project) — WithProject sets the project ID for authentication.
- [`WithRecordAudio`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-record-audio) — WithRecordAudio sets the audio config map for the record action's "record": {"audio": ...} payload. Mirrors Python's record(audio=...).
- [`WithRecordBeep`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-record-beep) — WithRecordBeep enables a beep before recording.
- [`WithRecordControlID`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-record-control-id) — WithRecordControlID sets an explicit control\_id for the record action. Mirrors Python's record(control\_id=...).
- [`WithRecordDirection`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-record-direction) — WithRecordDirection sets the recording direction ("listen", "speak", "both").
- [`WithRecordEndSilenceTimeout`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-record-end-silence-timeout) — WithRecordEndSilenceTimeout sets the end-of-speech silence timeout in seconds.
- [`WithRecordFormat`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-record-format) — WithRecordFormat sets the recording format (e.g. "wav", "mp3").
- [`WithRecordInitialTimeout`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-record-initial-timeout) — WithRecordInitialTimeout sets the initial timeout in seconds.
- [`WithRecordOnCompleted`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-record-on-completed) — WithRecordOnCompleted registers a callback fired when the record action reaches a terminal state. Mirrors Python's record(on\_completed=...).
- [`WithRecordStereo`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-record-stereo) — WithRecordStereo enables stereo recording.
- [`WithRecordTerminators`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-record-terminators) — WithRecordTerminators sets DTMF terminators to stop recording.
- [`WithSpace`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-space) — WithSpace sets the SignalWire space (e.g. "example.signalwire.com").
- [`WithStreamCodec`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-stream-codec) — WithStreamCodec sets the stream audio codec.
- [`WithStreamControlID`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-stream-control-id) — WithStreamControlID supplies an explicit control\_id for the stream action, matching Python's stream(control\_id=...).
- [`WithStreamDirection`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-stream-direction) — WithStreamDirection sets the stream direction.
- [`WithToken`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-token) — WithToken sets the API token for authentication.

## Type Aliases

- [`AIOption`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/ai-option) — AIOption configures an AI operation on a call.
- [`ClientOption`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/client-option) — ClientOption configures the RELAY Client.
- [`ConferenceOption`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/conference-option) — ConferenceOption configures a JoinConference call.
- [`ConnectOption`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/connect-option) — ConnectOption configures a Connect call.
- [`DialOption`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/dial-option) — DialOption configures a Dial (outbound call) operation.
- [`FaxOption`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/fax-option) — FaxOption configures a SendFax call.
- [`MessageOption`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/message-option) — MessageOption configures a SendMessage operation.
- [`PayOption`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/pay-option) — PayOption configures a Pay call.
- [`PlayOption`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/play-option) — PlayOption configures a Play call.
- [`RecordOption`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/record-option) — RecordOption configures a Record call.
- [`StreamOption`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/stream-option) — StreamOption configures a Stream call.

## Classes

- [`Action`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/action) — Action represents a long-running operation on a call, such as playing audio, recording, or collecting input. Callers can Wait for completion, check status, or register a completion callback.
- [`AIAction`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/ai-action) — AIAction represents a long-running AI operation on a call.
- [`AIEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/ai-event) — AIEvent represents a calling.call.ai event.
- [`Call`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call) — Call represents an active voice call managed through the RELAY client. It exposes methods for every calling operation supported by SignalWire, grouped into logical categories: lifecycle, audio, recording, bridging, DTMF, detection, fax, tap, streaming, conferencing, AI, hold/denoise, room/queue, pay, and transcription.
- [`CallingErrorEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/calling-error-event) — CallingErrorEvent represents a calling.call.error event.
- [`CallReceiveEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call-receive-event) — CallReceiveEvent represents a calling.call.receive event for inbound calls.
- [`CallStateEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call-state-event) — CallStateEvent represents a calling.call.state event.
- [`Client`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/client) — Client is the main RELAY WebSocket client that manages a persistent connection to SignalWire, handles Blade/JSON-RPC 2.0 authentication, event dispatch, and exposes high-level Dial/SendMessage methods.
- [`CollectAction`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/collect-action) — CollectAction represents a play-and-collect operation.
- [`CollectEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/collect-event) — CollectEvent represents a calling.call.collect event.
- [`CollectParams`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/collect-params) — CollectParams holds named parameters for the Collect method, matching Python's collect() named arguments. The fields are placed at the top level of the on-wire calling.collect frame (NOT nested under a "collect" object) — mirroring Python's params\["digits"] = digits at relay/call.py:583.
- [`ConferenceEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/conference-event) — ConferenceEvent represents a calling.call.conference event.
- [`ConnectEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/connect-event) — ConnectEvent represents a calling.call.connect event.
- [`DenoiseEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/denoise-event) — DenoiseEvent represents a calling.call.denoise event.
- [`DetectAction`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/detect-action) — DetectAction represents a long-running detect operation (e.g. machine detection).
- [`DetectEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/detect-event) — DetectEvent represents a calling.call.detect event.
- [`DialEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/dial-event) — DialEvent represents a calling.call.dial event.
- [`EchoEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/echo-event) — EchoEvent represents a calling.call.echo event.
- [`FaxAction`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/fax-action) — FaxAction represents a long-running fax send/receive operation. methodPrefix distinguishes "send\_fax" from "receive\_fax" and is used to build the operation-specific stop command (e.g. "calling.send\_fax.stop").
- [`FaxEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/fax-event) — FaxEvent represents a calling.call.fax event.
- [`HoldEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/hold-event) — HoldEvent represents a calling.call.hold event.
- [`Message`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/message) — Message represents an SMS/MMS message tracked through its lifecycle.
- [`MessageReceiveEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/message-receive-event) — MessageReceiveEvent represents a messaging.receive event.
- [`MessageStateEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/message-state-event) — MessageStateEvent represents a messaging.state event.
- [`PayAction`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/pay-action) — PayAction represents a long-running pay operation.
- [`PayEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/pay-event) — PayEvent represents a calling.call.pay event.
- [`PlayAction`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/play-action) — PlayAction represents a long-running play operation with media controls.
- [`PlayEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/play-event) — PlayEvent represents a calling.call.play event.
- [`QueueEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/queue-event) — QueueEvent represents a calling.call.queue event.
- [`RecordAction`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/record-action) — RecordAction represents a long-running record operation.
- [`RecordEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/record-event) — RecordEvent represents a calling.call.record event.
- [`ReferEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/refer-event) — ReferEvent represents a calling.call.refer event.
- [`RelayError`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/relay-error) — RelayError is a typed error returned by the RELAY protocol client. It carries the numeric code and message from the server so callers can programmatically inspect failures via errors.As.
- [`RelayEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/relay-event) — RelayEvent is the base event type for all events received from the SignalWire RELAY service. It carries an event type string and a generic parameter map that can be queried via helper methods.
- [`SendDigitsEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/send-digits-event) — SendDigitsEvent represents a calling.call.send\_digits event.
- [`StandaloneCollectAction`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/standalone-collect-action) — StandaloneCollectAction represents a standalone collect (without play).
- [`StreamAction`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/stream-action) — StreamAction represents a long-running media stream operation.
- [`StreamEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/stream-event) — StreamEvent represents a calling.call.stream event.
- [`TapAction`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/tap-action) — TapAction represents a long-running tap operation.
- [`TapEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/tap-event) — TapEvent represents a calling.call.tap event.
- [`TranscribeAction`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/transcribe-action) — TranscribeAction represents a long-running transcription operation.
- [`TranscribeEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/transcribe-event) — TranscribeEvent represents a calling.call.transcribe event.
