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
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
    control_id: "queue-1",
    queue_name: "support",
    status_url: "https://example.com/queue-webhook",
  },
  returnType: #{ code: "200", message: "Entering Queue", control_id: "queue-1" },
})
op queueEnter(...QueueEnterParams): QueueEnterResult | CallQueueEvent;

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
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
    control_id: "queue-1",
    queue_name: "support",
    queue_id: "q-7f9d2e1c",
    status_url: "https://example.com/queue-webhook",
  },
  returnType: #{ code: "200", message: "Leaving Queue", control_id: "queue-1" },
})
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
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
    control_id: "record-1",
    record: #{
      audio: #{
        beep: false,
        format: "mp3",
        stereo: false,
        direction: "speak",
        initial_timeout: 5.0,
        end_silence_timeout: 1.0,
        terminators: "#*",
        input_sensitivity: 44.0,
      },
    },
    status_url: "https://example.com/recording-webhook",
  },
  returnType: #{
    code: "200",
    message: "Recording",
    control_id: "record-1",
    url: "https://example.com/recordings/record-1.mp3",
  },
})
op recordCall(...RecordParams): RecordResult | CallRecordEvent;

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
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
    control_id: "record-1",
    behavior: "silence",
  },
  returnType: #{ code: "200", message: "Pausing recording", control_id: "record-1" },
})
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
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
    control_id: "record-1",
  },
  returnType: #{ code: "200", message: "Recording", control_id: "record-1" },
})
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
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
    control_id: "record-1",
  },
  returnType: #{ code: "200", message: "Stopping recording", control_id: "record-1" },
})
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
  /** Device type discriminator. Only `sip` is valid. */
  type: string;
}

@example(#{ type: "sip", params: #{ to: "userb@example.com", username: "foo", password: "bar" } })
model ReferSipDevice extends ReferDevice {
  /** Always `sip`. */
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

/** Result of `calling.refer`. */
model ReferResult {
  ...RelayResult;
}

// NOTE: no @opExample here — `device: ReferDevice` is a REQUIRED @discriminator union,
// and TypeSpec value-checking does not narrow a discriminated base to its variant, so an
// inline frame example can't carry real `params`. The ReferSipDevice variant model carries
// a schema-level @example value instead.
/** Transfer a SIP call to an external SIP endpoint via SIP REFER. Async-safe. */
@rpcMethod("calling.refer")
@summary("Transfer a SIP call via SIP REFER")
op refer(...ReferParams): ReferResult | CallReferEvent;

// ─────────────────────────────────────────────────────────────────────────────
// calling.pass
// ─────────────────────────────────────────────────────────────────────────────

/** Parameters for `calling.pass` — identifies the call whose offer to pass on. */
model PassParams {
  ...CallAddress;
}

/** Result of `calling.pass`. */
model PassResult {
  ...RelayResult;
}

/**
 * Pass on a `calling.call.receive` offer so SignalWire offers the call to another
 * RELAY consumer.
 */
@rpcMethod("calling.pass")
@summary("Pass the call offer to another consumer")
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
  },
  returnType: #{ code: "200", message: "Passing call to another consumer" },
})
op pass(...PassParams): PassResult;
