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

  @doc("When `true`, enables bidirectional audio so your endpoint can stream audio back into the conference (not just receive it). Default `false`.")
  @example(true)
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
  beep?: "true" | "false" | "onEnter" | "onExit" = "true";

  @doc("Starts the conference when the main participant joins. This means the start action will not wait on more participants to join before starting. Default `true`.")
  @example(true)
  start_on_enter?: boolean | SWMLVar = true;

  @doc("Ends the conference when the main participant leaves. This means the end action will not wait on more participants to leave before ending. Default `false`.")
  @example(false)
  end_on_exit?: boolean | SWMLVar = false;

  @doc("A URL that will play media when the conference is put on hold. Default hold music will be played if not set")
  @example("https://example.com/hold-music.mp3")
  wait_url?: url | SWMLVar;

  @doc("The maximum number of participants allowed in the conference. If the limit is reached, new participants will not be able to join. Default `100000`.")
  @minValue(2)
  @maxValue(100000)
  @example(50)
  max_participants?: integer | SWMLVar = 100000;

  @doc("Enables or disables recording of the conference. Default `\"do-not-record\"`.")
  @example("record-from-start")
  record?: "do-not-record" | "record-from-start" = "do-not-record";

  @doc("Specifies the geographical region where the conference will be hosted. Default not set")
  @example("us")
  region?: "global" | "us" | "eu" | "ch";

  @doc("If set to `trim-silence`, it will remove silence from the start of the recording. If set to `do-not-trim`, it will keep the silence. Default `\"trim-silence\"`.")
  @example("trim-silence")
  trim?: "trim-silence" | "do-not-trim" = "trim-silence";

  @doc("""
    Coach accepts a call SID of a call that is currently connected to an in-progress conference.
    Specifying a call SID that does not exist or is no longer connected will result in a failure.
    """)
  @example("b3877ee3-6f3c-4985-8066-6d24e3f65e12")
  coach?: string;

  @doc("""
    Space-separated list of one or more events to send to the status callback URL.
    Possible values: `start`, `end`, `join`, `leave`, `mute`, `hold`, `modify`, `speaker`, `announcement`. Default not set
    """)
  @example("join leave")
  status_callback_event?: string;

  @doc("The content type used when sending status events to the status callback URL. Default not set")
  @example("relay")
  status_callback_event_type?: "cxml" | "laml" | "relay";

  @doc("The URL to which status events will be sent. This URL must be publicly accessible and able to handle HTTP requests. Default not set")
  @example("https://example.com/conference-status")
  status_callback?: url;

  @doc("The HTTP method to use when sending status events to the status callback URL. Default `\"POST\"`.")
  @example("POST")
  status_callback_method?: "GET" | "POST" = "POST";

  @doc("The URL to which recording status events will be sent. This URL must be publicly accessible and able to handle HTTP requests. Default not set")
  @example("https://example.com/recording-status")
  recording_status_callback?: url;

  @doc("The HTTP method to use when sending recording status events to the recording status callback URL. Default `\"POST\"`.")
  @example("POST")
  recording_status_callback_method?: "GET" | "POST" = "POST";

  @doc("""
    Space-separated list of one or more events to send to the recording status callback URL.
    Possible values: `in-progress`, `completed`, `absent`. Default not set
    """)
  @example("completed")
  recording_status_callback_event?: string;

  @doc("The content type used when sending recording status events to the recording status callback URL. Default not set")
  @example("relay")
  recording_status_callback_event_type?: "cxml" | "laml" | "relay";

  @doc("""
    Allows the user to specify a custom action to be executed when the conference result is returned (typically when it has ended).
    The actions can a `switch` object or a `cond` array.
    The `switch` object allows for conditional execution based on the result of the conference, while
    the `cond` array allows for multiple conditions to be checked in sequence.
    If neither is provided, the default action will be to end the conference.
    """)
  result?: Switch.switch | Cond.cond;

  @doc("""
    Attach a bidirectional WebSocket stream to the conference. Conference audio is streamed to
    the `url`, enabling real-time audio processing, transcription, or AI agents that listen to
    the conference. Uses the same stream schema as the `stream` device type in `connect`.
    """)
  stream?: JoinConferenceStream;
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
