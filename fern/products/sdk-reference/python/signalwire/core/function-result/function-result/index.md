---
slug: "/reference/python/signalwire/core/function-result/function-result"
title: "FunctionResult"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.core.function_result.FunctionResult"
  parent: "signalwire.core.function_result"
  module: "signalwire.core.function_result"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py"
---
# `FunctionResult`

Wrapper around SWAIG function responses that handles proper formatting
of response text and actions.

The result object has three main components:

1. response: Text the AI should say back to the user
2. action: List of structured actions to execute
3. post\_process: Whether to let AI take another turn before executing actions

Post-processing behavior:

- post\_process=False (default): Execute actions immediately after AI response
- post\_process=True: Let AI respond to user one more time, then execute actions

This is useful for confirmation workflows like:
"I'll transfer you to sales. Do you have any other questions first?"
(AI can handle follow-up, then execute the transfer)

> \[!NOTE]
> return FunctionResult("Found your order")
>
> # With actions
>
> return (
> FunctionResult("I'll transfer you to support")
> .add\_action("transfer", {"dest": "support"})
> )
>
> # With simple action value
>
> return (
> FunctionResult("I'll confirm that")
> .add\_action("confirm", True)
> )
>
> # With multiple actions
>
> return (
> FunctionResult("Processing your request")
> .add\_actions(\[
> {"set\_global\_data": {"key": "value"}},
> {"play": {"url": "music.mp3"}}
> ])
> )
>
> # With post-processing enabled
>
> return (
> FunctionResult("Let me transfer you to billing", post\_process=True)
> .connect("+15551234567", final=True)
> )
>
> # Using the connect helper
>
> return (
> FunctionResult("I'll transfer you to our sales team now")
> .connect("sales@company.com", final=False, from\_addr="+15559876543")
> )

## Signature

```python
class FunctionResult
```

## Examples

```python
# With actions
return (
    FunctionResult("I'll transfer you to support")
    .add_action("transfer", {"dest": "support"})
)

# With simple action value
return (
    FunctionResult("I'll confirm that")
    .add_action("confirm", True)
)

# With multiple actions
return (
    FunctionResult("Processing your request")
    .add_actions([
        {"set_global_data": {"key": "value"}},
        {"play": {"url": "music.mp3"}}
    ])
)

# With post-processing enabled
return (
    FunctionResult("Let me transfer you to billing", post_process=True)
    .connect("+15551234567", final=True)
)

# Using the connect helper
return (
    FunctionResult("I'll transfer you to our sales team now")
    .connect("sales@company.com", final=False, from_addr="+15559876543")
)
```

## Properties

