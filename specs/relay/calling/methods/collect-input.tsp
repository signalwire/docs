import "@signalwire/typespec-asyncapi";
import "../common.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ═════════════════════════════════════════════════════════════════════════════
// Shared collect sub-objects (digits / speech)
//
// The same `digits` and `speech` shapes are used by `calling.collect` (top-level)
// and `calling.play_and_collect` (nested under `collect`). At least one of the
// two must be present.
// ═════════════════════════════════════════════════════════════════════════════

/**
 * Pins speech recognition to a specific engine for a collect. The engine you
 * choose must support the `language` you request. Leave it unset to let
 * SignalWire pick an engine for you.
 */
union CollectSpeechEngine {
  "Deepgram",
  "Google",
}

/** Settings that control how the caller's DTMF key presses are collected. */
model CollectDigits {
  /** Maximum number of digits to collect before collection finishes. Must be a positive integer. */
  @minValue(1)
  max: int32;

  /** Keys that end collection early when pressed, such as `"#*"`. Not set by default. */
  terminators?: string;

  /**
   * How long to wait, in seconds, for the next key press after one is received
   * before giving up. Defaults to `5.0`.
   */
  @minValueExclusive(0)
  digit_timeout?: float64 = 5.0;
}

/** Settings that control how the caller's speech is recognized and collected. */
model CollectSpeech {
  /**
   * How much silence, in seconds, to wait for before treating the caller as
   * finished speaking. Defaults to `1`.
   */
  @minValueExclusive(0)
  end_silence_timeout?: float64 = 1.0;

  /** Maximum time, in seconds, to spend collecting speech. Defaults to `60`. */
  @minValueExclusive(0)
  speech_timeout?: float64 = 60.0;

  /** Language to recognize, as a BCP-47 tag such as `en-US`. Defaults to `en-US`. */
  language?: string = "en-US";

  /** Words or phrases you expect to hear, used to bias recognition toward them. Not set by default. */
  hints?: string[];

  /** Pins recognition to a specific engine. Defaults to unset, which lets SignalWire choose. */
  engine?: CollectSpeechEngine;
}

// ═════════════════════════════════════════════════════════════════════════════
// Play media union (calling.play_and_collect `play[]`)
//
// Discriminated on `type`. Mirrors the Ringback shape but the `tts` variant
// additionally accepts a `voice` field.
// ═════════════════════════════════════════════════════════════════════════════

// The `PlayMedia` union (audio|tts|silence|ringtone) is defined in common.tsp —
// shared with `calling.play`.

// ─────────────────────────────────────────────────────────────────────────────
// calling.collect
// ─────────────────────────────────────────────────────────────────────────────

model CollectParams {
  ...CallAddress;

  /** Your own identifier for this collect. It is attached to every event the collect produces so you can match events back to this request. */
  control_id: string;

  /**
   * How long to wait, in seconds, for the caller to start giving input. This
   * timer only runs once it has been started — either at the outset when
   * `start_input_timers` is `true`, or later via `calling.collect.start_input_timers`.
   * Defaults to `4.0`.
   */
  @minValueExclusive(0)
  initial_timeout?: float64 = 4.0;

  /** How to collect DTMF key presses. Provide this, `speech`, or both; at least one is required. */
  digits?: CollectDigits;

  /** How to collect spoken input. Provide this, `digits`, or both; at least one is required. */
  speech?: CollectSpeech;

  /** When `true`, emit partial-result events as input comes in rather than only a final result. Defaults to `false`. */
  partial_results?: boolean = false;

  /**
   * When `true`, keep listening for speech and digits until you stop the collect
   * yourself, instead of finishing after the first complete input. Defaults to `false`.
   */
  continuous?: boolean = false;

  /** When `true`, fire a `start_of_input` event the moment the caller begins giving input. Defaults to `false`. */
  send_start_of_input?: boolean = false;

  /** When `true`, start the `initial_timeout` timer immediately. Set `false` to start it later with `calling.collect.start_input_timers`. Defaults to `false`. */
  start_input_timers?: boolean = false;

  /** HTTP or HTTPS URL that collect events are also POSTed to as they occur. */
  status_url?: url;
}

model CollectResult {
  ...RelayResult;

  /** Echoes back the `control_id` you supplied so you can correlate the response. */
  control_id?: string;
}

/**
 * Collects DTMF key presses, spoken input, or both from a caller on an active
 * call. Use it to gather menu selections, account numbers, or short voice
 * responses. The immediate response only confirms that collection started;
 * the collected input arrives asynchronously in `calling.call.collect` events
 * keyed on your `control_id`.
 */
@channel("calling.collect")
@summary("Collect digits and/or speech from a call")
@opExample(#{
  parameters: #{
    node_id: "a3e1b2c4-...",
    call_id: "c7f9d2e1-...",
    control_id: "collect-1",
    initial_timeout: 5.0,
    partial_results: false,
    continuous: false,
    send_start_of_input: true,
    start_input_timers: false,
    digits: #{ max: 4, terminators: "#*", digit_timeout: 1.0 },
    speech: #{
      end_silence_timeout: 1.0,
      speech_timeout: 5.0,
      language: "en-US",
      hints: #["sales", "support", "representative"],
    },
  },
  returnType: #{ code: "200", message: "Collecting", control_id: "collect-1" },
})
op collect(...CollectParams): CollectResult | CallCollectEvent;

// ─────────────────────────────────────────────────────────────────────────────
// calling.collect.stop
// ─────────────────────────────────────────────────────────────────────────────

model CollectStopParams {
  ...CallAddress;

  /** The `control_id` you gave to the `calling.collect` you want to stop. */
  control_id: string;
}

model CollectStopResult {
  ...RelayResult;
}

