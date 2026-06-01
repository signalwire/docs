---
slug: "/reference/cpp/signalwire/relay/call"
title: "Call"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::relay::Call"
  parent: "signalwire::relay"
  module: "signalwire.relay"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/call.hpp"
  visibility: "public"
---
# `Call`

Represents a live call with methods for call control. Uses shared internal state so the object can be copied/returned by value. All command methods send JSON-RPC requests through the RelayClient.

## Signature

```cpp
class signalwire::relay::Call
```

## Methods

- [`ai`](/reference/cpp/signalwire/relay/call/ai)
- [`answer`](/reference/cpp/signalwire/relay/call/answer)
- [`Call`](/reference/cpp/signalwire/relay/call/call)
- [`call_id`](/reference/cpp/signalwire/relay/call/call-id)
- [`collect`](/reference/cpp/signalwire/relay/call/collect)
- [`connect`](/reference/cpp/signalwire/relay/call/connect)
- [`detect`](/reference/cpp/signalwire/relay/call/detect)
- [`direction`](/reference/cpp/signalwire/relay/call/direction)
- [`disconnect`](/reference/cpp/signalwire/relay/call/disconnect)
- [`dispatch_event`](/reference/cpp/signalwire/relay/call/dispatch-event)
- [`execute_swml`](/reference/cpp/signalwire/relay/call/execute-swml)
- [`find_action`](/reference/cpp/signalwire/relay/call/find-action)
- [`from`](/reference/cpp/signalwire/relay/call/from)
- [`hangup`](/reference/cpp/signalwire/relay/call/hangup)
- [`hold`](/reference/cpp/signalwire/relay/call/hold)
- [`is_answered`](/reference/cpp/signalwire/relay/call/is-answered)
- [`is_ended`](/reference/cpp/signalwire/relay/call/is-ended)
- [`join_conference`](/reference/cpp/signalwire/relay/call/join-conference)
- [`join_room`](/reference/cpp/signalwire/relay/call/join-room)
- [`live_transcribe`](/reference/cpp/signalwire/relay/call/live-transcribe)
- [`live_translate`](/reference/cpp/signalwire/relay/call/live-translate)
- [`node_id`](/reference/cpp/signalwire/relay/call/node-id)
- [`on_event`](/reference/cpp/signalwire/relay/call/on-event)
- [`pay`](/reference/cpp/signalwire/relay/call/pay)
- [`play`](/reference/cpp/signalwire/relay/call/play)
- [`play_and_collect`](/reference/cpp/signalwire/relay/call/play-and-collect)
- [`prompt`](/reference/cpp/signalwire/relay/call/prompt)
- [`receive_fax`](/reference/cpp/signalwire/relay/call/receive-fax)
- [`record`](/reference/cpp/signalwire/relay/call/record)
- [`record_call`](/reference/cpp/signalwire/relay/call/record-call)
- [`register_action`](/reference/cpp/signalwire/relay/call/register-action)
- [`resolve_all_actions`](/reference/cpp/signalwire/relay/call/resolve-all-actions)
- [`send_digits`](/reference/cpp/signalwire/relay/call/send-digits)
- [`send_fax`](/reference/cpp/signalwire/relay/call/send-fax)
- [`set_client`](/reference/cpp/signalwire/relay/call/set-client)
- [`set_direction`](/reference/cpp/signalwire/relay/call/set-direction)
- [`set_from`](/reference/cpp/signalwire/relay/call/set-from)
- [`set_tag`](/reference/cpp/signalwire/relay/call/set-tag)
- [`set_to`](/reference/cpp/signalwire/relay/call/set-to)
- [`sip_refer`](/reference/cpp/signalwire/relay/call/sip-refer)
- [`state`](/reference/cpp/signalwire/relay/call/state)
- [`stop_tap`](/reference/cpp/signalwire/relay/call/stop-tap)
- [`stream`](/reference/cpp/signalwire/relay/call/stream)
- [`tag`](/reference/cpp/signalwire/relay/call/tag)
- [`tap`](/reference/cpp/signalwire/relay/call/tap)
- [`tap_audio`](/reference/cpp/signalwire/relay/call/tap-audio)
- [`to`](/reference/cpp/signalwire/relay/call/to)
- [`transcribe`](/reference/cpp/signalwire/relay/call/transcribe)
- [`transfer`](/reference/cpp/signalwire/relay/call/transfer)
- [`unhold`](/reference/cpp/signalwire/relay/call/unhold)
- [`unregister_action`](/reference/cpp/signalwire/relay/call/unregister-action)
- [`update_state`](/reference/cpp/signalwire/relay/call/update-state)
- [`wait_for_ended`](/reference/cpp/signalwire/relay/call/wait-for-ended)

## Source

[`include/signalwire/relay/call.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/call.hpp)

Line 31.
