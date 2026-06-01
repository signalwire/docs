---
slug: "/reference/typescript/swml-builder/swml-builder"
title: "SwmlBuilder"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "SwmlBuilder.SwmlBuilder"
  parent: "SwmlBuilder"
  module: "SwmlBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlBuilder.ts"
---
# `SwmlBuilder`

Builds SWML documents composed of verb instructions organized into named sections.

Verb methods (`.answer()`, `.play()`, `.hangup()`, `.transfer()`, etc.) are
auto-installed from the bundled SWML schema and all return `this` for fluent chaining.

Most users don't instantiate `SwmlBuilder` directly — `AgentBase` uses it internally
and exposes higher-level helpers. Use this class directly for `SWMLService` (non-AI
call flows) or to hand-craft SWML returned from a route handler.

## Signature

```typescript
class SwmlBuilder
```

## Examples

```typescript
import { SwmlBuilder } from '@signalwire/sdk';

const swml = new SwmlBuilder()
  .answer()
  .play({ url: 'https://cdn.example.com/greeting.mp3' })
  .hangup()
  .build();

// swml is JSON ready to return from a SignalWire webhook.
```

## See Also

- \- \[SWMLService]\(/reference/typescript/swml-service) — HTTP service that serves a built SWML document
  \- \[AgentBase]\(/reference/typescript/agent-base) — for AI-driven call flows

## Properties

| Name       | Type                                                                       | Required | Default | Description                                                                                                                                                             |
| ---------- | -------------------------------------------------------------------------- | -------- | ------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `document` | `get document(): { sections: Record<string, unknown[]>; version: string }` | yes      | —       | Public read-only accessor for the underlying SWML document. Provides direct access to the document, equivalent to the Python SDK's `service` property on `SWMLBuilder`. |

## Methods

