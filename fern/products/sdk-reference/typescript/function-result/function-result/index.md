---
slug: "/reference/typescript/function-result/function-result"
title: "FunctionResult"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "FunctionResult.FunctionResult"
  parent: "FunctionResult"
  module: "FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts"
---
# `FunctionResult`

Builder for SWAIG function responses.

Carries response text (what the AI says to the caller) and a list of structured
actions (connect, hangup, SMS, record, transfer, etc.) that the SignalWire platform
executes after the AI speaks. Every mutating method returns `this` for fluent chaining.

Return an instance (or a promise that resolves to one) from any SWAIG tool handler.

## Signature

```typescript
class FunctionResult
```

## Examples

**Example 1**

```typescript
agent.defineTool({
  name: 'say_hi',
  description: 'Say hello.',
  parameters: { type: 'object', properties: {} },
  handler: () => new FunctionResult('Hello there!'),
});
```

**Example 2**

```typescript
agent.defineTool({
  name: 'transfer_to_sales',
  description: 'Forward the caller to sales.',
  parameters: { type: 'object', properties: {} },
  handler: () =>
    new FunctionResult('Connecting you to sales now.').connect('+15551112222'),
});
```

**Example 3**

```typescript
new FunctionResult("Thanks, you're all set.")
  .sendSms({ toNumber: '+15551234567', fromNumber: '+15559998888', body: 'Confirmation!' })
  .hangup();
```

## See Also