| Name           | Type                   | Required | Default | Description |
| -------------- | ---------------------- | -------- | ------- | ----------- |
| `action`       | `List[Dict[str, Any]]` | yes      | —       | —           |
| `post_process` | `post_process`         | yes      | —       | —           |
| `response`     | `response`             | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/core/function-result/function-result/init) — Initialize a new SWAIG function result
- [`add_action`](/reference/python/signalwire/core/function-result/function-result/add-action) — Add a structured action to the response
- [`add_actions`](/reference/python/signalwire/core/function-result/function-result/add-actions) — Add multiple structured actions to the response
- [`add_dynamic_hints`](/reference/python/signalwire/core/function-result/function-result/add-dynamic-hints) — Add dynamic speech recognition hints during a call.
- [`clear_dynamic_hints`](/reference/python/signalwire/core/function-result/function-result/clear-dynamic-hints) — Clear all dynamic speech recognition hints.
- [`connect`](/reference/python/signalwire/core/function-result/function-result/connect) — Add a connect action to transfer/connect the call to another destination.
- [`create_payment_action`](/reference/python/signalwire/core/function-result/function-result/create-payment-action) — Create a payment action for use in payment prompts.
- [`create_payment_parameter`](/reference/python/signalwire/core/function-result/function-result/create-payment-parameter) — Create a payment parameter for use with pay() method.
- [`create_payment_prompt`](/reference/python/signalwire/core/function-result/function-result/create-payment-prompt) — Create a payment prompt structure for use with pay() method.
- [`enable_extensive_data`](/reference/python/signalwire/core/function-result/function-result/enable-extensive-data) — Send full data to LLM for this turn only, then use smaller replacement in subsequent turns.
- [`enable_functions_on_timeout`](/reference/python/signalwire/core/function-result/function-result/enable-functions-on-timeout) — Enable function calls on speaker timeout.
- [`execute_rpc`](/reference/python/signalwire/core/function-result/function-result/execute-rpc) — Execute an RPC method on a call using SWML.
- [`execute_swml`](/reference/python/signalwire/core/function-result/function-result/execute-swml) — Execute SWML content with optional transfer behavior.
- [`hangup`](/reference/python/signalwire/core/function-result/function-result/hangup) — Terminate the call.
- [`hold`](/reference/python/signalwire/core/function-result/function-result/hold) — Put the call on hold with optional timeout.
- [`join_conference`](/reference/python/signalwire/core/function-result/function-result/join-conference) — Join an ad-hoc audio conference with RELAY and CXML calls using SWML.
- [`join_room`](/reference/python/signalwire/core/function-result/function-result/join-room) — Join a RELAY room using SWML.
- [`pay`](/reference/python/signalwire/core/function-result/function-result/pay) — Process payment using SWML pay action.
- [`play_background_file`](/reference/python/signalwire/core/function-result/function-result/play-background-file) — Play audio or video file in background.
- [`record_call`](/reference/python/signalwire/core/function-result/function-result/record-call) — Start background call recording using SWML.
- [`remove_global_data`](/reference/python/signalwire/core/function-result/function-result/remove-global-data) — Remove global agent data variables.
- [`remove_metadata`](/reference/python/signalwire/core/function-result/function-result/remove-metadata) — Remove metadata from current function's meta\_data\_token scope.
- [`replace_in_history`](/reference/python/signalwire/core/function-result/function-result/replace-in-history) — After first send, replace tool\_call+result pair in conversation history.
- [`rpc_ai_message`](/reference/python/signalwire/core/function-result/function-result/rpc-ai-message) — Inject a message into an AI agent on another call using execute\_rpc.
- [`rpc_ai_unhold`](/reference/python/signalwire/core/function-result/function-result/rpc-ai-unhold) — Unhold another call using execute\_rpc.
- [`rpc_dial`](/reference/python/signalwire/core/function-result/function-result/rpc-dial) — Dial out to a number with a destination SWML URL using execute\_rpc.
- [`say`](/reference/python/signalwire/core/function-result/function-result/say) — Make the agent speak specific text.
- [`send_sms`](/reference/python/signalwire/core/function-result/function-result/send-sms) — Send a text message to a PSTN phone number using SWML.
- [`set_end_of_speech_timeout`](/reference/python/signalwire/core/function-result/function-result/set-end-of-speech-timeout) — Adjust end of speech timeout - milliseconds of silence after speaking has been detected to finalize speech recognition.
- [`set_metadata`](/reference/python/signalwire/core/function-result/function-result/set-metadata) — Set metadata scoped to current function's meta\_data\_token.
- [`set_post_process`](/reference/python/signalwire/core/function-result/function-result/set-post-process) — Set whether to enable post-processing for this result.
- [`set_response`](/reference/python/signalwire/core/function-result/function-result/set-response) — Set the natural language response text
- [`set_speech_event_timeout`](/reference/python/signalwire/core/function-result/function-result/set-speech-event-timeout) — Adjust speech event timeout - milliseconds since last speech detection event to finalize recognition. Works better in noisy environments.
- [`simulate_user_input`](/reference/python/signalwire/core/function-result/function-result/simulate-user-input) — Queue simulated user input.
- [`sip_refer`](/reference/python/signalwire/core/function-result/function-result/sip-refer) — Send SIP REFER to a SIP call using SWML.
- [`stop`](/reference/python/signalwire/core/function-result/function-result/stop) — Stop the agent execution.
- [`stop_background_file`](/reference/python/signalwire/core/function-result/function-result/stop-background-file) — Stop currently playing background file.
- [`stop_record_call`](/reference/python/signalwire/core/function-result/function-result/stop-record-call) — Stop an active background call recording using SWML.
- [`stop_tap`](/reference/python/signalwire/core/function-result/function-result/stop-tap) — Stop an active tap stream using SWML.
- [`switch_context`](/reference/python/signalwire/core/function-result/function-result/switch-context) — Change agent context/prompt during conversation.
- [`swml_change_context`](/reference/python/signalwire/core/function-result/function-result/swml-change-context) — Force the conversation into a different context.
- [`swml_change_step`](/reference/python/signalwire/core/function-result/function-result/swml-change-step) — Force the conversation into a specific step in the current context.
- [`swml_transfer`](/reference/python/signalwire/core/function-result/function-result/swml-transfer) — Add a SWML transfer action with AI response setup for when transfer completes.
- [`swml_user_event`](/reference/python/signalwire/core/function-result/function-result/swml-user-event) — Send a user event through SWML to update the client UI.
- [`tap`](/reference/python/signalwire/core/function-result/function-result/tap) — Start background call tap using SWML.
- [`to_dict`](/reference/python/signalwire/core/function-result/function-result/to-dict) — Convert to the JSON structure expected by SWAIG
- [`toggle_functions`](/reference/python/signalwire/core/function-result/function-result/toggle-functions) — Enable/disable specific SWAIG functions.
- [`update_global_data`](/reference/python/signalwire/core/function-result/function-result/update-global-data) — Update global agent data variables.
- [`update_settings`](/reference/python/signalwire/core/function-result/function-result/update-settings) — Update agent runtime settings.
- [`wait_for_user`](/reference/python/signalwire/core/function-result/function-result/wait-for-user) — Control how agent waits for user input.

## Source

[`/src/signalwire/signalwire/core/function_result.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py)

Line 17.
