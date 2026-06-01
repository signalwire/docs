---
slug: "/reference/dotnet/signal-wire.swaig/function-result"
title: "FunctionResult"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.SWAIG.FunctionResult"
  parent: "SignalWire.SWAIG"
  module: "SignalWire.SWAIG"
  visibility: "public"
---
# `FunctionResult`

Builds a SWAIG function result with an optional response, actions, and post-processing flag.
All action methods return <code>this</code> for fluent chaining.

## Signature

```dotnet
public class FunctionResult
```

## Methods

- [`AddAction`](/reference/dotnet/signal-wire.swaig/function-result/add-action) — Append an action with the given name and arbitrary data payload. Matches Python's `add_action(name, data)`.
- [`AddActions(IEnumerable<Dictionary<string, object>>)`](/reference/dotnet/signal-wire.swaig/function-result/add-actions-i-enumerable-dictionary-string-object)
- [`AddDynamicHints(List<object>)`](/reference/dotnet/signal-wire.swaig/function-result/add-dynamic-hints-list-object)
- [`ClearDynamicHints()`](/reference/dotnet/signal-wire.swaig/function-result/clear-dynamic-hints)
- [`Connect(string, bool, string?)`](/reference/dotnet/signal-wire.swaig/function-result/connect-string-bool-string)
- [`CreatePaymentAction(string, string, string, string)`](/reference/dotnet/signal-wire.swaig/function-result/create-payment-action-string-string-string-string)
- [`CreatePaymentParameter(string, string, Dictionary<string, object>?)`](/reference/dotnet/signal-wire.swaig/function-result/create-payment-parameter-string-string-dictionary-string-object)
- [`CreatePaymentPrompt(string, string, string)`](/reference/dotnet/signal-wire.swaig/function-result/create-payment-prompt-string-string-string)
- [`EnableExtensiveData(bool)`](/reference/dotnet/signal-wire.swaig/function-result/enable-extensive-data-bool)
- [`EnableFunctionsOnTimeout(bool)`](/reference/dotnet/signal-wire.swaig/function-result/enable-functions-on-timeout-bool)
- [`ExecuteRpc(string, Dictionary<string, object>?, string?, string?)`](/reference/dotnet/signal-wire.swaig/function-result/execute-rpc-string-dictionary-string-object-string-string)
- [`ExecuteSwml(object, bool)`](/reference/dotnet/signal-wire.swaig/function-result/execute-swml-object-bool) — Execute inline SWML. Accepts a dictionary or a JSON string. When <code class="paramref">transfer</code> is true, uses <code>transfer\_swml</code> instead of <code>SWML</code>.
- [`FunctionResult(string?, bool)`](/reference/dotnet/signal-wire.swaig/function-result/function-result-string-bool)
- [`Hangup()`](/reference/dotnet/signal-wire.swaig/function-result/hangup)
- [`Hold(int)`](/reference/dotnet/signal-wire.swaig/function-result/hold-int)
- [`JoinConference(string, bool, string, string)`](/reference/dotnet/signal-wire.swaig/function-result/join-conference-string-bool-string-string)
- [`JoinRoom(string)`](/reference/dotnet/signal-wire.swaig/function-result/join-room-string)
- [`Pay(string, string, string, int, int)`](/reference/dotnet/signal-wire.swaig/function-result/pay-string-string-string-int-int)
- [`PlayBackgroundFile(string, bool)`](/reference/dotnet/signal-wire.swaig/function-result/play-background-file-string-bool)
- [`RecordCall(string, bool, string, string)`](/reference/dotnet/signal-wire.swaig/function-result/record-call-string-bool-string-string)
- [`RemoveGlobalData(List<string>)`](/reference/dotnet/signal-wire.swaig/function-result/remove-global-data-list-string)
- [`RemoveMetadata(List<string>)`](/reference/dotnet/signal-wire.swaig/function-result/remove-metadata-list-string)
- [`ReplaceInHistory(object?)`](/reference/dotnet/signal-wire.swaig/function-result/replace-in-history-object) — Replace conversation history. Accepts `true` (default) for the summary placeholder or a string for custom replacement text. Matches Python's `replace_in_history(text: Union[bool, str] = True)`.
- [`RpcAiMessage(string, string, string?)`](/reference/dotnet/signal-wire.swaig/function-result/rpc-ai-message-string-string-string)
- [`RpcAiUnhold(string)`](/reference/dotnet/signal-wire.swaig/function-result/rpc-ai-unhold-string)
- [`RpcDial(string, string?, string?, string?)`](/reference/dotnet/signal-wire.swaig/function-result/rpc-dial-string-string-string-string)
- [`Say(string)`](/reference/dotnet/signal-wire.swaig/function-result/say-string)
- [`SendSms(string, string, string, List<string>?, List<string>?, string?)`](/reference/dotnet/signal-wire.swaig/function-result/send-sms-string-string-string-list-string-list-string-string)
- [`SetEndOfSpeechTimeout(int)`](/reference/dotnet/signal-wire.swaig/function-result/set-end-of-speech-timeout-int)
- [`SetMetadata(Dictionary<string, object>)`](/reference/dotnet/signal-wire.swaig/function-result/set-metadata-dictionary-string-object)
- [`SetPostProcess(bool)`](/reference/dotnet/signal-wire.swaig/function-result/set-post-process-bool)
- [`SetResponse(string)`](/reference/dotnet/signal-wire.swaig/function-result/set-response-string)
- [`SetSpeechEventTimeout(int)`](/reference/dotnet/signal-wire.swaig/function-result/set-speech-event-timeout-int)
- [`SimulateUserInput(string)`](/reference/dotnet/signal-wire.swaig/function-result/simulate-user-input-string)
- [`SipRefer(string)`](/reference/dotnet/signal-wire.swaig/function-result/sip-refer-string)
- [`Stop()`](/reference/dotnet/signal-wire.swaig/function-result/stop)
- [`StopBackgroundFile()`](/reference/dotnet/signal-wire.swaig/function-result/stop-background-file)
- [`StopRecordCall(string?)`](/reference/dotnet/signal-wire.swaig/function-result/stop-record-call-string)
- [`StopTap(string?)`](/reference/dotnet/signal-wire.swaig/function-result/stop-tap-string)
- [`SwitchContext(string?, string?, bool, bool, bool)`](/reference/dotnet/signal-wire.swaig/function-result/switch-context-string-string-bool-bool-bool)
- [`SwmlChangeContext(string)`](/reference/dotnet/signal-wire.swaig/function-result/swml-change-context-string)
- [`SwmlChangeStep(string)`](/reference/dotnet/signal-wire.swaig/function-result/swml-change-step-string)
- [`SwmlTransfer(string, string, bool)`](/reference/dotnet/signal-wire.swaig/function-result/swml-transfer-string-string-bool)
- [`SwmlUserEvent(Dictionary<string, object>)`](/reference/dotnet/signal-wire.swaig/function-result/swml-user-event-dictionary-string-object)
- [`Tap(string, string, string, string)`](/reference/dotnet/signal-wire.swaig/function-result/tap-string-string-string-string)
- [`ToDict()`](/reference/dotnet/signal-wire.swaig/function-result/to-dict) — Serialize to a dictionary. <code>response</code> is always present; <code>action</code> only if non-empty; <code>post\_process</code> only if true.
- [`ToggleFunctions(Dictionary<string, bool>)`](/reference/dotnet/signal-wire.swaig/function-result/toggle-functions-dictionary-string-bool)
- [`UpdateGlobalData(Dictionary<string, object>)`](/reference/dotnet/signal-wire.swaig/function-result/update-global-data-dictionary-string-object)
- [`UpdateSettings(Dictionary<string, object>)`](/reference/dotnet/signal-wire.swaig/function-result/update-settings-dictionary-string-object)
- [`WaitForUser(bool?, int?, bool)`](/reference/dotnet/signal-wire.swaig/function-result/wait-for-user-bool-int-bool)
