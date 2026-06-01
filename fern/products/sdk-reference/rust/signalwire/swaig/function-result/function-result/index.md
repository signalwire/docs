---
slug: "/reference/rust/signalwire/swaig/function-result/function-result"
title: "FunctionResult"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::swaig::function_result::FunctionResult"
  parent: "signalwire::swaig::function_result"
  module: "swaig.function_result"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/swaig/function_result.rs"
  visibility: "public"
---
# `FunctionResult`

Result returned from a SWAIG function handler.

Serialises to `{"response": "...", "action": [...], "post_process": true}` where
`action` is omitted when empty and `post_process` is omitted when false.

## Signature

```rust
struct FunctionResult { /* fields */ }
```

## Inheritance

**Implements:** `Debug`, `Clone`, `Default`

## Methods

- [`add_action`](/reference/rust/signalwire/swaig/function-result/function-result/add-action)
- [`add_actions`](/reference/rust/signalwire/swaig/function-result/function-result/add-actions)
- [`add_dynamic_hints`](/reference/rust/signalwire/swaig/function-result/function-result/add-dynamic-hints)
- [`clear_dynamic_hints`](/reference/rust/signalwire/swaig/function-result/function-result/clear-dynamic-hints)
- [`clone`](/reference/rust/signalwire/swaig/function-result/function-result/clone)
- [`connect`](/reference/rust/signalwire/swaig/function-result/function-result/connect)
- [`create_payment_action`](/reference/rust/signalwire/swaig/function-result/function-result/create-payment-action)
- [`create_payment_parameter`](/reference/rust/signalwire/swaig/function-result/function-result/create-payment-parameter)
- [`create_payment_prompt`](/reference/rust/signalwire/swaig/function-result/function-result/create-payment-prompt)
- [`default`](/reference/rust/signalwire/swaig/function-result/function-result/default)
- [`enable_extensive_data`](/reference/rust/signalwire/swaig/function-result/function-result/enable-extensive-data)
- [`enable_functions_on_timeout`](/reference/rust/signalwire/swaig/function-result/function-result/enable-functions-on-timeout)
- [`execute_rpc`](/reference/rust/signalwire/swaig/function-result/function-result/execute-rpc)
- [`execute_swml`](/reference/rust/signalwire/swaig/function-result/function-result/execute-swml)
- [`fmt`](/reference/rust/signalwire/swaig/function-result/function-result/fmt)
- [`hangup`](/reference/rust/signalwire/swaig/function-result/function-result/hangup)
- [`hold`](/reference/rust/signalwire/swaig/function-result/function-result/hold)
- [`join_conference`](/reference/rust/signalwire/swaig/function-result/function-result/join-conference)
- [`join_room`](/reference/rust/signalwire/swaig/function-result/function-result/join-room)
- [`new`](/reference/rust/signalwire/swaig/function-result/function-result/new)
- [`pay`](/reference/rust/signalwire/swaig/function-result/function-result/pay)
- [`play_background_file`](/reference/rust/signalwire/swaig/function-result/function-result/play-background-file)
- [`record_call`](/reference/rust/signalwire/swaig/function-result/function-result/record-call)
- [`remove_global_data`](/reference/rust/signalwire/swaig/function-result/function-result/remove-global-data)
- [`remove_metadata`](/reference/rust/signalwire/swaig/function-result/function-result/remove-metadata)
- [`replace_in_history`](/reference/rust/signalwire/swaig/function-result/function-result/replace-in-history) — Replace conversation history. Pass `None` for text to use "summary".
- [`rpc_ai_message`](/reference/rust/signalwire/swaig/function-result/function-result/rpc-ai-message)
- [`rpc_ai_unhold`](/reference/rust/signalwire/swaig/function-result/function-result/rpc-ai-unhold)
- [`rpc_dial`](/reference/rust/signalwire/swaig/function-result/function-result/rpc-dial)
- [`say`](/reference/rust/signalwire/swaig/function-result/function-result/say)
- [`send_sms`](/reference/rust/signalwire/swaig/function-result/function-result/send-sms)
- [`set_end_of_speech_timeout`](/reference/rust/signalwire/swaig/function-result/function-result/set-end-of-speech-timeout)
- [`set_metadata`](/reference/rust/signalwire/swaig/function-result/function-result/set-metadata)
- [`set_post_process`](/reference/rust/signalwire/swaig/function-result/function-result/set-post-process)
- [`set_response`](/reference/rust/signalwire/swaig/function-result/function-result/set-response)
- [`set_speech_event_timeout`](/reference/rust/signalwire/swaig/function-result/function-result/set-speech-event-timeout)
- [`simulate_user_input`](/reference/rust/signalwire/swaig/function-result/function-result/simulate-user-input)
- [`sip_refer`](/reference/rust/signalwire/swaig/function-result/function-result/sip-refer)
- [`stop`](/reference/rust/signalwire/swaig/function-result/function-result/stop)
- [`stop_background_file`](/reference/rust/signalwire/swaig/function-result/function-result/stop-background-file)
- [`stop_record_call`](/reference/rust/signalwire/swaig/function-result/function-result/stop-record-call)
- [`stop_tap`](/reference/rust/signalwire/swaig/function-result/function-result/stop-tap)
- [`switch_context`](/reference/rust/signalwire/swaig/function-result/function-result/switch-context)
- [`swml_change_context`](/reference/rust/signalwire/swaig/function-result/function-result/swml-change-context)
- [`swml_change_step`](/reference/rust/signalwire/swaig/function-result/function-result/swml-change-step)
- [`swml_transfer`](/reference/rust/signalwire/swaig/function-result/function-result/swml-transfer)
- [`swml_user_event`](/reference/rust/signalwire/swaig/function-result/function-result/swml-user-event)
- [`tap`](/reference/rust/signalwire/swaig/function-result/function-result/tap)
- [`to_json`](/reference/rust/signalwire/swaig/function-result/function-result/to-json) — Compact JSON string.
- [`to_value`](/reference/rust/signalwire/swaig/function-result/function-result/to-value) — Serialise to a JSON value.
- [`toggle_functions`](/reference/rust/signalwire/swaig/function-result/function-result/toggle-functions)
- [`update_global_data`](/reference/rust/signalwire/swaig/function-result/function-result/update-global-data)
- [`update_settings`](/reference/rust/signalwire/swaig/function-result/function-result/update-settings)
- [`wait_for_user`](/reference/rust/signalwire/swaig/function-result/function-result/wait-for-user)
- [`with_response`](/reference/rust/signalwire/swaig/function-result/function-result/with-response)

## Source

[`src/swaig/function_result.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/swaig/function_result.rs)

Line 10.
