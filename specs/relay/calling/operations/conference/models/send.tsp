import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";
import "../../../models/devices.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("Controls whether a beep plays as participants enter or leave the conference. Use `\"true\"` for both, `\"onEnter\"` or `\"onExit\"` to limit it to one direction, or `\"false\"` to disable. Note these are strings, not booleans.")
union ConferenceBeep {
  "true",
  "false",
  "onEnter",
  "onExit",
}

@doc("Whether the conference is recorded. Use `\"record-from-start\"` to begin recording as soon as the conference starts, or `\"do-not-record\"` to skip recording.")
union ConferenceRecord {
  "do-not-record",
  "record-from-start",
}

@doc("The geographic region where the conference media is hosted. Choose the region closest to your participants to reduce latency.")
union ConferenceRegion {
  "global",
  "us",
  "eu",
  "ch",
}

@doc("Whether leading and trailing silence is trimmed from the conference recording.")
union ConferenceTrim {
  "trim-silence",
  "do-not-trim",
}

@doc("The payload format for a conference status callback. Use `\"relay\"` for SignalWire's native event format, or `\"cxml\"` / `\"laml\"` for the cXML-compatible format.")
union ConferenceCallbackEventType {
  "relay",
  "cxml",
  "laml",
}

@doc("The HTTP method used to deliver a conference status callback to your URL.")
union ConferenceCallbackMethod {
  "GET",
  "POST",
}

@doc("Controls who can access the conference recording: `private` or `public-read`.")
union ConferenceAcl {
  "private",
  "public-read",
}

model JoinConferenceParams {
  ...CallAddress;

  @doc("The name of the conference to join. If a conference with this name does not exist yet, it is created.")
  @example("my_conference")
  name: string;

  @doc("Join the conference with this participant muted. Defaults to `false`.")
  @example(false)
  muted?: boolean = false;

  @doc("Whether a beep plays as participants enter or leave. Defaults to `true`.")
  @example("onEnter")
  beep?: ConferenceBeep;

  @doc("Whether the conference starts when this participant enters. Defaults to `true`.")
  @example(true)
  start_on_enter?: boolean = true;

  @doc("Whether the conference ends for everyone when this participant leaves. Defaults to `false`.")
  @example(false)
  end_on_exit?: boolean = false;

  @doc("A URL to cXML, or to an mp3/wav file, to play while this participant waits for the conference to start. Defaults to hold music.")
  @example("https://example.com/hold.mp3")
  wait_url?: url;

  @doc("The maximum number of participants allowed in the conference, up to 250. Defaults to `250`.")
  @minValueExclusive(0)
  @maxValue(250)
  @example(3)
  max_participants?: int32;

  @doc("Whether and when to record the conference. Defaults to `do-not-record`.")
  @example("record-from-start")
  record?: ConferenceRecord;

  @doc("The region where the conference media is hosted. Defaults to `global`.")
  @example("eu")
  region?: ConferenceRegion;

  @doc("Whether to trim silence from the recording. Defaults to `trim-silence`.")
  @example("do-not-trim")
  trim?: ConferenceTrim;

  @doc("Controls who can access the conference recording: `private` or `public-read`.")
  @example("private")
  acl?: ConferenceAcl;

  @doc("The `call_id` (UUID) of the participant being coached. A coach can be heard only by the call being coached, not by the rest of the conference. Not set by default.")
  @example("c2a1e9f4-6b3d-4e7a-8f1c-2d3e4f5a6b7c")
  coach?: string;

  @doc("A URL to receive conference status callbacks. Not set by default.")
  @example("https://example.com/webhooks/relay")
  status_callback?: url;

  @doc("""
    A space-separated list of which conference events to deliver to
    `status_callback`. Available events: `start`, `end`, `join`, `leave`,
    `mute`, `hold`, `modify`, `speaker`, `announcement`. Not set by default.
    """)
  @example("start end join leave")
  status_callback_event?: string;

  @doc("The payload format for `status_callback`. Defaults to `relay`.")
  @example("relay")
  status_callback_event_type?: ConferenceCallbackEventType;

  @doc("The HTTP method used to deliver `status_callback`. Defaults to `POST`. Ignored when `status_callback_event_type` is `relay`.")
  @example("POST")
  status_callback_method?: ConferenceCallbackMethod;

  @doc("A URL to receive recording status callbacks. Not set by default.")
  @example("https://example.com/webhooks/relay")
  recording_status_callback?: url;

  @doc("""
    A space-separated list of which recording lifecycle events to deliver to
    `recording_status_callback`. Available events: `in-progress`, `completed`, `absent`
    (for example, `"in-progress completed"`). Defaults to `completed`.
    """)
  @example("in-progress completed")
  recording_status_callback_event?: string;

  @doc("The payload format for `recording_status_callback`. Defaults to `relay`.")
  @example("relay")
  recording_status_callback_event_type?: ConferenceCallbackEventType;

  @doc("The HTTP method used to deliver `recording_status_callback`. Defaults to `POST`. Ignored when `recording_status_callback_event_type` is `relay`.")
  @example("POST")
  recording_status_callback_method?: ConferenceCallbackMethod;

  @doc("""
    Attach a bidirectional WebSocket audio stream to the conference, for example to
    feed audio to a bot or transcription service. Uses the same stream settings as
    the stream device in `calling.connect`.
    """)
  stream?: StreamDeviceParams;

  @doc("""
    Opt into per-participant call-quality reporting. When `true`, the conference
    emits `participant-call-quality` events carrying voice-quality (QoS) metrics for
    each participant. Defaults to `false`.
    """)
  emit_call_quality?: boolean = false;
}

model LeaveConferenceParams {
  ...CallAddress;

  @doc("The id of the conference to leave. You receive this from `calling.conference` events when a participant joins.")
  @example("d02c88a9-cf83-4a5a-9c8b-2f4e6b1a0f77")
  conference_id: string;
}
