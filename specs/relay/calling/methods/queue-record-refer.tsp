import "@signalwire/typespec-asyncapi";
import "../common.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.queue.enter
// ─────────────────────────────────────────────────────────────────────────────

model QueueEnterParams {
  ...CallAddress;

  /** Your own identifier for this queue placement. Reuse it to leave the queue later, and it comes back on queue events so you can correlate them. */
  control_id: string;

  /** Name of the queue to place the call in. If no queue by this name exists yet, one is created and the call joins it. */
  queue_name: string;

  /** HTTPS URL where SignalWire POSTs queue status updates as the call moves through the queue. */
  status_url?: url;
}

model QueueEnterResult {
  ...RelayResult;

  /** Echoes back the `control_id` you sent, so you can match this result to your request. */
  control_id?: string;
}

/** Places the active call into a named queue (creating the queue if it doesn't exist yet). Use it to hold callers while you wait for an agent or resource to free up. You get a result confirming entry, and the call's queue position, size, and wait estimate arrive as queue events keyed on your `control_id`. */
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

  /** The `control_id` you used when the call entered the queue. */
  control_id: string;

  /** Name of the queue to remove the call from. */
  queue_name: string;

  /** ID of the queue to remove the call from. The queue id is reported on queue events. */
  queue_id?: string;

  /** HTTPS URL where SignalWire POSTs queue status updates. */
  status_url?: url;
}

model QueueLeaveResult {
  ...RelayResult;

  /** Echoes back the `control_id` you sent, so you can match this result to your request. */
  control_id?: string;
}

/** Removes the active call from the queue it's waiting in. Use it to pull a caller out early, for example to hand them to an agent or end their wait. */
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

/** Which side of the conversation to capture in a recording. */
union RecordAudioDirection {
  /** Record what the remote party hears (audio sent to them). */
  "listen",

  /** Record what the remote party says (audio from them). */
  "speak",

  /** Record both sides of the conversation. */
  "both",
}

/** Audio recording settings, passed under `record.audio`. */
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

/** What to record. Audio is currently the only supported type — put its settings under `audio`. */
model RecordSpec {
  /** Audio recording settings. */
  audio: RecordAudio;
}

model RecordParams {
  ...CallAddress;

  /** Your own identifier for this recording. Use it to pause, resume, or stop the recording later, and it comes back on recording events so you can correlate them. */
  control_id: string;

  /** What to record. Currently audio is the only option — set its parameters under `audio`. */
  record: RecordSpec;

  /** HTTPS URL where SignalWire POSTs recording status updates. */
  status_url?: url;
}

model RecordResult {
  ...RelayResult;

  /** Echoes back the `control_id` you sent, so you can match this result to your request. */
  control_id?: string;

  /** URL of the finished recording. */
  url?: url;
}

/** Records the audio of an active call. The result confirms recording started and the recording's URL arrives on a recording event when it finishes. You can run several recordings on the same call at once — give each its own `control_id`. */
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

  /** The `control_id` you set when you started the recording with `calling.record`. */
  control_id: string;

  /** Whether the paused stretch is dropped from the recording (`skip`) or kept as silence (`silence`). Default `skip`. */
  behavior?: RecordPauseBehavior = "skip";
}

model RecordPauseResult {
  ...RelayResult;

  /** Echoes back the `control_id` you sent, so you can match this result to your request. */
  control_id?: string;
}

/** Pauses a recording you started with `calling.record`, identified by its `control_id`. Audio captured while paused is either dropped or kept as silence depending on `behavior`. Resume it later with `calling.record.resume`. */
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

  /** The `control_id` you set when you started the recording with `calling.record`. */
  control_id: string;
}

model RecordResumeResult {
  ...RelayResult;

  /** Echoes back the `control_id` you sent, so you can match this result to your request. */
  control_id?: string;
}

/** Resumes a recording you paused with `calling.record.pause`, identified by its `control_id`. Audio capture picks back up where it left off. */
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

  /** The `control_id` you set when you started the recording with `calling.record`. */
  control_id: string;
}

model RecordStopResult {
  ...RelayResult;

  /** Echoes back the `control_id` you sent, so you can match this result to your request. */
  control_id?: string;
}

/** Stops a recording you started with `calling.record`, identified by its `control_id`. Once stopped, the recording is finalized and its URL becomes available on the recording event. */
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

/** Where to send a SIP call when transferring it with `calling.refer`. */
model ReferSipDeviceParams {
  /** SIP URI to transfer the call to, for example `userb@example.com`. */
  to: string;

  /** Username for authenticating against the destination SIP endpoint, if it requires credentials. */
  username?: string;

  /** Password for authenticating against the destination SIP endpoint, if it requires credentials. */
  password?: string;
}

/** Where to transfer the call. Set `type` to `sip` and supply the SIP destination in `params`. */
@discriminator("type")
model ReferDevice {
  /** The transfer destination type. Only `sip` is supported. */
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

  /** Where to transfer the call. Only SIP destinations are supported (`type: "sip"`). */
  device: ReferDevice;

  /** HTTPS URL where SignalWire POSTs the outcome of the transfer. */
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
/** Transfers a SIP call to another SIP endpoint using a SIP REFER. Use it to hand the call off to an external destination without staying in the media path. The result confirms the refer was sent; the transfer's progress and final outcome arrive on a refer event. */
@rpcMethod("calling.refer")
@summary("Transfer a SIP call via SIP REFER")
op refer(...ReferParams): ReferResult | CallReferEvent;

// ─────────────────────────────────────────────────────────────────────────────
// calling.pass
// ─────────────────────────────────────────────────────────────────────────────

/** Identifies the inbound call offer you want to pass on. */
model PassParams {
  ...CallAddress;
}

/** Result of `calling.pass`. */
model PassResult {
  ...RelayResult;
}

/** Declines an inbound call offer (a `calling.call.receive` event) without answering it, returning the call to routing so SignalWire can offer it to another consumer. Use it when your app gets a call it shouldn't handle and you want someone else to pick it up. */
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
