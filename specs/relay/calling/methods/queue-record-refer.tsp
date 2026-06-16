import "@signalwire/typespec-asyncapi";
import "../common.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.queue.enter
// ─────────────────────────────────────────────────────────────────────────────

model QueueEnterParams {
  ...CallAddress;

  /** Identifier used to control this queue placement. */
  control_id: string;

  /**
   * Name of the queue to place the call in. If it does not exist, a new queue is
   * created and the call becomes first in it.
   */
  queue_name: string;

  /** HTTP(S) URL to deliver RELAY queue event callbacks to. */
  status_url?: url;
}

model QueueEnterResult {
  ...RelayResult;

  /** Echo of the `control_id` supplied in the request. */
  control_id?: string;
}

/** Place the active call into a named queue. */
@rpcMethod("calling.queue.enter")
@summary("Place the call into a queue")
op queueEnter(...QueueEnterParams): QueueEnterResult;

// ─────────────────────────────────────────────────────────────────────────────
// calling.queue.leave
// ─────────────────────────────────────────────────────────────────────────────

model QueueLeaveParams {
  ...CallAddress;

  /** Identifier used to control this queue placement. */
  control_id: string;

  /** Name of the queue to remove the call from. */
  queue_name: string;

  /** ID of the queue to remove the call from. */
  queue_id?: string;

  /** HTTP(S) URL to deliver RELAY queue event callbacks to. */
  status_url?: url;
}

model QueueLeaveResult {
  ...RelayResult;

  /** Echo of the `control_id` supplied in the request. */
  control_id?: string;
}

/** Remove the active call from a queue. */
@rpcMethod("calling.queue.leave")
@summary("Remove the call from a queue")
op queueLeave(...QueueLeaveParams): QueueLeaveResult;

// ─────────────────────────────────────────────────────────────────────────────
// calling.record
//
// The wire shape keys the recording spec by subobject NAME (`record:{audio:{}}`)
// rather than a `type` discriminator, so `RecordSpec` is modeled faithfully as
// an object keyed by `audio` (the only documented variant). See openQuestions.
// ─────────────────────────────────────────────────────────────────────────────

/** Audio direction to capture in a recording. */
union RecordAudioDirection {
  /** What the call party hears. */
  "listen",

  /** What the call party says. */
  "speak",

  /** Both directions. */
  "both",
}

/** Audio-recording parameters (the `record.audio` subobject). */
model RecordAudio {
  /** Play a beep before recording starts. Default `false`. */
  beep?: boolean = false;

  /** Output file format. Default `mp3`. */
  format?: "mp3" | "wav" = "mp3";

  /** Record the two call directions on separate channels. Default `false`. */
  stereo?: boolean = false;

  /** Which audio direction(s) to capture. Default `speak`. */
  direction?: RecordAudioDirection = "speak";

  /**
   * Seconds to wait until something is heard before giving up. Disable with `0`.
   * Default `5.0`.
   */
  @minValue(0)
  initial_timeout?: float64 = 5.0;

  /**
   * Seconds of silence to wait after the call party stops speaking before ending
   * the recording. Disable with `0`. Default `1.0`.
   */
  @minValue(0)
  end_silence_timeout?: float64 = 1.0;

  /** DTMF digits that end the recording. Default `#*`. */
  terminators?: string = "#*";

  /**
   * Input sensitivity: `0` = hear nothing, `100` = hear everything. Default
   * `44`.
   */
  @minValue(0)
  @maxValue(100)
  input_sensitivity?: float64 = 44.0;
}

/**
 * Recording spec. Keyed by subobject name (`audio`) rather than a `type`
 * discriminator; only the `audio` variant is documented.
 */
model RecordSpec {
  /** Audio-recording parameters. */
  audio: RecordAudio;
}

model RecordParams {
  ...CallAddress;

  /** Identifier used to control active recordings. */
  control_id: string;

  /** The recording spec (subobject-keyed; only `audio` is documented). */
  record: RecordSpec;

  /** HTTP(S) URL to deliver RELAY recording event callbacks to. */
  status_url?: url;
}

model RecordResult {
  ...RelayResult;

  /** Echo of the `control_id` supplied in the request. */
  control_id?: string;

  /** URL of the resulting recording. */
  url?: url;
}

