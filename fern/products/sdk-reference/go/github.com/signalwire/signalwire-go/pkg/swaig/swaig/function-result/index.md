---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result"
title: "FunctionResult"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swaig.FunctionResult"
  parent: "github.com/signalwire/signalwire-go/pkg/swaig"
  module: "github.com.signalwire.signalwire-go.pkg.swaig"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swaig/function_result.go"
---
# `FunctionResult`

FunctionResult represents the response from a SWAIG tool handler. It contains a text response, optional actions, and post-processing control. All mutating methods return \*FunctionResult for method chaining.

## Signature

```go
type FunctionResult struct
```

## Methods

- [`Actions`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/actions) — Actions returns the list of actions added to this result.
- [`AddAction`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/add-action) — AddAction appends a single named action to the result.
- [`AddActions`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/add-actions) — AddActions appends multiple actions to the result.
- [`AddDynamicHints`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/add-dynamic-hints) — AddDynamicHints adds dynamic speech recognition hints during a call.
- [`ClearDynamicHints`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/clear-dynamic-hints) — ClearDynamicHints removes all dynamic speech recognition hints.
- [`Connect`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/connect) — Connect adds a connect action to transfer/connect the call to another destination. If final is true, the call permanently transfers (exits the agent). If final is false, the call returns to the agent when the far end hangs up. The from parameter sets the caller ID; pass empty string to use the call's default.
- [`EnableExtensiveData`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/enable-extensive-data) — EnableExtensiveData sends full data to LLM for this turn only.
- [`EnableFunctionsOnTimeout`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/enable-functions-on-timeout) — EnableFunctionsOnTimeout enables or disables function calls on speaker timeout.
- [`ExecuteRpc`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/execute-rpc) — ExecuteRpc executes an RPC method on a call. Pass empty strings for callID and nodeID to omit them from the payload.
- [`ExecuteSwml`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/execute-swml) — ExecuteSwml executes SWML content. If transfer is true, the call exits the agent after execution. swmlContent can be a map\[string]any or a string (raw SWML JSON).
- [`Hangup`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/hangup) — Hangup terminates the call.
- [`Hold`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/hold) — Hold puts the call on hold with the given timeout in seconds. Timeout is clamped to the range \[0, 900].
- [`JoinConference`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/join-conference) — JoinConference joins an ad-hoc audio conference. Pass nil for opts to use default behavior (muted=false, beep="true", no holdAudio).
- [`JoinRoom`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/join-room) — JoinRoom joins a RELAY room for multi-party communication.
- [`Pay`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/pay) — Pay processes a payment using SWML pay action. connectorURL is the only required parameter. opts may be nil to use Python SDK defaults for all optional parameters.
- [`PlayBackgroundFile`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/play-background-file) — PlayBackgroundFile plays an audio or video file in the background. If wait is true, attention-getting behavior is suppressed during playback.
- [`PostProcess`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/post-process) — PostProcess returns whether post-processing is enabled.
- [`RecordCall`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/record-call) — RecordCall starts background call recording using SWML. controlID, stereo, format, and direction are the primary parameters. Use opts to specify additional optional parameters (pass nil to use defaults).
- [`RemoveGlobalData`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/remove-global-data) — RemoveGlobalData removes global agent data variables by key slice.
- [`RemoveGlobalDataKey`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/remove-global-data-key) — RemoveGlobalDataKey removes a single global agent data variable by key. This matches the Python SDK's Union\[str, List\[str]] behavior for a bare string argument, which emits the key as a string (not a one-element array) in the action payload.
- [`RemoveMetadata`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/remove-metadata) — RemoveMetadata removes metadata keys from the current function's scope.
- [`RemoveMetadataKey`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/remove-metadata-key) — RemoveMetadataKey removes a single metadata key from the current function's scope. This matches the Python SDK's Union\[str, List\[str]] behavior for a bare string argument, which emits the key as a string (not a one-element array) in the action payload.
- [`ReplaceInHistory`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/replace-in-history) — ReplaceInHistory replaces the tool call and result pair in conversation history. If text is a string, the tool call is replaced with an assistant message containing that text. If text is a bool and true, the pair is removed from history entirely.
- [`Response`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/response) — Response returns the natural language response text.
- [`RpcAiMessage`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/rpc-ai-message) — RpcAiMessage injects a message into an AI agent on another call. role defaults to "system" when empty, matching the Python SDK default. This matches the Python SDK's rpc\_ai\_message() which calls execute\_rpc(method="ai\_message", ...).
- [`RpcAiUnhold`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/rpc-ai-unhold) — RpcAiUnhold unholds another call. This matches the Python SDK's rpc\_ai\_unhold() which calls execute\_rpc(method="ai\_unhold", ...).
- [`RpcDial`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/rpc-dial) — RpcDial dials out to a number with a destination SWML URL using execute\_rpc. deviceType defaults to "phone" when empty. This matches the Python SDK's rpc\_dial() which calls execute\_rpc(method="dial", ...).
- [`Say`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/say) — Say makes the agent speak specific text.
- [`SendSms`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/send-sms) — SendSms sends a text message to a PSTN phone number. Pass empty string for body if only sending media, nil for optional slices, and empty string for region to omit it.
- [`SetEndOfSpeechTimeout`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/set-end-of-speech-timeout) — SetEndOfSpeechTimeout adjusts the end-of-speech timeout in milliseconds.
- [`SetMetadata`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/set-metadata) — SetMetadata sets metadata scoped to the current function's meta\_data\_token.
- [`SetPostProcess`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/set-post-process) — SetPostProcess controls whether the AI takes another turn before executing actions.
- [`SetResponse`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/set-response) — SetResponse sets the natural language response text.
- [`SetSpeechEventTimeout`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/set-speech-event-timeout) — SetSpeechEventTimeout adjusts the speech event timeout in milliseconds.
- [`SimulateUserInput`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/simulate-user-input) — SimulateUserInput queues simulated user input text. Emits action key "user\_input" matching the Python SDK's add\_action("user\_input", text).
- [`SipRefer`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/sip-refer) — SipRefer sends a SIP REFER for call transfer in SIP environments.
- [`Stop`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/stop) — Stop stops the agent execution.
- [`StopBackgroundFile`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/stop-background-file) — StopBackgroundFile stops the currently playing background file.
- [`StopRecordCall`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/stop-record-call) — StopRecordCall stops an active background call recording.
- [`StopTap`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/stop-tap) — StopTap stops an active tap stream.
- [`String`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/string) — String returns a human-readable representation including the response and action count.
- [`SwitchContext`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/switch-context) — SwitchContext changes the agent context/prompt during conversation. Only non-empty/true fields are included in the action.
- [`SwmlChangeContext`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/swml-change-context) — SwmlChangeContext transitions to a different conversation context. Emits action key "change\_context" with the context name as a plain string value, matching the Python SDK's add\_action("change\_context", context\_name).
- [`SwmlChangeStep`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/swml-change-step) — SwmlChangeStep transitions to a different conversation step. Emits action key "change\_step" with the step name as a plain string value, matching the Python SDK's add\_action("change\_step", step\_name).
- [`SwmlTransfer`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/swml-transfer) — SwmlTransfer adds a SWML transfer action with an AI response for when control returns.
- [`SwmlUserEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/swml-user-event) — SwmlUserEvent sends a user event through SWML for real-time UI updates.
- [`Tap`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/tap) — Tap starts background call tapping, streaming media to the given URI. rtpPtime sets the packetization time in milliseconds for RTP streams (0 = use default of 20ms). Pass empty string for statusURL to omit it.
- [`ToggleFunctions`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/toggle-functions) — ToggleFunctions enables or disables specific SWAIG functions. Each toggle should have "function" and "active" keys.
- [`ToMap`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/to-map) — ToMap serializes the FunctionResult to a map suitable for JSON encoding. The "action" key is only included if there are actions. The "post\_process" key is only included if true.
- [`UpdateGlobalData`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/update-global-data) — UpdateGlobalData sets or updates global agent data variables.
- [`UpdateSettings`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/update-settings) — UpdateSettings updates agent runtime settings such as temperature, top\_p, etc.
- [`WaitForUser`](/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/wait-for-user) — WaitForUser controls how the agent waits for user input. Pass nil for enabled/timeout to omit those fields. If answerFirst is true, the value is set to "answer\_first" regardless of other parameters.

## Source

[`pkg/swaig/function_result.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swaig/function_result.go)

Line 17.
