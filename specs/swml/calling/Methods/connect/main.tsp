import "../..";
import "./headers.tsp";
import "@typespec/json-schema";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

// The restriction applies at every depth, so `cond` and `switch` here use confirm-specific
// branch models (ConfirmCond, ConfirmSwitch) instead of the shared Cond/Switch, whose
// branches accept any method.
@doc("Methods allowed inside an inline `confirm` section.")
union ValidConfirmMethods {
  ConfirmCond,
  ConfirmSwitch,
  Set,
  Unset,
  Hangup,
  Play,
  Prompt,
  SWML.Calling.Record,
  RecordCall,
  StopRecordCall,
  Tap,
  StopTap,
  Stream,
  StopStream,
  Transcribe,
  TranscribeStop,
  SendDigits,
  SendSMS,
  Denoise,
  StopDenoise,
  UserEvent,
}

// Confirm-only re-typing of CondReg: same `when`, but branches are limited to ValidConfirmMethods.
@summary("Confirm condition with When/Then")
model ConfirmCondReg {
  ...OmitProperties<CondReg, "then" | "else">;

  @doc("Sequence of methods to execute when the condition evaluates to true. Only methods allowed in `confirm` can be used.")
  then: ValidConfirmMethods[];

  @doc("Sequence of methods to execute when none of the other conditions evaluate to true. Only methods allowed in `confirm` can be used.")
  `else`?: ValidConfirmMethods[];
}

@summary("Confirm else fallback")
model ConfirmCondElse {
  @doc("Sequence of methods to execute when none of the other conditions evaluate to true. Only methods allowed in `confirm` can be used.")
  `else`: ValidConfirmMethods[];
}

@oneOf
@summary("ConfirmCondParams union")
union ConfirmCondParams {
  ConfirmCondReg,
  ConfirmCondElse,
}

@summary("cond method inside confirm")
model ConfirmCond {
  @summary("cond")
  @doc("Execute a sequence of instructions depending on the value of a JavaScript condition. Only methods allowed in `confirm` can be used in the branches.")
  cond: ConfirmCondParams[];
}

@summary("switch method inside confirm")
model ConfirmSwitch {
  @summary("switch")
  @doc("Execute different instructions based on a variable's value. Only methods allowed in `confirm` can be used in the branches.")
  switch: {
    @doc("Name of the variable whose value needs to be compared.")
    @example("prompt_result")
    variable: string;

    @doc("Object of key-mapped values to array of methods to execute. Only methods allowed in `confirm` can be used.")
    case: {
      ...TypeSpec.Record<ValidConfirmMethods[]>;
    };

    @doc("Array of methods to execute if no cases match. Only methods allowed in `confirm` can be used.")
    default?: ValidConfirmMethods[];
  };
}

@summary("Reason that stops a dialing group")
union ConnectRejectReason {
  "busy",
  "decline",
  "noAnswer",
}

/**
 * Caller ID name accepted when dialing a SIP destination: 1–70 letters, digits,
 * underscores, periods, hyphens, plus signs, commas, or spaces.
 */
@pattern("^[A-Za-z0-9_.+, -]{1,70}$")
scalar ConnectCallerIdName extends string;

enum CallStatus {
  created,
  ringing,
  answered,
  ended,
}

@summary("ConnectSwitch object")
model ConnectSwitch {
  @doc("Name of the variable whose value needs to be compared. If not provided, it will check the `connect_result` variable.")
  @example("connect_result")
  variable?: string;

  @doc("Object of values mapped to array of instructions to execute")
  case: {
    ...TypeSpec.Record<SWMLMethod[]>;
  };

  @doc("Array of instructions to execute if no cases match")
  default?: SWMLMethod[];
}

/**
 * Connect-level properties shared across all dialing strategies.
 * Does NOT include `username` or `password` — those belong on
 * ConnectDestination (per-destination) and ConnectDeviceSingle only.
 */
