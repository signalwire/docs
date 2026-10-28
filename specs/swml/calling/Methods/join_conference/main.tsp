import "@typespec/json-schema";
import "../../../Shared/Types/main.tsp";
import "../..";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

@summary("JoinConferenceStream object")
model JoinConferenceStream {
  @doc("Secure WebSocket URL (must start with `wss://`) that the conference audio is streamed to. Plain `ws://` is not supported.")
  @example("wss://example.com/conference-audio")
  url: url;

  @doc("A friendly name to identify the stream at the WebSocket endpoint. Default not set")
  @example("conference-audio")
  name?: string;

  @doc("""
    Audio codec for the streamed audio. Supported values: `PCMU`, `PCMA`, `G722`, `L16`.
    Codec can include rate and ptime modifiers (e.g., `PCMU@40i`, `L16@24000h@40i`). Default not set
    """)
  @example("PCMU")
  codec?: string;

  @doc("HTTP or HTTPS URL to which stream status events will be sent. Default not set")
  @example("https://example.com/stream-status")
  status_url?: url;

  @doc("The HTTP method to use when sending stream status events to the status URL. Default `\"POST\"`.")
  @example("POST")
  status_url_method?: "GET" | "POST" = "POST";

  @doc("""
    Has no effect on conference streams. A boolean value is accepted, but conference streams currently
    ignore it. Default `false`.
    """)
  @example(false)
  realtime?: boolean | SWMLVar = false;

  @doc("Bearer token sent in the `Authorization` header when the WebSocket connection is opened, so your endpoint can authenticate the request. Default not set")
  @example("my-secret-token")
  authorization_bearer_token?: string;

  @doc("Custom key-value pairs delivered to your WebSocket endpoint when the stream connects. Use them to pass context such as a session or customer ID. Default not set")
  custom_parameters?: TypeSpec.Record<string>;
}