- [`addSection`](/reference/typescript/swml-builder/swml-builder/add-section) — Creates a new empty named section in the document. If the section already exists, this is a no-op. Matches Python SDK's `add_section(section_name)`.
- [`addVerb`](/reference/typescript/swml-builder/swml-builder/add-verb) — Appends a verb to the main section. Validates the verb config against the schema when validation is enabled.
- [`addVerbToSection`](/reference/typescript/swml-builder/swml-builder/add-verb-to-section) — Appends a verb to a named section, creating the section if it does not exist.
- [`ai`](/reference/typescript/swml-builder/swml-builder/ai) — Creates an AI agent that conducts voice conversations using automatic speech recognition (ASR), large language models (LLMs), and text-to-speech (TTS) synthesis. The agent processes caller speech in real-time, generates contextually appropriate responses, and can execute custom functions to interact with external systems through SignalWire AI Gateway (SWAIG).
- [`amazon_bedrock`](/reference/typescript/swml-builder/swml-builder/amazon-bedrock) — Creates a new Bedrock AI Agent
- [`answer`](/reference/typescript/swml-builder/swml-builder/answer) — Answer incoming call and set an optional maximum duration.
- [`build`](/reference/typescript/swml-builder/swml-builder/build) — Alias for [getDocument](/reference/typescript/swml-builder/swml-builder/get-document). Matches the Python SDK's `build()` method. Build and return the SWML document as a dictionary/object.
- [`cond`](/reference/typescript/swml-builder/swml-builder/cond) — Execute a sequence of instructions depending on the value of a JavaScript condition.
- [`connect`](/reference/typescript/swml-builder/swml-builder/connect) — Dial a SIP URI or phone number.
- [`constructor`](/reference/typescript/swml-builder/swml-builder/constructor) — Creates a new SwmlBuilder.
- [`denoise`](/reference/typescript/swml-builder/swml-builder/denoise) — Start noise reduction. You can stop it at any time using `stop_denoise`.
- [`detect_machine`](/reference/typescript/swml-builder/swml-builder/detect-machine) — A detection method that combines AMD (Answering Machine Detection) and fax detection. Detect whether the user on the other end of the call is a machine (fax, voicemail, etc.) or a human. The detection result(s) will be sent to the specified status\_url as a POST request and will also be saved in the detect\_result variable.
- [`enter_queue`](/reference/typescript/swml-builder/swml-builder/enter-queue) — Place the current call in a named queue where it will wait to be connected to an available agent or resource. While waiting, callers will hear music or custom audio. When an agent connects to the queue (using the connect method), the caller and agent are bridged together. After the bridge completes, execution continues with the SWML script specified in transfer\_after\_bridge.
- [`execute`](/reference/typescript/swml-builder/swml-builder/execute) — Execute a specified section or URL as a subroutine, and upon completion, return to the current document. Use the return statement to pass any return values or objects back to the current document.
- [`getDocument`](/reference/typescript/swml-builder/swml-builder/get-document) — Returns the raw SWML document object.
- [`getSchemaUtils`](/reference/typescript/swml-builder/swml-builder/get-schema-utils) — Get or create the shared SchemaUtils singleton. Exposed for use by the type generator and tests.
- [`goto`](/reference/typescript/swml-builder/swml-builder/goto) — Jump to a label within the current section, optionally based on a condition. The goto method will only navigate to a label within the same section.
- [`hangup`](/reference/typescript/swml-builder/swml-builder/hangup) — End the call with an optional reason.
- [`join_conference`](/reference/typescript/swml-builder/swml-builder/join-conference) — Join an ad-hoc audio conference started on either the SignalWire or Compatibility API. This method allows you to connect the current call to a named conference where multiple participants can communicate simultaneously.
- [`join_room`](/reference/typescript/swml-builder/swml-builder/join-room) — Join a RELAY room. If the room doesn't exist, it creates a new room.
- [`label`](/reference/typescript/swml-builder/swml-builder/label) — Mark any point of the SWML section with a label so that goto can jump to it.
- [`live_transcribe`](/reference/typescript/swml-builder/swml-builder/live-transcribe) — Start live transcription of the call. The transcription will be sent to the specified webhook URL.
- [`live_translate`](/reference/typescript/swml-builder/swml-builder/live-translate) — Start live translation of the call. The translation will be sent to the specified webhook URL.
- [`pay`](/reference/typescript/swml-builder/swml-builder/pay) — Enables secure payment processing during voice calls. When implemented, it manages the entire payment flow including data collection, validation, and processing through your configured payment gateway.
- [`play`](/reference/typescript/swml-builder/swml-builder/play) — Play file(s), ringtones, speech or silence.
- [`prompt`](/reference/typescript/swml-builder/swml-builder/prompt) — Play a prompt and wait for input. The input can be received either as digits from the keypad, or from speech, or both depending on what parameters are set. By default, only digit input is enabled. To enable speech input, set at least one speech parameter. To enable both digit and speech input, set at least one parameter for each.
- [`receive_fax`](/reference/typescript/swml-builder/swml-builder/receive-fax) — Receive a fax being delivered to this call.
- [`record`](/reference/typescript/swml-builder/swml-builder/record) — Record the call audio in the foreground, pausing further SWML execution until recording ends. Use this, for example, to record voicemails. To record calls in the background in a non-blocking fashion, use the record\_call method.
- [`record_call`](/reference/typescript/swml-builder/swml-builder/record-call) — Record call in the background. Unlike the record method, the record\_call method will start the recording and continue executing the SWML script while allowing the recording to happen in the background. To stop call recordings started with record\_call, use the stop\_record\_call method.
- [`render`](/reference/typescript/swml-builder/swml-builder/render) — Alias for [renderDocument](/reference/typescript/swml-builder/swml-builder/render-document). Matches the Python SDK's `render()` method. Build and render the SWML document as a JSON string.
- [`renderDocument`](/reference/typescript/swml-builder/swml-builder/render-document) — Serializes the SWML document to a JSON string.
- [`request`](/reference/typescript/swml-builder/swml-builder/request) — Send a GET, POST, PUT, or DELETE request to a remote URL.
- [`reset`](/reference/typescript/swml-builder/swml-builder/reset) — Resets the document to an empty SWML structure.
- [`return`](/reference/typescript/swml-builder/swml-builder/return) — Return a value from an execute call or exit the script. The value can be any type.
- [`say`](/reference/typescript/swml-builder/swml-builder/say) — Add a 'play' verb with say: prefix for text-to-speech. Convenience wrapper matching Python SDK's `say()` method.
- [`send_digits`](/reference/typescript/swml-builder/swml-builder/send-digits) — Send digit presses as DTMF tones.
- [`send_fax`](/reference/typescript/swml-builder/swml-builder/send-fax) — Send a fax.
- [`send_sms`](/reference/typescript/swml-builder/swml-builder/send-sms) — Send an outbound SMS or MMS message to a PSTN phone number.
- [`set`](/reference/typescript/swml-builder/swml-builder/set) — Set script variables to the specified values. Accepts an object mapping variable names to values. Variables set using set can be removed using unset.
- [`setValidation`](/reference/typescript/swml-builder/swml-builder/set-validation) — Enable or disable verb schema validation at runtime. Matches the Python `schema_validation` constructor parameter on AgentBase.
- [`sip_refer`](/reference/typescript/swml-builder/swml-builder/sip-refer) — Send SIP REFER to a SIP call.
- [`sleep`](/reference/typescript/swml-builder/swml-builder/sleep) — Pause execution for a specified duration.
- [`stop_denoise`](/reference/typescript/swml-builder/swml-builder/stop-denoise) — Stop noise reduction that was started with denoise.
- [`stop_record_call`](/reference/typescript/swml-builder/swml-builder/stop-record-call) — Stop an active background recording.
- [`stop_tap`](/reference/typescript/swml-builder/swml-builder/stop-tap) — Stop an active tap stream.
- [`switch`](/reference/typescript/swml-builder/swml-builder/switch) — Execute different instructions based on a variable's value.
- [`tap`](/reference/typescript/swml-builder/swml-builder/tap) — Start background call tap. Media is streamed over Websocket or RTP to customer controlled URI.
- [`transfer`](/reference/typescript/swml-builder/swml-builder/transfer) — Transfer the execution of the script to a different SWML section, URL, or Relay application. Once the transfer is complete, the script will continue executing SWML from the new location.
- [`unset`](/reference/typescript/swml-builder/swml-builder/unset) — Unset specified variables. The variables may have been set using the set method or as a byproduct of other statements or methods. Accepts a single variable name as a string or an array of variable names.
- [`user_event`](/reference/typescript/swml-builder/swml-builder/user-event) — Allows the user to set and send events to the connected client on the call. This is useful for triggering actions on the client side. Commonly used with the [browser-sdk](https://developer.signalwire.com/sdks/reference/browser-sdk/SignalWire%20Client/). The event object can be any valid JSON object. Any key-value pair in the object is sent to the client as an event type called `user_event`.

## Source

[`src/SwmlBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlBuilder.ts)

Line 58.
