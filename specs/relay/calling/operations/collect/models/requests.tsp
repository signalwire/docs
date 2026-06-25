import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ═════════════════════════════════════════════════════════════════════════════
// Shared collect sub-objects (digits / speech)
//
// The same `digits` and `speech` shapes are used by `calling.collect` (top-level)
// and `calling.play_and_collect` (nested under `collect`). At least one of the
// two must be present.
// ═════════════════════════════════════════════════════════════════════════════

@doc("""
  Pins speech recognition to a specific engine for a collect. The engine you
  choose must support the `language` you request. Leave it unset to let
  SignalWire pick an engine for you.
  """)
union CollectSpeechEngine {
  "Deepgram",
  "Google",
}

@doc("Settings that control how the caller's DTMF key presses are collected.")
model CollectDigits {
  @doc("Maximum number of digits to collect before collection finishes. Must be a positive integer.")
  @minValue(1)
  max: int32;

  @doc("Keys that end collection early when pressed, such as `\"#*\"`. Not set by default.")
  terminators?: string;

  @doc("""
    How long to wait, in seconds, for the next key press after one is received
    before giving up. Defaults to `5.0`.
    """)
  @minValueExclusive(0)
  digit_timeout?: float64 = 5.0;
}

@doc("Settings that control how the caller's speech is recognized and collected.")
model CollectSpeech {
  @doc("""
    How much silence, in seconds, to wait for before treating the caller as
    finished speaking. Defaults to `1`.
    """)
  @minValueExclusive(0)
  end_silence_timeout?: float64 = 1.0;

  @doc("Maximum time, in seconds, to spend collecting speech. Defaults to `60`.")
  @minValueExclusive(0)
  speech_timeout?: float64 = 60.0;

  @doc("Language to recognize, as a BCP-47 tag such as `en-US`. Defaults to `en-US`.")
  language?: string = "en-US";

  @doc("Words or phrases you expect to hear, used to bias recognition toward them. Not set by default.")
  hints?: string[];

  @doc("Pins recognition to a specific engine. Defaults to unset, which lets SignalWire choose.")
  engine?: CollectSpeechEngine;
}

model CollectParams {
  ...CallAddress;

  @doc("Your own identifier for this collect. It is attached to every event the collect produces so you can match events back to this request.")
  control_id: string;

  @doc("""
    How long to wait, in seconds, for the caller to start giving input. This
    timer only runs once it has been started — either at the outset when
    `start_input_timers` is `true`, or later via `calling.collect.start_input_timers`.
    Defaults to `4.0`.
    """)
  @minValueExclusive(0)
  initial_timeout?: float64 = 4.0;

  @doc("How to collect DTMF key presses. Provide this, `speech`, or both; at least one is required.")
  digits?: CollectDigits;

  @doc("How to collect spoken input. Provide this, `digits`, or both; at least one is required.")
  speech?: CollectSpeech;

  @doc("When `true`, emit partial-result events as input comes in rather than only a final result. Defaults to `false`.")
  partial_results?: boolean = false;

  @doc("""
    When `true`, keep listening for speech and digits until you stop the collect
    yourself, instead of finishing after the first complete input. Defaults to `false`.
    """)
  continuous?: boolean = false;

  @doc("When `true`, fire a `start_of_input` event the moment the caller begins giving input. Defaults to `false`.")
  send_start_of_input?: boolean = false;

  @doc("When `true`, start the `initial_timeout` timer immediately. Set `false` to start it later with `calling.collect.start_input_timers`. Defaults to `false`.")
  start_input_timers?: boolean = false;

  @doc("HTTP or HTTPS URL that collect events are also POSTed to as they occur.")
  status_url?: url;
}

model CollectStopParams {
  ...CallAddress;

  @doc("The `control_id` you gave to the `calling.collect` you want to stop.")
  control_id: string;
}

model CollectStartInputTimersParams {
  ...CallAddress;

  @doc("The `control_id` of the active `calling.collect` whose timer you want to start.")
  control_id: string;
}
