import "@signalwire/typespec-asyncapi";

import "../../models/core.tsp";
import "../../models/devices.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ═════════════════════════════════════════════════════════════════════════════
// Shared enums for this family (conference status-callback knobs)
// ═════════════════════════════════════════════════════════════════════════════

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
}

@doc("Whether leading and trailing silence is trimmed from the conference recording.")
union ConferenceTrim {
  "trim-silence",
  "do-not-trim",
}

@doc("The payload format for a conference status callback. Use `\"relay\"` for SignalWire's native event format or `\"cxml\"` for the cXML-compatible format.")
union ConferenceCallbackEventType {
  "relay",
  "cxml",
}

@doc("The HTTP method used to deliver a conference status callback to your URL.")
union ConferenceCallbackMethod {
  "GET",
  "POST",
}

model JoinConferenceParams {
  ...CallAddress;

  @doc("The name of the conference to join. If a conference with this name does not exist yet, it is created.")
  name: string;

  @doc("Join the conference with this participant muted. Defaults to `false`.")
  muted?: boolean = false;

  @doc("Whether a beep plays as participants enter or leave. Defaults to `true`.")
  beep?: ConferenceBeep;

  @doc("Whether the conference starts when this participant enters. Defaults to `true`.")
  start_on_enter?: boolean = true;

  @doc("Whether the conference ends for everyone when this participant leaves. Defaults to `false`.")
  end_on_exit?: boolean = false;

  @doc("A URL to cXML, or to an mp3/wav file, to play while this participant waits for the conference to start. Defaults to hold music.")
  wait_url?: url;

  @doc("The maximum number of participants allowed in the conference, up to 250. Defaults to `250`.")
  @minValueExclusive(0)
  @maxValue(250)
  max_participants?: int32;

  @doc("Whether and when to record the conference. Defaults to `do-not-record`.")
  record?: ConferenceRecord;

  @doc("The region where the conference media is hosted. Defaults to `global`.")
  region?: ConferenceRegion;

  @doc("Whether to trim silence from the recording. Defaults to `trim-silence`.")
  trim?: ConferenceTrim;

  @doc("The id of a call (SWML Call ID or cXML CallSid) that this participant coaches. A coach can be heard only by the call being coached, not by the rest of the conference. Not set by default.")
  coach?: string;

  @doc("A URL to receive conference status callbacks. Not set by default.")
  status_callback?: url;

  @doc("""
    A space-separated list of which conference events to deliver to
    `status_callback`. Available events: `start`, `end`, `join`, `leave`,
    `mute`, `hold`, `modify`, `speaker`, `announcement`. Not set by default.
    """)
  status_callback_event?: string;

  @doc("The payload format for `status_callback`. Defaults to `relay`.")
  status_callback_event_type?: ConferenceCallbackEventType;

  @doc("The HTTP method used to deliver `status_callback`. Defaults to `POST`. Ignored when `status_callback_event_type` is `relay`.")
  status_callback_method?: ConferenceCallbackMethod;

  @doc("A URL to receive recording status callbacks. Not set by default.")
  recording_status_callback?: url;

  @doc("""
    A space-separated list of which recording lifecycle events to deliver to
    `recording_status_callback`. Available events: `in-progress completed absent`
    (for example, `"in-progress completed"`). Defaults to `completed`.
    """)
  recording_status_callback_event?: string;

  @doc("The payload format for `recording_status_callback`. Defaults to `relay`.")
  recording_status_callback_event_type?: ConferenceCallbackEventType;

  @doc("The HTTP method used to deliver `recording_status_callback`. Defaults to `POST`. Ignored when `recording_status_callback_event_type` is `relay`.")
  recording_status_callback_method?: ConferenceCallbackMethod;

  @doc("""
    Attach a bidirectional WebSocket audio stream to the conference, for example to
    feed audio to a bot or transcription service. Uses the same stream settings as
    the stream device in `calling.connect`.
    """)
  stream?: StreamDeviceParams;
}

model LeaveConferenceParams {
  ...CallAddress;

  @doc("The id of the conference to leave. You receive this from `calling.conference` events when a participant joins.")
  conference_id: string;
}