@summary("ConnectDeviceBase object")
model ConnectDeviceBase {
  @doc("The caller ID to use when dialing the number.")
  @example("+15551234567")
  from?: string;

  @doc("""
    The caller ID name shown to the person you're calling, displayed alongside the `from` number
    (sometimes called CNAM).
    Applies to SIP calls only — it has no effect on calls to phone numbers.
    When set at the top level, every destination in a `serial`, `parallel`, or `serial_parallel`
    group uses this name, unless that destination sets its own `from_name`.
    Use 1 to 70 characters: letters, digits, spaces, and `_`, `.`, `-`, `+`, or `,`.
    """)
  @example("Support Team")
  from_name?: ConnectCallerIdName | SWMLVar;

  @doc("""
    Custom SIP headers to add to INVITE. It has no effect on calls to phone numbers.
    In `serial`, `parallel`, and `serial_parallel`, every SIP destination uses these headers
    unless it sets its own `headers`.
    """)
  headers?: ConnectHeaders[];

  @doc("""
    Codecs to offer, as a comma-separated string (`"PCMU,PCMA"`) or an array of strings (`["PCMU", "PCMA"]`).
    Supported codecs are `PCMU`, `PCMA`, `OPUS`, `G722`, `G729`, `AMR-WB`, `VP8`, and `H264`.
    It has no effect on calls to phone numbers.
    In `serial`, `parallel`, and `serial_parallel`, every SIP destination uses these codecs
    unless it sets its own `codecs`.
    Based on SignalWire settings.
    """)
  @example("PCMU,PCMA,OPUS")
  codecs?: string | string[];

  @doc("""
    If true, WebRTC media is offered to the SIP endpoint.
    It has no effect on calls to phone numbers.
    In `serial`, `parallel`, and `serial_parallel`, every SIP destination uses this value
    unless it sets its own `webrtc_media`.
    Default is `false`.
    """)
  @example(true)
  webrtc_media?: boolean | SWMLVar = false;

  @doc("""
    Time, in seconds, to set the SIP `Session-Expires` header in INVITE.
    Must be a positive, non-zero number. Values from 1 to 15000 take effect; a larger value is
    accepted but no `Session-Expires` override is applied.
    It has no effect on calls to phone numbers.
    Applies only when dialing a single SIP destination with `to`. In `serial`, `parallel`, and
    `serial_parallel`, the top-level value has no effect: set `session_timeout` on each SIP destination instead.
    Based on SignalWire settings.
    """)
  @minValue(1)
  @example(1800)
  session_timeout?: integer | SWMLVar;

  @doc("""
    Ringback to play to the caller while phone, SIP, and Resource Address destinations ring. Can be:
    - A `play` URI, or an array of `play` URIs, to play as the ringback tone
    - `false` to turn off SignalWire's ringback tone and pass the destination's early media
      (for example, its own ringback or announcements) through to the caller
    - `true` to keep the default ringback tone
    If not specified, SignalWire plays a standard ringback tone.
    """)
  @example(#["https://example.com/ringback.mp3"])
  ringback?: boolean | string | string[];

  @doc("""
    Action to take based on the result of the call. This will run once the peer leg of the call has ended.
    Will use the switch method when the return_value is an object, and will use the cond method when the return_value is an array.
    """)
  result?: ConnectSwitch | Cond.cond;

  @doc("""
    Time, in seconds, to wait for the call to be answered.
    Default is 60 seconds.
    """)
  @example(30)
  timeout?: integer | SWMLVar = 60;

  @doc("""
    Maximum duration, in seconds, allowed for the call.
    Default is `14400` seconds.
    """)
  @example(3600)
  max_duration?: integer | SWMLVar = 14400;

  @doc("""
    Delay answer until the B-leg answers.
    Default is `false`.
    """)
  @example(true)
  answer_on_bridge?: boolean | SWMLVar = false;

  @doc("""
    Confirmation to execute when the call is connected. Can be either:
    - A URL (string) that returns a SWML document
    - An array of SWML methods to execute inline. Only these methods are allowed, including inside
      `cond` and `switch` branches: `cond`, `switch`, `set`, `unset`, `hangup`, `play`, `prompt`,
      `record`, `record_call`, `stop_record_call`, `tap`, `stop_tap`, `stream`, `stop_stream`,
      `transcribe`, `transcribe_stop`, `send_digits`, `send_sms`, `denoise`, `stop_denoise`, and `user_event`.
    """)
  @example("https://example.com/confirm.swml")
  confirm?: string | ValidConfirmMethods[];

  @doc("""
    Time, in seconds, allowed for the `confirm` SWML to run on the answered destination, whether it is
    fetched from a URL or given inline. When not set, the destination's `timeout` is used.
    """)
  @example(30)
  confirm_timeout?: integer | SWMLVar;

  @doc("Encryption setting to use. **Possible values:** `mandatory`, `optional`, `forbidden`")
  @example("optional")
  encryption?: "mandatory" | "optional" | "forbidden" = "optional";

  @doc("""
    Webhook URL to send call status change notifications to. Authentication can also be set in the URL in the format of `username:password@url`.
    Applies only to phone, SIP, and Resource Address destinations. A destination whose `to` starts with
    `queue:` or `stream:` can't have `call_state_url` or `call_state_events`, and a top-level value is not sent to
    those destinations. Queue lifecycle events go to the `status_url` set on `enter_queue`; stream events
    go to the stream's `status_url`.
    """)
  @example("https://example.com/call-status")
  call_state_url?: url;

  @doc("""
    SWML to execute on this call after its bridge with the queued call ends. Only applies when
    `to` starts with `queue:`. When omitted, the call hangs up when the bridge ends. Either way,
    the script does not continue past `connect` once a queued call has been bridged.
    If no queued call is bridged (for example, the queue is empty or doesn't exist), `connect` fails,
    `connect_result` is set to `failed`, and `result` runs.
    Can be either:
    - A URL (http or https) that returns a SWML document
    - An inline SWML document (as a JSON string)
    """)
  @example("https://example.com/after-queue.swml")
  execute_after_queue?: string | SWMLVar;

  @doc("""
    An array of call state event names to be notified about.
    Allowed event names are:
        - `created`
        - `ringing`
        - `answered`
        - `ended`
    Each array item can also be a SWML variable reference that resolves to one of these names.
    """)
  call_state_events?: (CallStatus | SWMLVar)[] = #[CallStatus.ended];

  @doc("""
    Stop ringing and disconnect the caller when a destination rejects the call. Can be either:
    - `true` to stop when a destination is busy or declines the call
    - A non-empty array of the reasons to stop on: `busy`, `decline`, `noAnswer`
    When a destination rejects the call with a matching reason, the destinations ringing alongside it
    stop ringing. If `connect` then fails with that reason, the `result` block runs first, and then
    the caller is disconnected.
    """)
  @example(#["busy", "decline"])
  @minItems(1)
  stop_all_on_reject?: boolean | ConnectRejectReason[] = false;

  @doc("""
    HTTP or HTTPS URL to deliver connect status events.
    These events report the overall status of the connect operation
    (connecting, connected, failed, disconnected) via a `calling.call.connect` event.
    """)
  @example("https://example.com/connect-status")
  status_url?: url;
}

/**
 * Per-destination model used inside `serial`, `parallel`, and `serial_parallel` arrays.
 *
 * Contains only the properties that apply to an individual destination:
 * addressing, caller-ID overrides, SIP auth, per-leg timeouts/confirmations,
 * and stream-specific settings.
 */
@summary("ConnectDestination object")
model ConnectDestination {
  @doc("""
    Destination to dial. Can be:
    - Phone number in E.164 format (e.g., "+15552345678")
    - SIP URI (e.g., "sip:alice@example.com")
    - Resource Address (e.g., "/public/test_room")
    - Queue (e.g., "queue:support")
    - WebSocket stream (e.g., "stream:wss://example.com/audio")
    """)
  @example("+15559876543")
  to: string;

  @doc("The caller ID to use when dialing this destination. Overrides the top-level `from`.")
  @example("+15551234567")
  from?: string;

  @doc("""
    The caller ID name for this destination. Overrides the top-level `from_name`.
    Applies to SIP calls only — it has no effect on calls to phone numbers.
    Use 1 to 70 characters: letters, digits, spaces, and `_`, `.`, `-`, `+`, or `,`.
    """)
  @example("Support Team")
  from_name?: ConnectCallerIdName | SWMLVar;

  @doc("Custom SIP headers to add to INVITE for this destination. Replaces the top-level `headers` for this destination. It has no effect on calls to phone numbers.")
  headers?: ConnectHeaders[];

  @doc("""
    Codecs to offer for this destination, as a comma-separated string or an array of strings.
    Supported codecs are `PCMU`, `PCMA`, `OPUS`, `G722`, `G729`, `AMR-WB`, `VP8`, and `H264`.
    Overrides the top-level `codecs`. It has no effect on calls to phone numbers.
    """)
  @example("PCMU")
  codecs?: string | string[];

  @doc("""
    If true, WebRTC media is offered to this SIP destination.
    Overrides the top-level `webrtc_media`, which is used when this is not set. It has no effect on calls to phone numbers.
    """)
  @example(true)
  webrtc_media?: boolean | SWMLVar;

  @doc("""
    Time, in seconds, to set the SIP `Session-Expires` header in INVITE for this destination.
    Must be a positive, non-zero number. Values from 1 to 15000 take effect; a larger value is
    accepted but no `Session-Expires` override is applied.
    This destination does not use the top-level `session_timeout`, so set it here for each SIP destination that needs it.
    It has no effect on calls to phone numbers.
    """)
  @minValue(1)
  @example(1800)
  session_timeout?: integer | SWMLVar;

  @doc("SIP username to use for authentication when dialing a SIP URI. Has no effect on calls to phone numbers.")
  @example("sipuser")
  username?: string;

  @doc("SIP password to use for authentication when dialing a SIP URI. Has no effect on calls to phone numbers.")
  @example("sippassword")
  password?: string;

  @doc("""
    Time, in seconds, to wait for this destination to answer.
    Overrides the top-level `timeout`. When neither is set, the destination rings for up to 60 seconds.
    """)
  @example(30)
  timeout?: integer | SWMLVar;

  @doc("""
    An array of call state event names to be notified about for this destination.
    Overrides the top-level `call_state_events`. When neither is set and a `call_state_url` applies,
    only `ended` is sent.
    Allowed event names are: `created`, `ringing`, `answered`, `ended`. Each array item can also be a
    SWML variable reference that resolves to one of these names.
    Not allowed when `to` starts with `queue:` or `stream:`.
    """)
  call_state_events?: (CallStatus | SWMLVar)[];

  @doc("""
    Webhook URL for call status change notifications for this destination. Overrides the top-level `call_state_url`.
    Applies only to phone, SIP, and Resource Address destinations; not allowed when `to` starts with `queue:` or `stream:`.
    """)
  @example("https://example.com/call-status")
  call_state_url?: url;

  @doc("""
    Confirmation to execute on this destination when answered.
    Overrides the top-level `confirm`. Can be either:
    - A URL (string) that returns a SWML document
    - An array of SWML methods to execute inline, limited to the same methods as the top-level `confirm`
    """)
  @example("https://example.com/confirm.swml")
  confirm?: string | ValidConfirmMethods[];

  @doc("Seconds allowed for the `confirm` SWML to run on this destination. Overrides the top-level `confirm_timeout`. When neither is set, this destination's effective `timeout` is used.")
  @example(30)
  confirm_timeout?: integer | SWMLVar;

  @doc("Encryption setting for this destination. Overrides the top-level `encryption`, which is used when this is not set. **Possible values:** `mandatory`, `optional`, `forbidden`")
  @example("optional")
  encryption?: "mandatory" | "optional" | "forbidden";

  // Stream-specific properties (only apply when `to` starts with "stream:wss://")

  @doc("Stream name identifier. Only applies to stream destinations.")
  @example("my-stream")
  name?: string;

  @doc("""
    Audio codec for the stream. Supported values: `PCMU`, `PCMA`, `G722`, `L16`.
    Codec can include rate and ptime modifiers (e.g., `PCMU@40i`, `L16@24000h@40i`).
    Only applies to stream destinations.
    """)
  @example("PCMU")
  codec?: string;

  @doc("""
    Enable realtime mode for bidirectional audio.
    Only applies to stream destinations.
    """)
  @example(true)
  realtime?: boolean | SWMLVar = false;

  // Destination-level stream status URL. ConnectDeviceSingle omits it and keeps the top-level
  // `status_url` from ConnectDeviceBase, which also reaches a single stream destination.
  @doc("""
    HTTPS URL to receive status notifications for this stream destination.
    Only applies to stream destinations.
    """)
  @example("https://example.com/stream-status")
  status_url?: url;

  @doc("""
    HTTP method for the stream status webhook.
    Only applies to stream destinations.
    """)
  @example("POST")
  status_url_method?: "GET" | "POST" = "POST";

  @doc("Bearer token sent as an `Authorization` header during the WebSocket handshake. Only applies to stream destinations.")
  @example("my-secret-token")
  authorization_bearer_token?: string;

  @doc("Custom key-value pairs sent in the WebSocket start message. Only applies to stream destinations.")
  custom_parameters?: TypeSpec.Record<string>;
}

/**
 * Single-destination connect object.
 *
 * Inherits connect-level properties from ConnectDeviceBase, then spreads the
 * destination-only properties from ConnectDestination (using `Omit` to skip
 * the fields already present on ConnectDeviceBase, avoiding duplication).
 */
@summary("Single Destination")
model ConnectDeviceSingle is ConnectDeviceBase {
  ...OmitProperties<
    ConnectDestination,

      | "from"
      | "from_name"
      | "headers"
      | "codecs"
      | "webrtc_media"
      | "session_timeout"
      | "timeout"
      | "call_state_events"
      | "call_state_url"
      | "confirm"
      | "confirm_timeout"
      | "encryption"
      | "status_url"
  >;
}

@summary("Serial Dialing")
@doc("Dial destinations one at a time in sequence. If the first destination does not answer, the next destination in the array is tried, and so on.")
model ConnectDeviceSerial is ConnectDeviceBase {
  @doc("""
    Array of destination objects to dial in order. Each destination is tried sequentially — if the current destination does not answer, the next one in the array is attempted.
    Up to 20 destinations are tried. Any destination after the 20th is skipped without an error.
    Must contain at least one destination. A `queue:` destination can't be combined with any other destination,
    and a `stream:` destination can't be combined with a phone, SIP, Resource Address, or queue destination:
    `connect` fails in either case. If several `stream:` destinations are listed, only the first is used.
    To connect to a queue or a stream, use a single `to` instead.
    """)
  @minItems(1)
  serial: ConnectDestination[];
}

@summary("Parallel Dialing")
@doc("Dial multiple destinations simultaneously. All destinations in the array ring at the same time — the first to answer is bridged and the remaining calls are cancelled.")
model ConnectDeviceParallel is ConnectDeviceBase {
  @doc("""
    Array of destination objects to dial simultaneously. All destinations ring at the same time — the first to answer is bridged and the remaining calls are cancelled.
    Up to 20 destinations are dialed. Any destination after the 20th is skipped without an error.
    Must contain at least one destination. A `queue:` destination can't be combined with any other destination,
    and a `stream:` destination can't be combined with a phone, SIP, Resource Address, or queue destination:
    `connect` fails in either case. If several `stream:` destinations are listed, only the first is used.
    To connect to a queue or a stream, use a single `to` instead.
    """)
  @minItems(1)
  parallel: ConnectDestination[];
}

@summary("Serial-Parallel Dialing")
@doc("Combine both serial and parallel strategies using a two-dimensional array. The outer array is the serial dimension — each element is a group tried one at a time, in order. Each inner array is the parallel dimension — all destinations in that group are dialed simultaneously. If no destination in the current group answers, the next group is attempted.")
model ConnectDeviceSerialParallel is ConnectDeviceBase {
  @doc("""
    Two-dimensional array combining serial and parallel strategies.
    The outer array is the **serial** dimension — each element is a group tried in order.
    Each inner array is the **parallel** dimension — all destinations in that group are dialed simultaneously.
    If no destination in the current group answers, the next group is attempted.
    Up to 20 destinations are dialed in total, counted across all groups rather than per group. Any destination after the 20th is skipped without an error.
    Must contain at least one destination. A `queue:` destination can't be combined with any other destination,
    and a `stream:` destination can't be combined with a phone, SIP, Resource Address, or queue destination:
    `connect` fails in either case. If several `stream:` destinations are listed, only the first is used.
    To connect to a queue or a stream, use a single `to` instead.
    """)
  @minItems(1)
  serial_parallel: ConnectDestination[][];
}

alias ConnectDevice =
  | ConnectDeviceSingle
  | ConnectDeviceSerial
  | ConnectDeviceParallel
  | ConnectDeviceSerialParallel;

@summary("connect Method")
model Connect {
  @doc("Connect to a phone number, SIP URI, Resource Address, queue, or WebSocket stream.")
  @oneOf
  connect: ConnectDevice;
}
