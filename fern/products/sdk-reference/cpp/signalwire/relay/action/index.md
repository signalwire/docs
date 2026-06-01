---
slug: "/reference/cpp/signalwire/relay/action"
title: "Action"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::relay::Action"
  parent: "signalwire::relay"
  module: "signalwire.relay"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/action.hpp"
  visibility: "public"
---
# `Action`

Represents a controllable in-progress operation (play, record, collect, etc.) Uses shared internal state so the object can be copied/moved freely while maintaining a single underlying condition\_variable for synchronization.

## Signature

```cpp
class signalwire::relay::Action
```

## Methods

- [`Action`](/reference/cpp/signalwire/relay/action/action)
- [`call_id`](/reference/cpp/signalwire/relay/action/call-id)
- [`completed`](/reference/cpp/signalwire/relay/action/completed)
- [`control_id`](/reference/cpp/signalwire/relay/action/control-id)
- [`event_type_filter`](/reference/cpp/signalwire/relay/action/event-type-filter)
- [`event_type_matches`](/reference/cpp/signalwire/relay/action/event-type-matches)
- [`method_prefix`](/reference/cpp/signalwire/relay/action/method-prefix) — Method prefix used for sub-command frames (stop/pause/resume/...). Defaults to "calling.play"; set explicitly when an Action is built for a different verb (record, collect, detect, ...). The Call::execute\_action factory plumbs this through.
- [`node_id`](/reference/cpp/signalwire/relay/action/node-id)
- [`on_completed`](/reference/cpp/signalwire/relay/action/on-completed) — Set a callback to fire when the action completes.
- [`pause`](/reference/cpp/signalwire/relay/action/pause) — Request the server to pause this action. extra\_params may carry e.g. {"behavior": "continuous"} for record-side pause.
- [`resolve`](/reference/cpp/signalwire/relay/action/resolve) — Resolve the action immediately (used for call-gone scenarios).
- [`resolve_on_detect`](/reference/cpp/signalwire/relay/action/resolve-on-detect)
- [`resolve_on_result`](/reference/cpp/signalwire/relay/action/resolve-on-result)
- [`result`](/reference/cpp/signalwire/relay/action/result)
- [`resume`](/reference/cpp/signalwire/relay/action/resume) — Request the server to resume this action.
- [`set_event_type_filter`](/reference/cpp/signalwire/relay/action/set-event-type-filter) — Set the wire-event types the Action should accept state updates from. Empty (the default) means "match any component event whose control\_id matches this Action". Used by play\_and\_collect to listen on calling.call.collect only — a calling.call.play(finished) must NOT resolve a play\_and\_collect action.
- [`set_method_prefix`](/reference/cpp/signalwire/relay/action/set-method-prefix)
- [`set_resolve_on_detect`](/reference/cpp/signalwire/relay/action/set-resolve-on-detect) — Detect actions resolve on the first event carrying a detect payload, not on a state(finished) — see Python's DetectAction. When this flag is set the action's update\_state path resolves only when params.detect is present.
- [`set_resolve_on_result`](/reference/cpp/signalwire/relay/action/set-resolve-on-result) — Collect actions resolve when an event carries a result payload. A play(finished) earlier in the timeline does NOT resolve a CollectAction — see Python's CollectAction terminal-event logic.
- [`start_input_timers`](/reference/cpp/signalwire/relay/action/start-input-timers) — Start the inter-digit / final-digit timers on a collect. The matching Python method is StandaloneCollectAction.start\_input\_timers.
- [`state`](/reference/cpp/signalwire/relay/action/state)
- [`stop`](/reference/cpp/signalwire/relay/action/stop) — Request the server to stop this action. Routes to \<method\_prefix>.stop so an Action returned by record() sends calling.record.stop rather than calling.play.stop.
- [`update_state`](/reference/cpp/signalwire/relay/action/update-state) — Update internal state (called by Call/Client when events arrive).
- [`volume`](/reference/cpp/signalwire/relay/action/volume) — Adjust playback volume (play only). The frame body carries the supplied amount in dB; positive boosts, negative attenuates.
- [`wait`](/reference/cpp/signalwire/relay/action/wait) — Block until the action completes or times out.

## Type Aliases

- [`CompletedCallback`](/reference/cpp/signalwire/relay/action/completed-callback)

## Source

[`include/signalwire/relay/action.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/action.hpp)

Line 23.