- \- \[AgentBase.defineTool]\(/reference/typescript/agent-base/agent-base/define-tool) — where handlers return a \`FunctionResult\`
  \- \[DataMap]\(/reference/typescript/data-map) — alternative for purely data-driven (no handler) tools

## Properties

| Name          | Type                        | Required | Default | Description                                                     |
| ------------- | --------------------------- | -------- | ------- | --------------------------------------------------------------- |
| `action`      | `Record<string, unknown>[]` | yes      | —       | Ordered list of actions to execute after the response.          |
| `postProcess` | `boolean`                   | yes      | —       | Whether actions should be post-processed after the AI responds. |
| `response`    | `string`                    | yes      | —       | The text response returned to the AI agent.                     |

## Methods

- [`addAction`](/reference/typescript/function-result/function-result/add-action) — Append a single named action to the action list.
- [`addActions`](/reference/typescript/function-result/function-result/add-actions) — Append multiple action objects to the action list.
- [`addDynamicHints`](/reference/typescript/function-result/function-result/add-dynamic-hints) — Add dynamic speech recognition hints to improve transcription accuracy.
- [`clearDynamicHints`](/reference/typescript/function-result/function-result/clear-dynamic-hints) — Remove all previously added dynamic speech hints.
- [`connect`](/reference/typescript/function-result/function-result/connect) — Connect the call to another destination via SWML transfer.
- [`constructor`](/reference/typescript/function-result/function-result/constructor)
- [`createPaymentAction`](/reference/typescript/function-result/function-result/create-payment-action) — Create a payment action for use within a payment prompt.
- [`createPaymentParameter`](/reference/typescript/function-result/function-result/create-payment-parameter) — Create a custom payment parameter for the payment connector.
- [`createPaymentPrompt`](/reference/typescript/function-result/function-result/create-payment-prompt) — Create a payment prompt configuration object.
- [`enableExtensiveData`](/reference/typescript/function-result/function-result/enable-extensive-data) — Enable or disable extensive data reporting in function calls.
- [`enableFunctionsOnTimeout`](/reference/typescript/function-result/function-result/enable-functions-on-timeout) — Control whether functions fire on speaker timeout.
- [`executeRpc`](/reference/typescript/function-result/function-result/execute-rpc) — Execute a SignalWire RPC method via SWML.
- [`executeSwml`](/reference/typescript/function-result/function-result/execute-swml) — Execute arbitrary SWML content as an action.
- [`hangup`](/reference/typescript/function-result/function-result/hangup) — Hang up the call.
- [`hold`](/reference/typescript/function-result/function-result/hold) — Place the call on hold for a specified duration.
- [`joinConference`](/reference/typescript/function-result/function-result/join-conference) — Join a conference by name with optional configuration.
- [`joinRoom`](/reference/typescript/function-result/function-result/join-room) — Join a SignalWire room.
- [`pay`](/reference/typescript/function-result/function-result/pay) — Initiate a payment collection flow on the call.
- [`playBackgroundFile`](/reference/typescript/function-result/function-result/play-background-file) — Play an audio file in the background during the call.
- [`recordCall`](/reference/typescript/function-result/function-result/record-call) — Start recording the call.
- [`removeGlobalData`](/reference/typescript/function-result/function-result/remove-global-data) — Remove keys from the global data store.
- [`removeMetadata`](/reference/typescript/function-result/function-result/remove-metadata) — Remove metadata keys from the current call.
- [`replaceInHistory`](/reference/typescript/function-result/function-result/replace-in-history) — Replace the function call output in conversation history.
- [`rpcAiMessage`](/reference/typescript/function-result/function-result/rpc-ai-message) — Send an AI message to another call via RPC.
- [`rpcAiUnhold`](/reference/typescript/function-result/function-result/rpc-ai-unhold) — Unhold a call that was previously placed on hold via RPC.
- [`rpcDial`](/reference/typescript/function-result/function-result/rpc-dial) — Dial a number via RPC, optionally specifying device type.
- [`say`](/reference/typescript/function-result/function-result/say) — Speak text to the caller via TTS.
- [`sendSms`](/reference/typescript/function-result/function-result/send-sms) — Send an SMS or MMS message from within the call flow.
- [`setEndOfSpeechTimeout`](/reference/typescript/function-result/function-result/set-end-of-speech-timeout) — Set the silence duration that marks the end of a user's speech.
- [`setMetadata`](/reference/typescript/function-result/function-result/set-metadata) — Set metadata key-value pairs on the current call.
- [`setPostProcess`](/reference/typescript/function-result/function-result/set-post-process) — Enable or disable post-processing of actions.
- [`setResponse`](/reference/typescript/function-result/function-result/set-response) — Set the response text returned to the AI agent.
- [`setSpeechEventTimeout`](/reference/typescript/function-result/function-result/set-speech-event-timeout) — Set the timeout for speech event detection.
- [`simulateUserInput`](/reference/typescript/function-result/function-result/simulate-user-input) — Inject text as if the user had spoken it.
- [`sipRefer`](/reference/typescript/function-result/function-result/sip-refer) — Send a SIP REFER to transfer the call.
- [`stop`](/reference/typescript/function-result/function-result/stop) — Stop the AI session.
- [`stopBackgroundFile`](/reference/typescript/function-result/function-result/stop-background-file) — Stop any currently playing background audio file.
- [`stopRecordCall`](/reference/typescript/function-result/function-result/stop-record-call) — Stop an active call recording.
- [`stopTap`](/reference/typescript/function-result/function-result/stop-tap) — Stop an active media tap.
- [`switchContext`](/reference/typescript/function-result/function-result/switch-context) — Switch the AI context with optional new prompts and reset options.
- [`swmlChangeContext`](/reference/typescript/function-result/function-result/swml-change-context) — Change the current SWML context.
- [`swmlChangeStep`](/reference/typescript/function-result/function-result/swml-change-step) — Change the current SWML step.
- [`swmlTransfer`](/reference/typescript/function-result/function-result/swml-transfer) — Transfer the call to a SWML destination with a custom AI response.
- [`swmlUserEvent`](/reference/typescript/function-result/function-result/swml-user-event) — Emit a custom user event via SWML.
- [`tap`](/reference/typescript/function-result/function-result/tap) — Start a media tap to stream audio to an external URI.
- [`toDict`](/reference/typescript/function-result/function-result/to-dict) — Serialize this result to a plain object for the SWAIG response.
- [`toggleFunctions`](/reference/typescript/function-result/function-result/toggle-functions) — Enable or disable SWAIG functions by name.
- [`updateGlobalData`](/reference/typescript/function-result/function-result/update-global-data) — Merge key-value pairs into the global data store shared across functions.
- [`updateSettings`](/reference/typescript/function-result/function-result/update-settings) — Update AI engine settings at runtime.
- [`waitForUser`](/reference/typescript/function-result/function-result/wait-for-user) — Wait for user input before continuing.

## Source

[`src/FunctionResult.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts)

Line 76.