@summary("JoinConferenceObject object")
model JoinConferenceObject {
  @doc("Name of conference")
  @example("my-conference-room")
  name: string;

  @doc("Whether to join the conference in a muted state. If set to `true`, the participant will be muted upon joining. Default `false`.")
  @example(false)
  muted?: boolean | SWMLVar = false;

  @doc("Sets the behavior of the beep sound when joining or leaving the conference. Default `\"true\"`.")
  @example("onEnter")
  beep?: "true" | "false" | "onEnter" | "onExit" | SWMLVar = "true";

  @doc("""
    Whether this participant can start the conference. A conference starts once at least one participant
    with `start_on_enter` set to `true` has joined and the number of participants has reached
    `min_participants` (2 by default). Until then, participants wait. Default `true`.
    """)
  @example(true)
  start_on_enter?: boolean | SWMLVar = true;

  @doc("Ends the conference when the main participant leaves. This means the end action will not wait on more participants to leave before ending. Default `false`.")
  @example(false)
  end_on_exit?: boolean | SWMLVar = false;

  @doc("""
    A URL that SignalWire requests with an HTTP `GET` while this participant waits for the conference to start.
    Default hold music is played if not set. Set it to an empty string (`""`) to play silence instead.
    """)
  @example("https://example.com/hold-music.mp3")
  wait_url?: url | "" | SWMLVar;

  @doc("The maximum number of participants allowed in the conference. If the limit is reached, new participants will not be able to join. Default `250`.")
  @minValue(2)
  @maxValue(100000)
  @example(50)
  max_participants?: integer | SWMLVar = 250;

  @doc("""
    The number of participants that must join before the conference starts. Set it to `1` to let a single
    participant with `start_on_enter` start the conference. Use a value from 1 up to `max_participants`.
    When both are set, a `min_participants` larger than `max_participants` is rejected. An invalid number written
    directly in the document makes the document invalid, so it doesn't run. An invalid value that comes from a
    variable, such as `0` or a number larger than `max_participants`, makes the join fail and sets
    `join_conference_result` to `failed`.
    Like `max_participants`, it is set when the conference is created; joining an existing conference doesn't change it.
    Default `2`.
    """)
  @minValue(1)
  @maxValue(100000)
  @example(1)
  min_participants?: integer | SWMLVar = 2;

  @doc("""
    Enables or disables recording of the conference. Default `\"do-not-record\"`.
    With `record-from-start`, recording starts once at least two participants have joined, even if
    `min_participants` lets the conference start earlier. Recording is configured when the conference is created.
    """)
  @example("record-from-start")
  record?: "do-not-record" | "record-from-start" | SWMLVar = "do-not-record";

  @doc("Specifies the geographical region requested for hosting the conference. Default `\"global\"`.")
  @example("us")
  region?: "global" | "us" | "eu" | "ch" | SWMLVar = "global";

  @doc("If set to `trim-silence`, it will remove silence from the start of the recording. If set to `do-not-trim`, it will keep the silence. Default `\"trim-silence\"`.")
  @example("trim-silence")
  trim?: "trim-silence" | "do-not-trim" | SWMLVar = "trim-silence";

  @doc("""
    Joins the conference in coaching mode for the participant identified by the given call SID.
    The coach hears the whole conference, but is heard only by the coached participant; the other participants cannot hear the coach.
    The call SID must belong to a call that is currently connected to the in-progress conference. Specifying a call SID that does not exist or is no longer connected will result in a failure.
    """)
  @example("b3877ee3-6f3c-4985-8066-6d24e3f65e12")
  coach?: string;

  @doc("""
    Space-separated list of one or more events to send to the status callback URL.
    Possible values: `start`, `end`, `join`, `leave`, `mute`, `hold`, `modify`, `speaker`, `announcement`.
    When `status_callback` is set and this list is not set or empty, only `end` is sent.
    """)
  @example("join leave")
  status_callback_event?: string;

  @doc("The content type used when sending status events to the status callback URL. Default not set")
  @example("relay")
  status_callback_event_type?: "cxml" | "laml" | "relay" | SWMLVar;

  @doc("The URL to which status events will be sent. This URL must be publicly accessible and able to handle HTTP requests. Default not set")
  @example("https://example.com/conference-status")
  status_callback?: url | SWMLVar;

  @doc("""
    The HTTP method to use when sending status events to the status callback URL. Default `\"POST\"`.
    Notifications in the `relay` format (see `status_callback_event_type`) are always sent with `POST`, even if `GET` is set.
    """)
  @example("POST")
  status_callback_method?: "GET" | "POST" | SWMLVar = "POST";

  @doc("The URL to which recording status events will be sent. This URL must be publicly accessible and able to handle HTTP requests. Default not set")
  @example("https://example.com/recording-status")
  recording_status_callback?: url | SWMLVar;

  @doc("""
    The HTTP method to use when sending recording status events to the recording status callback URL. Default `\"POST\"`.
    Notifications in the `relay` format (see `recording_status_callback_event_type`) are always sent with `POST`, even if `GET` is set.
    """)
  @example("POST")
  recording_status_callback_method?: "GET" | "POST" | SWMLVar = "POST";

  @doc("""
    Space-separated list of one or more events to send to the recording status callback URL.
    Possible values: `in-progress`, `completed`, `absent`. Default not set
    """)
  @example("completed")
  recording_status_callback_event?: string;

  @doc("The content type used when sending recording status events to the recording status callback URL. Default not set")
  @example("relay")
  recording_status_callback_event_type?: "cxml" | "laml" | "relay" | SWMLVar;

  @doc("""
    Attach a WebSocket stream to the conference. Conference audio is streamed to
    the `url`, enabling real-time audio processing, transcription, or AI agents that listen to
    the conference. Uses the same stream schema as the `stream` device type in `connect`.
    The stream is set up only while the conference has not started yet; a `stream` sent by a participant
    joining a conference that has already started does not add a stream.
    """)
  stream?: JoinConferenceStream | SWMLVar;

  @doc("""
    When `true`, a `participant-call-quality` event with audio quality statistics is sent when this participant
    leaves, if statistics are available. To receive it, include `leave` in `status_callback_event`. Default `false`.
    """)
  @example(true)
  emit_call_quality?: boolean | SWMLVar = false;
}

@summary("join_conference Method")
model JoinConference {
  @doc("""
    Join an ad-hoc audio conference started on either the SignalWire or Compatibility API.
    This method allows you to connect the current call to a named conference where multiple participants can communicate simultaneously.
    """)
  @summary("join_conference")
  join_conference: JoinConferenceObject;
}
