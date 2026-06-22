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
 * Speech-recognition engine to force for a collect. Must support the requested
 * `language`. Unset means SignalWire picks the engine.
 */
union CollectSpeechEngine {
  "Deepgram",
  "Google",
}

/** DTMF-digit collection settings. */
model CollectDigits {
  /** Maximum number of digits to collect. Positive integer. */
  @minValue(1)
  max: int32;

  /** Digits that terminate collection (e.g. `"#*"`). Default not set. */
  terminators?: string;

  /**
   * Maximum seconds to wait for the next digit after a digit is received.
   * Default `5.0`.
   */
  @minValueExclusive(0)
  digit_timeout?: float64 = 5.0;
}

/** Speech-recognition collection settings. */
model CollectSpeech {
  /** Silence (seconds) to wait for before declaring end of speech. Default `1`. */
  @minValueExclusive(0)
  end_silence_timeout?: float64 = 1.0;

  /** Maximum seconds to collect speech. Default `60`. */
  @minValueExclusive(0)
  speech_timeout?: float64 = 60.0;

  /** Language to detect. Default `en-US`. */
  language?: string = "en-US";

  /** Expected phrases to bias detection toward. Default not set. */
  hints?: string[];

  /** Force a specific speech-recognition engine. Default unset (auto-selected). */
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

  /** Identifier added to the created collect events. */
  control_id: string;

  /**
   * Seconds to wait for initial input. Used only when `start_input_timers: true`.
   * Default `4.0`.
   */
  @minValueExclusive(0)
  initial_timeout?: float64 = 4.0;

  /** Digit-collection settings. Required if `speech` is not set. */
  digits?: CollectDigits;

  /** Speech-collection settings. Required if `digits` is not set. */
  speech?: CollectSpeech;

  /** If true, partial-result events are fired. Default `false`. */
  partial_results?: boolean = false;

  /**
   * If true, utterances and digits are detected continuously until the collect is
   * stopped. Default `false`.
   */
  continuous?: boolean = false;

  /** If true, the `start_of_input` event is fired when input is detected. Default `false`. */
  send_start_of_input?: boolean = false;

  /** If true, the `initial_timeout` timer is started immediately. Default `false`. */
  start_input_timers?: boolean = false;

  /** HTTP(s) URL to POST collect events to. */
  status_url?: url;
}

model CollectResult {
  ...RelayResult;

  /** Echoes the `control_id` from the params. */
  control_id?: string;
}

/** Collect DTMF digits and/or speech from an active call. */
@rpcMethod("calling.collect")
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

  /** The `control_id` assigned in `calling.collect`. */
  control_id: string;
}

model CollectStopResult {
  ...RelayResult;
}

/** Stop an active collect. */
@rpcMethod("calling.collect.stop")
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

  /** The `control_id` assigned in `calling.collect`. */
  control_id: string;
}

model CollectStartInputTimersResult {
  ...RelayResult;
}

/**
 * Start the `initial_timeout` timer on an active collect — the companion call when
 * a collect was started with `start_input_timers: false`.
 */
@rpcMethod("calling.collect.start_input_timers")
@summary("Start the initial-timeout timer on a collect")
@opExample(#{
  parameters: #{ node_id: "a3e1b2c4-...", call_id: "c7f9d2e1-...", control_id: "collect-1" },
  returnType: #{ code: "200", message: "Starting input timers" },
})
op collectStartInputTimers(...CollectStartInputTimersParams): CollectStartInputTimersResult;

// ─────────────────────────────────────────────────────────────────────────────
// calling.play_and_collect (NOT async-safe)
// ─────────────────────────────────────────────────────────────────────────────

/** The `collect` block of `calling.play_and_collect`. At least one of `digits`/`speech`. */
model PlayAndCollectCollect {
  /** Seconds to wait for initial input. Default `4.0`. */
  @minValueExclusive(0)
  initial_timeout?: float64 = 4.0;

  /** Digit-collection settings. Required if `speech` is not set. */
  digits?: CollectDigits;

  /** Speech-collection settings. Required if `digits` is not set. */
  speech?: CollectSpeech;
}

model PlayAndCollectParams {
  ...CallAddress;

  /** Identifier added to the created play-and-collect events. */
  control_id: string;

  /**
   * Playback volume in dB, from `-40` (muted) to `+40`, where `0` is the original
   * audio. Follows the standard amplitude voltage gain factor: `10 ^ (value / 20)`.
   */
  @minValue(-40)
  @maxValue(40)
  volume?: float64;

  /** Media elements to play. */
  play: PlayMedia[];

  /** Collection settings applied while playing. */
  collect: PlayAndCollectCollect;

  /** HTTP(s) URL to POST play-and-collect events to. */
  status_url?: url;
}

model PlayAndCollectResult {
  ...RelayResult;

  /** Echoes the `control_id` from the params. */
  control_id?: string;
}

/**
 * Play media to a call and collect input. NOT async-safe. Only one execution at a
 * time per call.
 */
// NOTE: no @opExample here — the required `play: PlayMedia[]` is a @discriminator
// union, and TypeSpec example values cannot narrow a discriminator base.
@rpcMethod("calling.play_and_collect")
@summary("Play media and collect input")
op playAndCollect(...PlayAndCollectParams): PlayAndCollectResult | CallCollectEvent;

// ─────────────────────────────────────────────────────────────────────────────
// calling.play_and_collect.stop
// ─────────────────────────────────────────────────────────────────────────────

model PlayAndCollectStopParams {
  ...CallAddress;

  /** The `control_id` assigned in `calling.play_and_collect`. */
  control_id: string;
}

model PlayAndCollectStopResult {
  ...RelayResult;
}

/** Stop an active play-and-collect. */
@rpcMethod("calling.play_and_collect.stop")
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

  /** The `control_id` assigned in `calling.play_and_collect`. */
  control_id: string;

  /**
   * New playback volume in dB, from `-40` (muted) to `+40`, where `0` is the
   * original audio. Follows the standard amplitude voltage gain factor:
   * `10 ^ (value / 20)`.
   */
  @minValue(-40)
  @maxValue(40)
  volume: float64;
}

model PlayAndCollectVolumeResult {
  ...RelayResult;
}

/** Alter the volume of an active play-and-collect. */
@rpcMethod("calling.play_and_collect.volume")
@summary("Change play-and-collect volume")
@opExample(#{
  parameters: #{ node_id: "a3e1b2c4-...", call_id: "c7f9d2e1-...", control_id: "pc-1", volume: 3.0 },
  returnType: #{ code: "200", message: "Changed play and collect volume" },
})
op playAndCollectVolume(...PlayAndCollectVolumeParams): PlayAndCollectVolumeResult;
