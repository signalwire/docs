---
slug: "/reference/java/com/signalwire/sdk/swaig/swaig/function-result"
title: "FunctionResult"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.swaig.FunctionResult"
  parent: "com.signalwire.sdk.swaig"
  module: "com.signalwire.sdk.swaig"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swaig/FunctionResult.java"
  visibility: "public"
---
# `FunctionResult`

SwaigFunctionResult - the response builder returned by tool handlers.

<p>
 Every method returns `this` for fluent chaining. Contains 40+ action methods
 covering call control, state management, media, speech/AI config, and advanced features.
 <p>
 Serialization rules:
 <ul>
   <li>response - always included (string)</li>
   <li>action - only included if at least one action exists (array of objects)</li>
   <li>post_process - only included if true and actions exist (boolean)</li>
 </ul>

## Signature

```java
public class FunctionResult
```

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/init)
- [`addAction`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/add-action) — Add a single action to the response.
- [`addActions`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/add-actions) — Add multiple actions.
- [`addDynamicHints`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/add-dynamic-hints)
- [`clearDynamicHints`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/clear-dynamic-hints)
- [`connect`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/connect) — Connect/transfer the call to another destination via SWML connect verb.
- [`createPaymentAction`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/create-payment-action)
- [`createPaymentParameter`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/create-payment-parameter)
- [`createPaymentPrompt`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/create-payment-prompt)
- [`enableExtensiveData`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/enable-extensive-data)
- [`enableFunctionsOnTimeout`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/enable-functions-on-timeout)
- [`executeRpc`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/execute-rpc) — Execute an RPC method via SWML.
- [`executeSwml`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/execute-swml) — Execute SWML content with optional transfer behavior.
- [`getActions`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/get-actions)
- [`getResponse`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/get-response)
- [`hangup`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/hangup) — Hangup the call.
- [`hold`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/hold) — Put the call on hold (timeout clamped 0-900).
- [`isPostProcess`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/is-post-process)
- [`joinConference`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/join-conference) — Join a conference via SWML.
- [`joinRoom`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/join-room) — Join a RELAY room.
- [`pay`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/pay) — Process payment via SWML pay action.
- [`playBackgroundFile`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/play-background-file) — Play audio file in background.
- [`recordCall`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/record-call) — Start background call recording via SWML.
- [`removeGlobalData`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/remove-global-data)
- [`removeMetadata`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/remove-metadata)
- [`replaceInHistory`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/replace-in-history) — Replace tool\_call+result pair in conversation history.
- [`rpcAiMessage`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/rpc-ai-message) — Inject a message into an AI agent on another call.
- [`rpcAiUnhold`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/rpc-ai-unhold) — Unhold another call.
- [`rpcDial`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/rpc-dial) — Dial out to a number with a destination SWML URL.
- [`say`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/say)
- [`sendSms`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/send-sms) — Send SMS via SWML.
- [`setEndOfSpeechTimeout`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/set-end-of-speech-timeout)
- [`setMetadata`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/set-metadata)
- [`setPostProcess`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/set-post-process)
- [`setResponse`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/set-response)
- [`setSpeechEventTimeout`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/set-speech-event-timeout)
- [`simulateUserInput`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/simulate-user-input) — Queue simulated user input.
- [`sipRefer`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/sip-refer) — Send SIP REFER.
- [`stop`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/stop) — Stop the agent execution.
- [`stopBackgroundFile`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/stop-background-file)
- [`stopRecordCall`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/stop-record-call) — Stop an active background call recording.
- [`stopTap`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/stop-tap) — Stop a tap stream.
- [`switchContext`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/switch-context) — Switch context with optional reset parameters.
- [`swmlChangeContext`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/swml-change-context) — Change the conversation context.
- [`swmlChangeStep`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/swml-change-step) — Change the conversation step.
- [`swmlTransfer`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/swml-transfer) — SWML transfer with AI response setup.
- [`swmlUserEvent`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/swml-user-event) — Send a user event through SWML.
- [`tap`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/tap) — Start call tap.
- [`toggleFunctions`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/toggle-functions) — Toggle specific SWAIG functions on/off.
- [`toJson`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/to-json) — Render as JSON string.
- [`toMap`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/to-map) — Convert to the Map structure expected by SWAIG.
- [`updateGlobalData`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/update-global-data)
- [`updateSettings`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/update-settings) — Update agent runtime settings (temperature, top\_p, etc.).
- [`waitForUser`](/reference/java/com/signalwire/sdk/swaig/swaig/function-result/wait-for-user) — Control how agent waits for user input.

## Source

[`src/main/java/com/signalwire/sdk/swaig/FunctionResult.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/swaig/FunctionResult.java)

Line 26.
