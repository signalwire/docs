---
slug: "/reference/ruby/signal-wire/swaig/function-result"
title: "FunctionResult"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "class"
  language: "ruby"
  qualified_name: "SignalWire::Swaig::FunctionResult"
  parent: "SignalWire::Swaig"
  module: "SignalWire.Swaig"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swaig/function_result.rb"
  visibility: "public"
---
# `FunctionResult`

Response builder that tool handlers return.
All mutating methods return +self+ for fluent chaining.

result = FunctionResult.new("Found your order")
.update\_global\_data("order\_id" => "12345")
.say("Let me look that up")

The result object has three main components:

1. response     - Text the AI should say back to the user
2. action       - List of structured actions to execute
3. post\_process - Whether to let AI take another turn before executing actions

## Signature

```ruby
class FunctionResult < Object
```

## Inheritance

**Extends:** `Object`

## Methods

- [`action`](/reference/ruby/signal-wire/swaig/function-result/action) — Returns the value of attribute action.
- [`action=`](/reference/ruby/signal-wire/swaig/function-result/action__2) — Sets the attribute action
- [`add_action`](/reference/ruby/signal-wire/swaig/function-result/add-action) — Add a single structured action.
- [`add_actions`](/reference/ruby/signal-wire/swaig/function-result/add-actions) — Add multiple structured actions at once.
- [`add_dynamic_hints`](/reference/ruby/signal-wire/swaig/function-result/add-dynamic-hints) — Add dynamic speech recognition hints.
- [`clear_dynamic_hints`](/reference/ruby/signal-wire/swaig/function-result/clear-dynamic-hints) — Clear all dynamic speech recognition hints.
- [`connect`](/reference/ruby/signal-wire/swaig/function-result/connect) — Connect / transfer the call to another destination.
- [`create_payment_action`](/reference/ruby/signal-wire/swaig/function-result/create-payment-action) — Create a payment action for use inside payment prompts.
- [`create_payment_parameter`](/reference/ruby/signal-wire/swaig/function-result/create-payment-parameter) — Create a payment parameter for use with +pay+.
- [`create_payment_prompt`](/reference/ruby/signal-wire/swaig/function-result/create-payment-prompt) — Create a payment prompt structure for use with +pay+.
- [`enable_extensive_data`](/reference/ruby/signal-wire/swaig/function-result/enable-extensive-data) — Send full data to LLM for this turn only.
- [`enable_functions_on_timeout`](/reference/ruby/signal-wire/swaig/function-result/enable-functions-on-timeout) — Enable function calls on speaker timeout.
- [`execute_rpc`](/reference/ruby/signal-wire/swaig/function-result/execute-rpc) — Execute a generic RPC method via SWML.
- [`execute_swml`](/reference/ruby/signal-wire/swaig/function-result/execute-swml) — Execute SWML content with optional transfer.
- [`hangup`](/reference/ruby/signal-wire/swaig/function-result/hangup) — Terminate the call.
- [`hold`](/reference/ruby/signal-wire/swaig/function-result/hold) — Put the call on hold.
- [`initialize`](/reference/ruby/signal-wire/swaig/function-result/initialize)
- [`join_conference`](/reference/ruby/signal-wire/swaig/function-result/join-conference) — Join an ad-hoc audio conference via SWML.
- [`join_room`](/reference/ruby/signal-wire/swaig/function-result/join-room) — Join a RELAY room via SWML.
- [`pay`](/reference/ruby/signal-wire/swaig/function-result/pay) — Process payment using SWML pay action.
- [`play_background_file`](/reference/ruby/signal-wire/swaig/function-result/play-background-file) — Play audio/video file in the background.
- [`post_process`](/reference/ruby/signal-wire/swaig/function-result/post-process) — Returns the value of attribute post\_process.
- [`post_process=`](/reference/ruby/signal-wire/swaig/function-result/post-process__2) — Sets the attribute post\_process
- [`record_call`](/reference/ruby/signal-wire/swaig/function-result/record-call) — Start background call recording via SWML.
- [`remove_global_data`](/reference/ruby/signal-wire/swaig/function-result/remove-global-data) — Remove global agent data variables.
- [`remove_metadata`](/reference/ruby/signal-wire/swaig/function-result/remove-metadata) — Remove metadata from current function's scope.
- [`replace_in_history`](/reference/ruby/signal-wire/swaig/function-result/replace-in-history) — Replace the tool\_call + result pair in conversation history.
- [`response`](/reference/ruby/signal-wire/swaig/function-result/response) — Returns the value of attribute response.
- [`response=`](/reference/ruby/signal-wire/swaig/function-result/response__2) — Sets the attribute response
- [`rpc_ai_message`](/reference/ruby/signal-wire/swaig/function-result/rpc-ai-message) — Inject a message into an AI agent on another call.
- [`rpc_ai_unhold`](/reference/ruby/signal-wire/swaig/function-result/rpc-ai-unhold) — Unhold another call via RPC.
- [`rpc_dial`](/reference/ruby/signal-wire/swaig/function-result/rpc-dial) — Dial out to a number via RPC.
- [`say`](/reference/ruby/signal-wire/swaig/function-result/say) — Make the agent speak specific text.
- [`send_sms`](/reference/ruby/signal-wire/swaig/function-result/send-sms) — Send an SMS message via SWML.
- [`set_end_of_speech_timeout`](/reference/ruby/signal-wire/swaig/function-result/set-end-of-speech-timeout) — Adjust end-of-speech timeout.
- [`set_metadata`](/reference/ruby/signal-wire/swaig/function-result/set-metadata) — Set metadata scoped to current function's meta\_data\_token.
- [`set_post_process`](/reference/ruby/signal-wire/swaig/function-result/set-post-process) — Enable / disable post-processing.
- [`set_response`](/reference/ruby/signal-wire/swaig/function-result/set-response) — Set the natural-language response text.
- [`set_speech_event_timeout`](/reference/ruby/signal-wire/swaig/function-result/set-speech-event-timeout) — Adjust speech event timeout.
- [`simulate_user_input`](/reference/ruby/signal-wire/swaig/function-result/simulate-user-input) — Queue simulated user input.
- [`sip_refer`](/reference/ruby/signal-wire/swaig/function-result/sip-refer) — Send SIP REFER via SWML.
- [`stop`](/reference/ruby/signal-wire/swaig/function-result/stop) — Stop agent execution.
- [`stop_background_file`](/reference/ruby/signal-wire/swaig/function-result/stop-background-file) — Stop currently playing background file.
- [`stop_record_call`](/reference/ruby/signal-wire/swaig/function-result/stop-record-call) — Stop an active background call recording.
- [`stop_tap`](/reference/ruby/signal-wire/swaig/function-result/stop-tap) — Stop an active tap stream via SWML.
- [`switch_context`](/reference/ruby/signal-wire/swaig/function-result/switch-context) — Switch agent context/prompt during conversation.
- [`swml_change_context`](/reference/ruby/signal-wire/swaig/function-result/swml-change-context) — Change the conversation context.
- [`swml_change_step`](/reference/ruby/signal-wire/swaig/function-result/swml-change-step) — Change the conversation step.
- [`swml_transfer`](/reference/ruby/signal-wire/swaig/function-result/swml-transfer) — Transfer via SWML with an AI response when transfer completes.
- [`swml_user_event`](/reference/ruby/signal-wire/swaig/function-result/swml-user-event) — Send a user event through SWML.
- [`tap`](/reference/ruby/signal-wire/swaig/function-result/tap) — Start a background call tap via SWML.
- [`to_h`](/reference/ruby/signal-wire/swaig/function-result/to-h) — Convert to the Hash structure expected by SWAIG.
- [`to_json`](/reference/ruby/signal-wire/swaig/function-result/to-json)
- [`toggle_functions`](/reference/ruby/signal-wire/swaig/function-result/toggle-functions) — Enable / disable specific SWAIG functions.
- [`update_global_data`](/reference/ruby/signal-wire/swaig/function-result/update-global-data) — Update global agent data variables.
- [`update_settings`](/reference/ruby/signal-wire/swaig/function-result/update-settings) — Update agent runtime settings (temperature, top\_p, etc.).
- [`wait_for_user`](/reference/ruby/signal-wire/swaig/function-result/wait-for-user) — Control how the agent waits for user input.

## Source

[`lib/signalwire/swaig/function_result.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/swaig/function_result.rb)

Line 24.