/** Record a call. Async-safe — may be executed multiple times in parallel. */
@rpcMethod("calling.record")
@summary("Record a call")
op recordCall(...RecordParams): RecordResult;

// ─────────────────────────────────────────────────────────────────────────────
// calling.record.pause
// ─────────────────────────────────────────────────────────────────────────────

/** How an active recording behaves while paused. */
union RecordPauseBehavior {
  /** Omit the paused span from the recording. */
  "skip",

  /** Include the paused span as silence in the recording. */
  "silence",
}

model RecordPauseParams {
  ...CallAddress;

  /** The `control_id` assigned in `calling.record`. */
  control_id: string;

  /** Behavior of the recording while paused. Default `skip`. */
  behavior?: RecordPauseBehavior = "skip";
}

model RecordPauseResult {
  ...RelayResult;

  /** Echo of the `control_id` supplied in the request. */
  control_id?: string;
}

/** Pause an active call recording. Async-safe. */
@rpcMethod("calling.record.pause")
@summary("Pause an active recording")
op recordPause(...RecordPauseParams): RecordPauseResult;

// ─────────────────────────────────────────────────────────────────────────────
// calling.record.resume
// ─────────────────────────────────────────────────────────────────────────────

model RecordResumeParams {
  ...CallAddress;

  /** The `control_id` assigned in `calling.record`. */
  control_id: string;
}

model RecordResumeResult {
  ...RelayResult;

  /** Echo of the `control_id` supplied in the request. */
  control_id?: string;
}

/** Resume a previously paused call recording. Async-safe. */
@rpcMethod("calling.record.resume")
@summary("Resume a paused recording")
op recordResume(...RecordResumeParams): RecordResumeResult;

// ─────────────────────────────────────────────────────────────────────────────
// calling.record.stop
// ─────────────────────────────────────────────────────────────────────────────

model RecordStopParams {
  ...CallAddress;

  /** The `control_id` assigned in `calling.record`. */
  control_id: string;
}

model RecordStopResult {
  ...RelayResult;

  /** Echo of the `control_id` supplied in the request. */
  control_id?: string;
}

/** Stop an active call recording. Async-safe. */
@rpcMethod("calling.record.stop")
@summary("Stop an active recording")
op recordStop(...RecordStopParams): RecordStopResult;

// ─────────────────────────────────────────────────────────────────────────────
// calling.refer
//
// SIP REFER transfer. `device` is a discriminated union but only the `sip`
// variant is valid, modeled as a `@discriminator("type")` base + variant.
// ─────────────────────────────────────────────────────────────────────────────

/** `sip` REFER device params. */
model ReferSipDeviceParams {
  /** SIP URI to transfer the call to (e.g. `userb@example.com`). */
  to: string;

  /** Username used to authenticate the REFER request. */
  username?: string;

  /** Password used to authenticate the REFER request. */
  password?: string;
}

/** Target device for a SIP REFER transfer. Discriminated on `type` (`sip` only). */
@discriminator("type")
model ReferDevice {
  type: string;
}

model ReferSipDevice extends ReferDevice {
  type: "sip";
  params: ReferSipDeviceParams;
}

model ReferParams {
  ...CallAddress;

  /** The device to transfer the call to (only `sip` is valid). */
  device: ReferDevice;

  /** HTTP(S) URL to POST refer events to. */
  status_url?: url;
}

model ReferResult {
  ...RelayResult;
}

/** Transfer a SIP call to an external SIP endpoint via SIP REFER. Async-safe. */
@rpcMethod("calling.refer")
@summary("Transfer a SIP call via SIP REFER")
op refer(...ReferParams): ReferResult;

// ─────────────────────────────────────────────────────────────────────────────
// calling.pass
// ─────────────────────────────────────────────────────────────────────────────

model PassParams {
  ...CallAddress;
}

model PassResult {
  ...RelayResult;
}

/**
 * Pass on a `calling.call.receive` offer so SignalWire offers the call to another
 * RELAY consumer.
 */
@rpcMethod("calling.pass")
@summary("Pass the call offer to another consumer")
op pass(...PassParams): PassResult;