/** Stops a running collect before it finishes on its own, for example when you no longer need the caller's input. */
@channel("calling.collect.stop")
@summary("Stop an active collect")
@opExample(#{
  parameters: #{ node_id: "a3e1b2c4-...", call_id: "c7f9d2e1-...", control_id: "collect-1" },
  returnType: #{ code: "200", message: "Stopping collect" },
})
op collectStop(...CollectStopParams): CollectStopResult;

// ─────────────────────────────────────────────────────────────────────────────
// calling.collect.start_input_timers
// ─────────────────────────────────────────────────────────────────────────────

model CollectStartInputTimersParams {
  ...CallAddress;

  /** The `control_id` of the active `calling.collect` whose timer you want to start. */
  control_id: string;
}

model CollectStartInputTimersResult {
  ...RelayResult;
}

/**
 * Starts the `initial_timeout` countdown on a collect that was started with
 * `start_input_timers: false`. Use it to begin the wait for input on your own
 * schedule — for example, only after you have finished playing a prompt.
 */
@channel("calling.collect.start_input_timers")
@summary("Start the initial-timeout timer on a collect")
@opExample(#{
  parameters: #{ node_id: "a3e1b2c4-...", call_id: "c7f9d2e1-...", control_id: "collect-1" },
  returnType: #{ code: "200", message: "Starting input timers" },
})
op collectStartInputTimers(...CollectStartInputTimersParams): CollectStartInputTimersResult;

// ─────────────────────────────────────────────────────────────────────────────
// calling.play_and_collect (NOT async-safe)
// ─────────────────────────────────────────────────────────────────────────────

/** The `collect` settings for a `calling.play_and_collect`, describing what to listen for while the media plays. Provide `digits`, `speech`, or both. */
model PlayAndCollectCollect {
  /** How long to wait, in seconds, for the caller to start giving input. Defaults to `4.0`. */
  @minValueExclusive(0)
  initial_timeout?: float64 = 4.0;

  /** How to collect DTMF key presses. Provide this, `speech`, or both; at least one is required. */
  digits?: CollectDigits;

  /** How to collect spoken input. Provide this, `digits`, or both; at least one is required. */
  speech?: CollectSpeech;
}

model PlayAndCollectParams {
  ...CallAddress;

  /** Your own identifier for this play-and-collect. It is attached to every event it produces so you can match events back to this request. */
  control_id: string;

  /**
   * Playback volume in dB, from `-40` (muted) to `+40`, where `0` keeps the
   * original audio level. The value is applied as the standard amplitude gain
   * factor `10 ^ (value / 20)`.
   */
  @minValue(-40)
  @maxValue(40)
  volume?: float64;

  /** The media to play, in order — audio files, text-to-speech, silence, or ringtone. */
  play: PlayMedia[];

  /** What to listen for from the caller while the media plays. */
  collect: PlayAndCollectCollect;

  /** HTTP or HTTPS URL that play-and-collect events are also POSTed to as they occur. */
  status_url?: url;
}

model PlayAndCollectResult {
  ...RelayResult;

  /** Echoes back the `control_id` you supplied so you can correlate the response. */
  control_id?: string;
}

/**
 * Plays media to the caller and collects their input at the same time, so you
 * can prompt and gather a response in one step. Collected input arrives
 * asynchronously in `calling.call.collect` events keyed on your `control_id`.
 * Only one play-and-collect can run on a call at a time.
 */
// NOTE: no @opExample here — the required `play: PlayMedia[]` is a @discriminator
// union, and TypeSpec example values cannot narrow a discriminator base.
@channel("calling.play_and_collect")
@summary("Play media and collect input")
op playAndCollect(...PlayAndCollectParams): PlayAndCollectResult | CallCollectEvent;

// ─────────────────────────────────────────────────────────────────────────────
// calling.play_and_collect.stop
// ─────────────────────────────────────────────────────────────────────────────

model PlayAndCollectStopParams {
  ...CallAddress;

  /** The `control_id` you gave to the `calling.play_and_collect` you want to stop. */
  control_id: string;
}

model PlayAndCollectStopResult {
  ...RelayResult;
}

/** Stops a running play-and-collect, halting both the media playback and the input collection. */
@channel("calling.play_and_collect.stop")
@summary("Stop an active play-and-collect")
@opExample(#{
  parameters: #{ node_id: "a3e1b2c4-...", call_id: "c7f9d2e1-...", control_id: "pc-1" },
  returnType: #{ code: "200", message: "Stopping play and collect" },
})
op playAndCollectStop(...PlayAndCollectStopParams): PlayAndCollectStopResult;

// ─────────────────────────────────────────────────────────────────────────────
// calling.play_and_collect.volume
// ─────────────────────────────────────────────────────────────────────────────

model PlayAndCollectVolumeParams {
  ...CallAddress;

  /** The `control_id` of the active `calling.play_and_collect` whose volume you want to change. */
  control_id: string;

  /**
   * New playback volume in dB, from `-40` (muted) to `+40`, where `0` keeps the
   * original audio level. The value is applied as the standard amplitude gain
   * factor `10 ^ (value / 20)`.
   */
  @minValue(-40)
  @maxValue(40)
  volume: float64;
}

model PlayAndCollectVolumeResult {
  ...RelayResult;
}

/** Adjusts the playback volume of a running play-and-collect on the fly, without stopping it. */
@channel("calling.play_and_collect.volume")
@summary("Change play-and-collect volume")
@opExample(#{
  parameters: #{ node_id: "a3e1b2c4-...", call_id: "c7f9d2e1-...", control_id: "pc-1", volume: 3.0 },
  returnType: #{ code: "200", message: "Changed play and collect volume" },
})
op playAndCollectVolume(...PlayAndCollectVolumeParams): PlayAndCollectVolumeResult;
