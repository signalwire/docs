import "@signalwire/typespec-asyncapi";
import "../../common/frames.tsp";
import "@typespec/openapi";

import "../models/core.tsp";
import "../models/entities.tsp";

using TypeSpec.OpenAPI;

namespace Relay.Fabric;

@doc("SIP signaling details for a SIP call leg. Each field is present only when the call carried it.")
@summary("Call Fabric SIP data")
model FabricSipData {
  @doc("User part of the SIP Request-URI.")
  sip_req_user?: string;

  @doc("The SIP Request-URI.")
  sip_req_uri?: string;

  @doc("Host part of the SIP Request-URI.")
  sip_req_host?: string;

  @doc("User part of the SIP `From` header.")
  sip_from_user?: string;

  @doc("The SIP `From` URI.")
  sip_from_uri?: string;

  @doc("Host part of the SIP `From` header.")
  sip_from_host?: string;

  @doc("User part of the SIP `To` header.")
  sip_to_user?: string;

  @doc("The SIP `To` URI.")
  sip_to_uri?: string;

  @doc("Host part of the SIP `To` header.")
  sip_to_host?: string;

  @doc("User part of the SIP `Contact` header.")
  sip_contact_user?: string;

  @doc("Port of the SIP `Contact` header.")
  sip_contact_port?: string;

  @doc("The SIP `Contact` URI.")
  sip_contact_uri?: string;

  @doc("Host part of the SIP `Contact` header.")
  sip_contact_host?: string;

  @doc("URI parameters of the `From` header, as name/value pairs.")
  sip_from_params?: Record<string>;

  @doc("URI parameters of the `To` header, as name/value pairs.")
  sip_to_params?: Record<string>;

  @doc("URI parameters of the `Contact` header, as name/value pairs.")
  sip_contact_params?: Record<string>;

  @doc("URI parameters of the Request-URI, as name/value pairs.")
  sip_req_params?: Record<string>;

  @doc("The raw `P-Asserted-Identity` header.")
  sip_p_asserted_identity?: string;
}

@doc("The device handling a Call Fabric call leg.")
@summary("Call Fabric device")
model FabricCallDevice {
  @doc("The device type, such as `phone`, `sip`, or `webrtc`.")
  @example("webrtc")
  type: string;

  @doc("Device-specific parameters.")
  params?: Record<unknown>;
}

@doc("The call this leg is directly connected to.")
@summary("Call Fabric peer reference")
model FabricPeerRef {
  @doc("The peer call's `call_id`.")
  @example("e5c3f2b1-8d0a-4b4c-9f3e-2a1b0c9d8e7f")
  call_id?: string;

  @doc("The node the peer call leg lives on.")
  @example("a3f1c2d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d")
  node_id?: string;
}

@doc("The call that created this one.")
@summary("Call Fabric parent reference")
model FabricParentRef {
  @doc("The parent's device type, such as `sip`.")
  @example("sip")
  device_type?: string;

  @doc("The parent call's `call_id`.")
  @example("e5c3f2b1-8d0a-4b4c-9f3e-2a1b0c9d8e7f")
  call_id?: string;

  @doc("The node the parent call leg lives on.")
  @example("a3f1c2d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d")
  node_id?: string;
}

@doc("Payload of the Call Fabric `call.state` event: a call leg's address, state, timing, and connection detail.")
@summary("Call Fabric call state event payload")
model CallStateParams {
  @doc("The call this event is about.")
  @example("c2a1e9f4-6b3d-4e7a-8f1c-2d3e4f5a6b7c")
  call_id: string;

  @doc("The node the call leg lives on.")
  @example("a3f1c2d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d")
  node_id: string;

  @doc("The room session this call leg belongs to. In a 1:1 call this is the call ID.")
  room_session_id: string;

  @doc("Identifier of the call segment this event belongs to, for correlating events within the same segment.")
  @example("e5c3f2b1-8d0a-4b4c-9f3e-2a1b0c9d8e7f")
  segment_id?: string;

  @doc("The `tag` you set when creating the call, echoed back so you can match the event to your request.")
  @example("my-tag-1")
  tag?: string;

  @doc("The state the call has just moved into.")
  @example("answered")
  call_state: FabricCallState;

  @doc("Whether the call is inbound or outbound.")
  @example("outbound")
  direction: string;

  @doc("When the call started, as a Unix timestamp in milliseconds. `0` until known.")
  @example(1712345678123)
  start_time: int64;

  @doc("When the call was answered, as a Unix timestamp in milliseconds. `0` until the call is answered.")
  @example(1712345680456)
  answer_time: int64;

  @doc("When the call ended, as a Unix timestamp in milliseconds. `0` until the call ends.")
  @example(0)
  end_time: int64;

  @doc("Why the call ended: one of `hangup`, `cancel`, `busy`, `decline`, `noAnswer`, `error`, `abandoned`, `maxDuration`, or `notFound`. Present once an end reason is known.")
  @example("hangup")
  end_reason?: string;

  @doc("Which side ended the call: `inbound`, `outbound`, or `none` when it could not be determined. Present together with `end_reason`.")
  @example("outbound")
  end_source?: "inbound" | "outbound" | "none";

  @doc("Set to the string `\"true\"` on the call leg that won a dial race. Absent otherwise. Note the value is the string `\"true\"`, not a JSON boolean.")
  @example("true")
  dial_winner?: "true";

  @doc("Inbound-audio Mean Opinion Score (voice quality), as a decimal such as `4.42`. Present when RTP quality stats are available.")
  @example(4.42)
  audio_in_mos?: float64;

  @doc("The device handling this call leg.")
  device: FabricCallDevice;

  @doc("Present when this leg is directly connected to another call.")
  peer?: FabricPeerRef;

  @doc("Present when this call was created by another call.")
  parent?: FabricParentRef;

  @doc("SIP signaling details. Present on SIP call legs.")
  sip_data?: FabricSipData;

  @doc("The Resource address the call is associated with. Present on subscriber call legs.")
  address_id?: string;

  @doc("The subscriber the call belongs to. Present on subscriber call legs.")
  subscriber_id?: string;

  @doc("The subscriber's display name. Present on subscriber call legs when set.")
  subscriber_name?: string;
}

const fabricCallState = "call.state";
@doc("""
  Fires every time a Call Fabric call leg changes state — created, ringing, answered,
  ending, ended. Track the call through its lifecycle with `call_state`, and match `tag`
  to the call you created.
  """)
@summary(fabricCallState)
@extension("x-fern-display-name", fabricCallState)
model CallStateEvent
  is SignalwireEvent<typeof fabricCallState, CallStateParams>;

@doc("Payload of the `call.joined` event: the room session you joined, your identifiers, and your capabilities.")
@summary("Call joined event payload")
model CallJoinedParams {
  @doc("The room session you joined.")
  room_session: CallRoomSession;

  @doc("The room ID.")
  room_id: string;

  @doc("The room session ID.")
  room_session_id: string;

  @doc("Your call ID on this call.")
  call_id: string;

  @doc("Your member ID on this call.")
  member_id: string;

  @doc("The node your call leg lives on.")
  node_id: string;

  @doc("The capabilities granted to you on this call — the operations you are permitted to perform. Omitted when no capabilities are reported.")
  capabilities?: string[];

  @doc("The call ID this call originated from. Present when this call has an originating call.")
  origin_call_id?: string;
}

const fabricCallJoined = "call.joined";
@doc("Fires when you join a Call Fabric call. Delivers the room session, your call and member identifiers, and the capabilities granted to you.")
@summary(fabricCallJoined)
@extension("x-fern-display-name", fabricCallJoined)
model CallJoinedEvent
  is SignalwireEvent<typeof fabricCallJoined, CallJoinedParams>;

@doc("Payload of the `call.left` event: the room session you left. Its `room_session` is a reduced shape — the member/recording/stream/playback collections are absent on this event.")
@summary("Call left event payload")
model CallLeftParams {
  @doc("The room session you left, in the reduced form (no collection fields).")
  room_session: CallRoomSession;

  @doc("The room ID.")
  room_id: string;

  @doc("The room session ID.")
  room_session_id: string;

  @doc("Your call ID on the call you left.")
  call_id: string;

  @doc("Your member ID on the call you left.")
  member_id: string;

  @doc("The node your call leg lived on.")
  node_id: string;

  @doc("The call ID this call originated from. Present when this call has an originating call.")
  origin_call_id?: string;
}

const fabricCallLeft = "call.left";
@doc("Fires when your Call Fabric call leg starts ending, delivering the (reduced) room session you left. To learn why the call ended, read `end_reason` on the `call.state` event.")
@summary(fabricCallLeft)
@extension("x-fern-display-name", fabricCallLeft)
model CallLeftEvent is SignalwireEvent<typeof fabricCallLeft, CallLeftParams>;

@doc("Payload of the `member.joined` event: the member that joined and the room they joined.")
@summary("Member joined event payload")
model MemberJoinedParams {
  @doc("The member that joined, with their state. A `CallMember` on a 1:1 call, a `Member` in a conference.")
  member: CallMember | Member;

  @doc("The room ID.")
  room_id: string;

  @doc("The room session ID.")
  room_session_id: string;

  @doc("The node the member's call leg lives on.")
  node_id: string;

  @doc("The call ID this member originated from. Present when this member has an originating call.")
  origin_call_id?: string;
}

const fabricMemberJoined = "member.joined";
@doc("Fires when a member joins a Call Fabric call or conference, delivering the new member's state.")
@summary(fabricMemberJoined)
@extension("x-fern-display-name", fabricMemberJoined)
model MemberJoinedEvent
  is SignalwireEvent<typeof fabricMemberJoined, MemberJoinedParams>;

@doc("Payload of the `member.left` event: the member that left and the room.")
@summary("Member left event payload")
model MemberLeftParams {
  @doc("The member that left, with their last-known state. A `CallMember` on a 1:1 call, a `Member` in a conference.")
  member: CallMember | Member;

  @doc("The room ID.")
  room_id: string;

  @doc("The room session ID.")
  room_session_id: string;

  @doc("The node the member's call leg lived on.")
  node_id: string;

  @doc("The call ID this member originated from. Present when this member has an originating call.")
  origin_call_id?: string;
}

const fabricMemberLeft = "member.left";
@doc("Fires when a member leaves a Call Fabric call or conference, delivering the member's last-known state.")
@summary(fabricMemberLeft)
@extension("x-fern-display-name", fabricMemberLeft)
model MemberLeftEvent
  is SignalwireEvent<typeof fabricMemberLeft, MemberLeftParams>;

@doc("Payload of the `member.talking` event: which member started or stopped talking.")
@summary("Member talking event payload")
model MemberTalkingParams {
  @doc("The member whose talking state changed — just the `id` and whether they are `talking`.")
  member: TalkingMember;

  @doc("The room ID.")
  room_id: string;

  @doc("The room session ID.")
  room_session_id: string;
}

const fabricMemberTalking = "member.talking";
@doc("Fires when a member starts or stops talking. Delivers the member `id` and a `talking` boolean.")
@summary(fabricMemberTalking)
@extension("x-fern-display-name", fabricMemberTalking)
model MemberTalkingEvent
  is SignalwireEvent<typeof fabricMemberTalking, MemberTalkingParams>;

@doc("Payload of the `member.updated` event: the member whose state changed. The member's `updated` field lists which properties changed.")
@summary("Member updated event payload")
model MemberUpdatedParams {
  @doc("The updated member. Its `updated` field lists which properties changed.")
  member: Member;

  @doc("The room ID.")
  room_id: string;

  @doc("The room session ID.")
  room_session_id: string;
}

const fabricMemberUpdated = "member.updated";
@doc("Fires when a member's state changes — mute, deaf, volume, hand-raise, and so on. The member's `updated` field lists which properties changed. Follows member-control methods such as `call.mute` and `call.deaf`.")
@summary(fabricMemberUpdated)
@extension("x-fern-display-name", fabricMemberUpdated)
model MemberUpdatedEvent
  is SignalwireEvent<typeof fabricMemberUpdated, MemberUpdatedParams>;

@doc("Payload of the `room.updated` event: the room session, with its updated state. The room session's `updated` field lists which properties changed.")
@summary("Room updated event payload")
model RoomUpdatedParams {
  @doc("The room session, with its updated state.")
  room_session: RoomSession;

  @doc("The room ID.")
  room_id: string;

  @doc("The room session ID.")
  room_session_id: string;

  @doc("Deprecated. A legacy copy of `room_session` that carries `room_session_id` in place of `id`. Use `room_session` instead.")
  room?: Record<unknown>;
}

const fabricRoomUpdated = "room.updated";
@doc("Fires when the room session's state changes — lock, layout, recording, and so on. The room session's `updated` field lists which properties changed.")
@summary(fabricRoomUpdated)
@extension("x-fern-display-name", fabricRoomUpdated)
model RoomUpdatedEvent
  is SignalwireEvent<typeof fabricRoomUpdated, RoomUpdatedParams>;

@doc("Payload of the `layout.changed` event: the new video layout in effect.")
@summary("Layout changed event payload")
model LayoutChangedParams {
  @doc("The room ID.")
  room_id: string;

  @doc("The room session ID.")
  room_session_id: string;

  @doc("The layout now in effect.")
  layout: LayoutInfo;
}

const fabricLayoutChanged = "layout.changed";
@doc("Fires when the video layout changes, for example after `call.layout.set`. Delivers the new layout. Note the wire event type is `layout.changed`, not `call.layout.changed`.")
@summary(fabricLayoutChanged)
@extension("x-fern-display-name", fabricLayoutChanged)
model LayoutChangedEvent
  is SignalwireEvent<typeof fabricLayoutChanged, LayoutChangedParams>;

// ---------------------------------------------------------------------------
// Shared address bases for Fabric call.* media/interaction events.
// The engine force-adds call_id and room_session_id (= call_id for a 1:1 call)
// to every unified Fabric event payload.
// ---------------------------------------------------------------------------

@doc("Identifiers carried on every Call Fabric media/interaction event.")
@summary("Fabric media event address")
model FabricMediaAddress {
  @doc("Unique identifier of the call this event is about. Always present on Fabric events.")
  @example("c2a1e9f4-6b3d-4e7a-8f1c-2d3e4f5a6b7c")
  call_id: string;

  @doc("The node the call leg lives on.")
  @example("a3f1c2d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d")
  node_id: string;

  @doc("The room session this call leg belongs to. In a 1:1 call this equals the `call_id`.")
  @example("c2a1e9f4-6b3d-4e7a-8f1c-2d3e4f5a6b7c")
  room_session_id: string;
}

@doc("`FabricMediaAddress` plus the segment/tag correlation fields carried on most Fabric events.")
@summary("Fabric media event address (with correlation)")
model FabricMediaEventAddress {
  ...FabricMediaAddress;

  @doc("Identifier of the call segment this event belongs to, for correlating events within the same segment.")
  @example("e5c3f2b1-8d0a-4b4c-9f3e-2a1b0c9d8e7f")
  segment_id?: string;

  @doc("The `tag` you set when creating the call, echoed back so you can match the event to your request.")
  @example("my-tag-1")
  tag?: string;
}

// ===========================================================================
// call.play
// ===========================================================================

@doc("The current state of audio playback on the call.")
union FabricCallPlayState {
  "playing",
  "paused",
  "error",
  "finished",
}

@doc("Payload of the Call Fabric `call.play` event: playback state for a `call.play` action.")
@summary("Call Fabric play event payload")
model CallPlayParams {
  ...FabricMediaAddress;

  @doc("The `control_id` of the playback this event refers to, returned when you started it.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("Where the playback currently stands.")
  @example("playing")
  state: FabricCallPlayState;
}

const fabricCallPlay = "call.play";
@doc("Fires when audio playback on a Call Fabric call starts, pauses, resumes, finishes, or errors, so you can track a play action through to completion.")
@summary(fabricCallPlay)
@extension("x-fern-display-name", fabricCallPlay)
model CallPlayEvent is SignalwireEvent<typeof fabricCallPlay, CallPlayParams>;

// ===========================================================================
// call.connect
// ===========================================================================

@doc("The other call being connected to yours.")
@summary("Fabric connect peer")
model FabricConnectPeer {
  @doc("The node the peer call leg lives on.")
  @example("a3f1c2d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d")
  node_id?: string;

  @doc("The peer call's `call_id`.")
  @example("c2a1e9f4-6b3d-4e7a-8f1c-2d3e4f5a6b7c")
  call_id?: string;

  @doc("The `tag` set on the peer call.")
  @example("my-tag-1")
  tag?: string;

  @doc("When the peer was reached through a queue, the queue's id.")
  @example("q-1a2b3c4d")
  queue_id?: string;

  @doc("Human-readable name of the queue the peer was reached through.")
  @example("support")
  queue_name?: string;

  @doc("The device handling the peer call.")
  device?: FabricCallDevice;
}

@doc("Payload of the Call Fabric `call.connect` event: how a connect request to a peer is progressing.")
@summary("Call Fabric connect event payload")
model CallConnectParams {
  ...FabricMediaEventAddress;

  @doc("The other call yours is being connected to.")
  peer?: FabricConnectPeer;

  @doc("Where the connection stands: `connecting`, `connected`, `disconnected`, or `failed`.")
  @example("connected")
  connect_state: "disconnected" | "connecting" | "connected" | "failed";

  @doc("Why the connect failed. Present when `connect_state` is `failed`.")
  @example("noAnswer")
  failed_reason?: string;
}

const fabricCallConnect = "call.connect";
@doc("Fires as a connect request progresses, telling you whether your Call Fabric call has been bridged to the peer. Watch `connect_state` to know when the two calls are joined, torn down, or have failed to connect.")
@summary(fabricCallConnect)
@extension("x-fern-display-name", fabricCallConnect)
model CallConnectEvent
  is SignalwireEvent<typeof fabricCallConnect, CallConnectParams>;

// ===========================================================================
// call.record
// ===========================================================================

@doc("Where the recording currently stands, including `no_input` when nothing was captured.")
union FabricCallRecordState {
  "recording",
  "paused",
  "finished",
  "no_input",
}

@doc("Which side of the conversation was recorded.")
union FabricRecordEventDirection {
  @doc("Only what the party hears.")
  "listen",

  @doc("Only what the party says.")
  "speak",

  @doc("Both sides of the conversation.")
  "both",
}

@doc("The audio settings the recording was captured with.")
@summary("Fabric recording audio settings")
model FabricRecordEventAudio {
  @doc("The file format of the recording (for example `mp3` or `wav`).")
  @example("mp3")
  format?: string;

  @doc("Whether the recording was captured in stereo.")
  @example(false)
  stereo?: boolean;

  @doc("Which side(s) of the conversation were captured.")
  @example("speak")
  direction?: FabricRecordEventDirection;
}

@doc("Describes how the recording was made. The `audio` field is present when you recorded audio.")
@summary("Fabric recording specification")
model FabricRecordEventSpec {
  @doc("The audio settings used for this recording.")
  audio?: FabricRecordEventAudio;
}

@doc("Payload of the Call Fabric `call.record` event: recording state, the recording URL, and, once finished, the file metadata.")
@summary("Call Fabric record event payload")
model CallRecordParams {
  ...FabricMediaEventAddress;

  @doc("The `control_id` of the recording this event refers to, returned when you started it.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("Where the recording currently stands.")
  @example("finished")
  state: FabricCallRecordState;

  @doc("The unique identifier of the recording.")
  @example("c2a1e9f4-6b3d-4e7a-8f1c-2d3e4f5a6b7c")
  recording_id?: string;

  @doc("Where the recording is stored. Present on every state, including `recording` and `paused`; the file is complete once the state is `finished`.")
  @example("https://example.com/recordings/c2a1e9f4.mp3")
  url?: url;

  @doc("How long the recording is, in seconds. Set once the state is `finished`.")
  @example(20.0)
  duration?: float64;

  @doc("How large the recording file is, in bytes. Set once the state is `finished`.")
  @example(123456788)
  size?: int32;

  @doc("When the recording started, as a Unix timestamp in seconds. Set once the state is `finished`.")
  @example(1712345678.842)
  start_time?: float64;

  @doc("The first captured audio, as a Unix timestamp in seconds. Present when available; more precise than `start_time`.")
  @example(1712345678.123)
  first_frame_time?: float64;

  @doc("When the recording ended, as a Unix timestamp in seconds. Set once the state is `finished`.")
  @example(1712345698.842)
  end_time?: float64;

  @doc("How paused time is handled in the recording: `silence` inserts silence for the paused span, while `skip` leaves it out entirely.")
  @example("skip")
  pause_behavior?: "silence" | "skip";

  @doc("The settings this recording was captured with.")
  record?: FabricRecordEventSpec;
}

const fabricCallRecord = "call.record";
@doc("Fires when a recording on a Call Fabric call starts, pauses, resumes, or finishes. Every state carries the recording URL; the finished event adds the duration and file size.")
@summary(fabricCallRecord)
@extension("x-fern-display-name", fabricCallRecord)
model CallRecordEvent
  is SignalwireEvent<typeof fabricCallRecord, CallRecordParams>;

// ===========================================================================
// call.collect
// ===========================================================================

@doc("Where input collection currently stands: still listening, finished, or stopped on an error.")
union FabricCallCollectState {
  "collecting",
  "error",
  "finished",
}

@doc("""
  What the caller gave you. Read `type` to know which kind of result this is. The
  `error`, `no_input`, `no_match`, `start_of_input`, and `finished` types are markers
  with no extra data, while `digit` and `speech` include a `params` object with the
  collected input.
  """)
@summary("Fabric collect result")
@discriminator("type")
model FabricCallCollectResult {
  type:
    | "digit"
    | "error"
    | "finished"
    | "no_input"
    | "no_match"
    | "speech"
    | "start_of_input";
}

@doc("The collect failed before producing input.")
@summary("Fabric collect error result")
model FabricCallCollectResultError extends FabricCallCollectResult {
  @example("error")
  type: "error";
}

@doc("No input was received before the timeout.")
@summary("Fabric collect no-input result")
model FabricCallCollectResultNoInput extends FabricCallCollectResult {
  @example("no_input")
  type: "no_input";
}

@doc("Input was received but did not match your `digits`/`speech` criteria.")
@summary("Fabric collect no-match result")
model FabricCallCollectResultNoMatch extends FabricCallCollectResult {
  @example("no_match")
  type: "no_match";
}

@doc("Signals that the caller has started giving input. You receive this only when you set `send_start_of_input: true` on the collect.")
@summary("Fabric start-of-input result")
model FabricCallCollectResultStartOfInput extends FabricCallCollectResult {
  @example("start_of_input")
  type: "start_of_input";
}

@doc("Signals that collection ended without producing input — for example the call hung up or the collect was stopped.")
@summary("Fabric collect finished result")
model FabricCallCollectResultFinished extends FabricCallCollectResult {
  @example("finished")
  type: "finished";
}

@doc("The caller's DTMF key presses. The collected digits (and any terminator) are in `params`.")
@summary("Fabric collected digit result")
model FabricCallCollectResultDigit extends FabricCallCollectResult {
  @example("digit")
  type: "digit";

  params: {
    @doc("The DTMF (touch-tone) digits the caller pressed.")
    @example("1234")
    digits: string;

    @doc("The digit that ended collection. Set to your terminator key when the caller pressed it, empty otherwise.")
    @example("#")
    terminator: string;
  };
}

@doc("The caller's recognized speech. The transcribed text and confidence are in `params`.")
@summary("Fabric collected speech result")
model FabricCallCollectResultSpeech extends FabricCallCollectResult {
  @example("speech")
  type: "speech";

  params: {
    @doc("The text the speech recognizer heard the caller say.")
    @example("I would like to speak to sales")
    text: string;

    @doc("How confident the recognizer is in the result (for example `83.2`). `0` when not scored.")
    @example(83.2)
    confidence: float64;
  };
}

@doc("Payload of the Call Fabric `call.collect` event: DTMF or speech input collected from the caller.")
@summary("Call Fabric collect event payload")
model CallCollectParams {
  ...FabricMediaAddress;

  @doc("The `control_id` of the collection this event refers to, returned when you started it.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("Where the collection currently stands. `error` means it stopped because something went wrong. Present for partial and continuous collections; a one-shot collect reports its `result` without a `state`.")
  @example("finished")
  state?: FabricCallCollectState;

  @doc("What the caller gave you. Check its `type` to handle digits, speech, or a no-input/no-match marker.")
  result?: FabricCallCollectResult;

  @doc("""
    Relevant when you requested partial or continuous results: `true` once the
    recognizer has finished the current utterance. With `continuous: true`, the
    collector then restarts to listen for the next one.
    """)
  @example(true)
  final?: boolean;
}

const fabricCallCollect = "call.collect";
@doc("Fires as you collect input from a caller on a Call Fabric call — DTMF digits or speech — reporting partial and final results so you can react to what they said or pressed.")
@summary(fabricCallCollect)
@extension("x-fern-display-name", fabricCallCollect)
model CallCollectEvent
  is SignalwireEvent<typeof fabricCallCollect, CallCollectParams>;

// ===========================================================================
// call.tap
// ===========================================================================

@doc("Where the tap is in its lifecycle: `tapping` while audio is flowing, `finished` once it stops.")
union FabricTapState {
  "tapping",
  "finished",
}

@doc("Which side of the call audio is being tapped: the caller speaking, what they hear, or both.")
union FabricCallTapDirection {
  "speak",
  "listen",
  "both",
}

@doc("Describes the media being tapped. Currently always `audio`.")
@discriminator("type")
model FabricTapMedia {
  @example("audio")
  type: "audio";
}

@doc("An audio tap.")
model FabricCallTapAudio extends FabricTapMedia {
  @example("audio")
  type: "audio";

  params: {
    @doc("Which side(s) of the call audio this tap captures.")
    @example("listen")
    direction: FabricCallTapDirection;
  };
}

@doc("Describes where the tapped audio is being sent: `rtp` or `ws`.")
@discriminator("type")
model FabricCallTapDevice {
  @example("ws")
  type: "rtp" | "ws";
}

@doc("The tapped audio is streamed to an RTP destination.")
model FabricCallTapRtpDevice extends FabricCallTapDevice {
  @example("rtp")
  type: "rtp";

  params: {
    @doc("IP address the tapped audio is sent to.")
    @example("10.10.10.10")
    addr: string;

    @doc("Port the tapped audio is sent to.")
    @example(30030)
    port: int32;

    @doc("Codec used for the tapped audio stream. Absent when it matches the tapped audio.")
    @example("PCMU")
    codec?: string;

    @doc("Packet interval, in milliseconds — how many milliseconds of audio each RTP packet carries. Absent when it matches the tapped audio.")
    @example(20)
    ptime?: int32;
  };
}

@doc("The tapped audio is streamed to a WebSocket destination.")
model FabricCallTapWsDevice extends FabricCallTapDevice {
  @example("ws")
  type: "ws";

  params: {
    @doc("WebSocket URI the tapped audio is sent to.")
    @example("wss://example.com/media")
    uri: string;

    @doc("Codec used for the tapped audio stream. Absent when it matches the tapped audio.")
    @example("PCMU")
    codec?: string;
  };
}

@doc("Payload of the Call Fabric `call.tap` event: media-tap lifecycle and where the tapped audio is sent.")
@summary("Call Fabric tap event payload")
model CallTapParams {
  ...FabricMediaEventAddress;

  @doc("The `control_id` of the tap this event belongs to.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("Whether the tap is still running (`tapping`) or has stopped (`finished`).")
  @example("tapping")
  state: FabricTapState;

  @doc("What media is being tapped.")
  tap: FabricTapMedia;

  @doc("Where the tapped audio is being sent.")
  device: FabricCallTapDevice;
}

const fabricCallTap = "call.tap";
@doc("Fires when a tap starts streaming Call Fabric call audio and again when it stops. Check `state` to tell which.")
@summary(fabricCallTap)
@extension("x-fern-display-name", fabricCallTap)
model CallTapEvent is SignalwireEvent<typeof fabricCallTap, CallTapParams>;

// ===========================================================================
// call.stream
// ===========================================================================

@doc("Whether the stream is currently `streaming` or has `finished`.")
union FabricStreamState {
  "streaming",
  "finished",
}

@doc("Payload of the Call Fabric `call.stream` event: media-stream lifecycle and the destination URL.")
@summary("Call Fabric stream event payload")
model CallStreamParams {
  ...FabricMediaEventAddress;

  @doc("The `control_id` of the stream this event belongs to.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("Whether audio is still streaming (`streaming`) or the stream has stopped (`finished`).")
  @example("streaming")
  state: FabricStreamState;

  @doc("The WebSocket URL the call audio is being streamed to. Omitted when not available.")
  @example("wss://example.com/media")
  url?: url;

  @doc("The friendly name you gave the stream, if you set one.")
  @example("my_stream")
  name?: string;
}

const fabricCallStream = "call.stream";
@doc("Fires when a media stream on a Call Fabric call starts and again when it stops. Check `state` to tell which.")
@summary(fabricCallStream)
@extension("x-fern-display-name", fabricCallStream)
model CallStreamEvent
  is SignalwireEvent<typeof fabricCallStream, CallStreamParams>;

// ===========================================================================
// call.detect
// ===========================================================================

@doc("What the fax detector heard.")
union FabricCallDetectFaxEvent {
  @doc("The answering fax machine's tone (CED).")
  "CED",

  @doc("The calling fax machine's tone (CNG).")
  "CNG",

  @doc("The detector finished.")
  "finished",
}

@doc("What the answering-machine detector concluded.")
union FabricCallDetectMachineEvent {
  @doc("An answering machine picked up.")
  "MACHINE",

  @doc("A human answered. This is a final result.")
  "HUMAN",

  @doc("The detector could not tell whether it was a human or a machine.")
  "UNKNOWN",

  @doc("""
    The machine is ready for you to leave your message. This is a final result
    when `detect_interruptions=false` or `beep=true`.
    """)
  "READY",

  @doc("""
    The machine's greeting started over and interrupted your message. You only
    receive this when `detect_interruptions=true`.
    """)
  "NOT_READY",

  @doc("The detector finished.")
  "finished",
}

@doc("""
  What the detector found. Read `type` to know which detector reported it: `fax`,
  `machine`, or `digit`. Whatever the type, the `event` field also carries the
  generic `finished` value when the detector completes.
  """)
@summary("Fabric detect result")
@discriminator("type")
model FabricCallDetectResult {
  type: "digit" | "fax" | "machine";
}

@summary("Fabric fax detection result")
model FabricCallDetectFax extends FabricCallDetectResult {
  @example("fax")
  type: "fax";

  params: {
    @doc("What the fax detector heard.")
    @example("CED")
    event: FabricCallDetectFaxEvent;
  };
}

@summary("Fabric answering-machine detection result")
model FabricCallDetectMachine extends FabricCallDetectResult {
  @example("machine")
  type: "machine";

  params: {
    @doc("What the answering-machine detector concluded.")
    @example("MACHINE")
    event: FabricCallDetectMachineEvent;

    @doc("Whether a beep was detected, signaling it's your turn to leave a message.")
    @example(true)
    beep?: boolean;
  };
}

@summary("Fabric digit detection result")
model FabricCallDetectDigit extends FabricCallDetectResult {
  @example("digit")
  type: "digit";

  params: {
    @doc("The DTMF (touch-tone) digit that was detected: one of `0`-`9`, `#`, or `*`. Carries the terminal `finished` value once the detector completes.")
    @example("5")
    event: string;
  };
}

@doc("Payload of the Call Fabric `call.detect` event: a detector result — fax tone, human vs. machine, or a DTMF digit.")
@summary("Call Fabric detect event payload")
model CallDetectParams {
  ...FabricMediaEventAddress;

  @doc("The `control_id` of the detector this event refers to, returned when you started it.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("What the detector found, including which kind of detector reported it.")
  detect: FabricCallDetectResult;
}

const fabricCallDetect = "call.detect";
@doc("Fires when a detector on a Call Fabric call reports a result — a fax tone, an answering machine versus a human, or a DTMF digit.")
@summary(fabricCallDetect)
@extension("x-fern-display-name", fabricCallDetect)
model CallDetectEvent
  is SignalwireEvent<typeof fabricCallDetect, CallDetectParams>;

// ===========================================================================
// Other call.* events delivered to Call Fabric call legs. These mirror the
// Calling API's calling.call.* events, renamed with a call. prefix and with
// room_session_id added.
// ===========================================================================

// ── call.dial ────────────────────────────────────────────────────────────────
@doc("Payload of the Call Fabric `call.dial` event: the outcome of a dial that reached your call leg.")
@summary("Call Fabric dial event payload")
model CallDialParams {
  @doc("The dial's `tag`. This event has no call ID of its own, so `call_id` carries the same value.")
  @example("my-tag-1")
  call_id: string;

  @doc("The dial's `tag`, repeated here.")
  @example("my-tag-1")
  room_session_id: string;

  @doc("The node that handled the dial.")
  @example("a3f1c2d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d")
  node_id: string;

  @doc("The `tag` set on the dial request.")
  @example("my-tag-1")
  tag: string;

  @doc("Where the dial stands.")
  @example("answered")
  dial_state: "dialing" | "answered" | "failed";

  @doc("The call leg the dial reached, in the same shape as the `call.state` payload without `room_session_id` or the timing and quality fields.")
  call?: Record<unknown>;

  @doc("Why the dial failed. Present when `dial_state` is `failed`.")
  @example("noAnswer")
  reason?: string;

  @doc("Which side ended the dial: `inbound`, `outbound`, or `none`. Present together with `reason`.")
  @example("outbound")
  source?: "inbound" | "outbound" | "none";
}

const fabricCallDial = "call.dial";
@doc("Fires when a dial reaches a Call Fabric call leg, reporting whether it was answered or failed.")
@summary(fabricCallDial)
@extension("x-fern-display-name", fabricCallDial)
model CallDialEvent is SignalwireEvent<typeof fabricCallDial, CallDialParams>;

// ── call.send_digits ─────────────────────────────────────────────────────────
@doc("Payload of the Call Fabric `call.send_digits` event.")
@summary("Call Fabric send-digits event payload")
model CallSendDigitsParams {
  ...FabricMediaAddress;

  @doc("The `control_id` of the send-digits operation.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("`finished` once all digits were sent, `error` if sending failed.")
  @example("finished")
  state: "finished" | "error";
}

const fabricCallSendDigits = "call.send_digits";
@doc("Fires when sending DTMF digits on a Call Fabric call leg finishes or fails.")
@summary(fabricCallSendDigits)
@extension("x-fern-display-name", fabricCallSendDigits)
model CallSendDigitsEvent
  is SignalwireEvent<typeof fabricCallSendDigits, CallSendDigitsParams>;

// ── call.refer ───────────────────────────────────────────────────────────────
@doc("Payload of the Call Fabric `call.refer` event: the progress of a SIP REFER transfer.")
@summary("Call Fabric refer event payload")
model CallReferParams {
  ...FabricMediaEventAddress;

  @doc("Where the transfer stands.")
  @example("success")
  state: "inProgress" | "cancel" | "busy" | "noAnswer" | "error" | "success";

  @doc("The SIP URI the call is being transferred to.")
  @example("sip:bob@example.com")
  sip_refer_to: string;

  @doc("The SIP response code to the REFER, as a string. Present once received.")
  @example("202")
  sip_refer_response_code?: string;

  @doc("The SIP response code reported by the NOTIFY messages that follow the REFER, as a string. Present once received.")
  @example("200")
  sip_notify_response_code?: string;
}

const fabricCallRefer = "call.refer";
@doc("Fires each time a SIP REFER transfer of a Call Fabric call leg changes state.")
@summary(fabricCallRefer)
@extension("x-fern-display-name", fabricCallRefer)
model CallReferEvent is SignalwireEvent<typeof fabricCallRefer, CallReferParams>;

// ── call.denoise ─────────────────────────────────────────────────────────────
@doc("Payload of the Call Fabric `call.denoise` event.")
@summary("Call Fabric denoise event payload")
model CallDenoiseParams {
  ...FabricMediaEventAddress;

  @doc("Whether noise reduction is now on.")
  @example(true)
  denoised: boolean;
}

const fabricCallDenoise = "call.denoise";
@doc("Fires when noise reduction is turned on or off on a Call Fabric call leg.")
@summary(fabricCallDenoise)
@extension("x-fern-display-name", fabricCallDenoise)
model CallDenoiseEvent
  is SignalwireEvent<typeof fabricCallDenoise, CallDenoiseParams>;

// ── call.echo ────────────────────────────────────────────────────────────────
@doc("Payload of the Call Fabric `call.echo` event.")
@summary("Call Fabric echo event payload")
model CallEchoParams {
  ...FabricMediaEventAddress;

  @doc("Whether audio is still being echoed back (`echoing`) or the echo has stopped (`finished`).")
  @example("echoing")
  state: "echoing" | "finished";
}

const fabricCallEcho = "call.echo";
@doc("Fires when audio echo starts on a Call Fabric call leg and again when it stops.")
@summary(fabricCallEcho)
@extension("x-fern-display-name", fabricCallEcho)
model CallEchoEvent is SignalwireEvent<typeof fabricCallEcho, CallEchoParams>;

// ── call.room ────────────────────────────────────────────────────────────────
@doc("Payload of the Call Fabric `call.room` event.")
@summary("Call Fabric room event payload")
model CallRoomParams {
  ...FabricMediaEventAddress;

  @doc("The outcome: the call `joined` the room, `failed` to join, chose to `leave`, was canceled (`cancel`) before joining, or was refused because the room was `locked`.")
  @example("joined")
  join_status: "joined" | "failed" | "leave" | "cancel" | "locked";

  @doc("The name of the room.")
  @example("my_room")
  room_name: string;
}

const fabricCallRoom = "call.room";
@doc("Fires when a Call Fabric call leg joins, leaves, or is prevented from joining a room.")
@summary(fabricCallRoom)
@extension("x-fern-display-name", fabricCallRoom)
model CallRoomEvent is SignalwireEvent<typeof fabricCallRoom, CallRoomParams>;

// ── call.transcribe ──────────────────────────────────────────────────────────
@doc("Payload of the Call Fabric `call.transcribe` event.")
@summary("Call Fabric transcribe event payload")
model CallTranscribeParams {
  ...FabricMediaEventAddress;

  @doc("The `control_id` of the transcription.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("Whether transcription is running (`transcribing`) or has stopped (`finished`).")
  @example("finished")
  state: "transcribing" | "finished";

  @doc("Where the recording captured with the transcription is stored.")
  url?: string;

  @doc("The ID of the recording captured with the transcription.")
  recording_id?: string;

  @doc("The status callback URL set on the transcription, if any.")
  status_url?: string;

  @doc("Recording length in seconds. Present when `state` is `finished`.")
  @example(30.0)
  duration?: float64;

  @doc("Recording size in bytes. Present when `state` is `finished`.")
  @example(123456)
  size?: int64;

  @doc("When the recording started, as a Unix timestamp in seconds. Present when `state` is `finished`.")
  start_time?: float64;

  @doc("When the recording ended, as a Unix timestamp in seconds. Present when `state` is `finished`.")
  end_time?: float64;
}

const fabricCallTranscribe = "call.transcribe";
@doc("Fires when transcription on a Call Fabric call leg starts and again when it finishes.")
@summary(fabricCallTranscribe)
@extension("x-fern-display-name", fabricCallTranscribe)
model CallTranscribeEvent
  is SignalwireEvent<typeof fabricCallTranscribe, CallTranscribeParams>;

// ── call.queue ───────────────────────────────────────────────────────────────
@doc("Payload of the Call Fabric `call.queue` event.")
@summary("Call Fabric queue event payload")
model CallQueueParams {
  ...FabricMediaAddress;

  @doc("The `control_id` of the queue session.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("What happened: `enqueue`, `dequeue`, `leave`, or `stats` (a periodic position update). Handle unknown values gracefully.")
  @example("enqueue")
  status: string;

  @doc("The queue ID.")
  id: string;

  @doc("The queue name.")
  @example("support")
  name: string;

  @doc("The call's position in line, counting from the front.")
  position: int32;

  @doc("How many calls are waiting in the queue.")
  size: int32;

  @doc("Average time calls spend in the queue, in seconds.")
  avg_time: int32;

  @doc("When the call entered the queue, as a Unix timestamp in microseconds. `0` until then.")
  enqueue_ts: int64;

  @doc("When the call was pulled from the queue, as a Unix timestamp in microseconds. `0` until then.")
  dequeue_ts: int64;

  @doc("When the call left the queue, as a Unix timestamp in microseconds. `0` until then.")
  leave_ts: int64;

  @doc("The status callback URL set for the queue. Empty when none was set.")
  status_url: string;
}

const fabricCallQueue = "call.queue";
@doc("Fires as a Call Fabric call leg moves through a queue: when it joins, is pulled to be connected, or leaves, plus periodic position updates.")
@summary(fabricCallQueue)
@extension("x-fern-display-name", fabricCallQueue)
model CallQueueEvent is SignalwireEvent<typeof fabricCallQueue, CallQueueParams>;

// ── call.fax ─────────────────────────────────────────────────────────────────
@doc("""
  Details of a fax event. `type` is `page` after each page, with `params.direction` and
  `params.number`; or `finished` at the end, with `params.direction`, `identity`,
  `remote_identity`, `document`, `format`, `pages`, `success`, `result`, and `result_text`.
  """)
@summary("Call Fabric fax details")
model FabricFaxDetails {
  @doc("Which stage this event reports.")
  @example("finished")
  type: "page" | "finished";

  @doc("The stage-specific details.")
  params: Record<unknown>;
}

@doc("Payload of the Call Fabric `call.fax` event.")
@summary("Call Fabric fax event payload")
model CallFaxParams {
  ...FabricMediaEventAddress;

  @doc("The `control_id` of the fax.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("The fax progress or result.")
  fax: FabricFaxDetails;
}

const fabricCallFax = "call.fax";
@doc("Fires as a fax on a Call Fabric call leg progresses: once per page, then once when it finishes.")
@summary(fabricCallFax)
@extension("x-fern-display-name", fabricCallFax)
model CallFaxEvent is SignalwireEvent<typeof fabricCallFax, CallFaxParams>;

// ── call.pay ─────────────────────────────────────────────────────────────────
@doc("""
  Payload of the Call Fabric `call.pay` event. Progress events carry `for`, `error_type`
  (which may be empty), `attempt`, and the masked data collected so far; the final event
  carries `result` and the masked payment details (`payment_card_number`,
  `payment_card_type`, `payment_token`, `payment_confirmation_code`, `payment_error`, and
  so on). Card data is always masked.
  """)
@summary("Call Fabric pay event payload")
model CallPayParams {
  ...FabricMediaAddress;

  @doc("The `control_id` of the pay session.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  ...Record<unknown>;
}

const fabricCallPay = "call.pay";
@doc("Fires as a pay session on a Call Fabric call leg progresses and once more when it completes.")
@summary(fabricCallPay)
@extension("x-fern-display-name", fabricCallPay)
model CallPayEvent is SignalwireEvent<typeof fabricCallPay, CallPayParams>;

// ── call.ai ──────────────────────────────────────────────────────────────────
@doc("Payload of the Call Fabric `call.ai` event: how an AI agent session ended.")
@summary("Call Fabric AI event payload")
model CallAiParams {
  ...FabricMediaEventAddress;

  @doc("The `control_id` of the AI session.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("`finished` when the session ended normally, `error` when it ended abnormally.")
  @example("finished")
  state: "finished" | "error";
}

const fabricCallAi = "call.ai";
@doc("Fires when an AI agent session on a Call Fabric call leg ends.")
@summary(fabricCallAi)
@extension("x-fern-display-name", fabricCallAi)
model CallAiEvent is SignalwireEvent<typeof fabricCallAi, CallAiParams>;

// ── user_event ───────────────────────────────────────────────────────────────
@doc("Payload of the Call Fabric `user_event` event: the custom object the sender provided, plus the call address.")
@summary("Call Fabric user event payload")
model FabricUserEventParams {
  ...FabricMediaEventAddress;
  ...Record<unknown>;
}

const fabricUserEvent = "user_event";
@doc("Fires when a custom user event is emitted on a Call Fabric call leg, for example by a SWML `user_event` method or an AI agent action. The payload is whatever object the sender provided.")
@summary(fabricUserEvent)
@extension("x-fern-display-name", fabricUserEvent)
model FabricUserEvent
  is SignalwireEvent<typeof fabricUserEvent, FabricUserEventParams>;

// ── ai.* ─────────────────────────────────────────────────────────────────────
@doc("""
  Payload of an `ai.*` event on a Call Fabric call leg: the call address plus the
  event-specific fields. Each event carries the same fields as the matching
  `calling.ai.*` event in the Calling API.
  """)
@summary("Call Fabric AI activity event payload")
model FabricAiEventParams {
  ...FabricMediaEventAddress;
  ...Record<unknown>;
}

const fabricAiCompletion = "ai.completion";
@doc("Fires on a Call Fabric call leg when the agent completes a response turn, with the response `text` and whether it was `barged`. Same fields as the Calling API's `calling.ai.completion` event.")
@summary(fabricAiCompletion)
@extension("x-fern-display-name", fabricAiCompletion)
model FabricAiCompletionEvent
  is SignalwireEvent<typeof fabricAiCompletion, FabricAiEventParams>;

const fabricAiResponse = "ai.response";
@doc("Fires on a Call Fabric call leg when the agent produces its full response text for a turn. Same fields as the Calling API's `calling.ai.response` event.")
@summary(fabricAiResponse)
@extension("x-fern-display-name", fabricAiResponse)
model FabricAiResponseEvent
  is SignalwireEvent<typeof fabricAiResponse, FabricAiEventParams>;

const fabricAiResponseUtterance = "ai.response_utterance";
@doc("Fires on a Call Fabric call leg when the agent speaks one segment of its response. Same fields as the Calling API's `calling.ai.response_utterance` event.")
@summary(fabricAiResponseUtterance)
@extension("x-fern-display-name", fabricAiResponseUtterance)
model FabricAiResponseUtteranceEvent
  is SignalwireEvent<typeof fabricAiResponseUtterance, FabricAiEventParams>;

const fabricAiSpeechDetect = "ai.speech_detect";
@doc("Fires on a Call Fabric call leg when the caller's final transcript for a turn is recognized. Same fields as the Calling API's `calling.ai.speech_detect` event.")
@summary(fabricAiSpeechDetect)
@extension("x-fern-display-name", fabricAiSpeechDetect)
model FabricAiSpeechDetectEvent
  is SignalwireEvent<typeof fabricAiSpeechDetect, FabricAiEventParams>;

const fabricAiPartialResult = "ai.partial_result";
@doc("Fires on a Call Fabric call leg when an interim transcript of the caller's speech is available. Same fields as the Calling API's `calling.ai.partial_result` event.")
@summary(fabricAiPartialResult)
@extension("x-fern-display-name", fabricAiPartialResult)
model FabricAiPartialResultEvent
  is SignalwireEvent<typeof fabricAiPartialResult, FabricAiEventParams>;

const fabricAiBeginSpeaking = "ai.begin_speaking";
@doc("Fires on a Call Fabric call leg when speaking starts in the AI session. Same fields as the Calling API's `calling.ai.begin_speaking` event.")
@summary(fabricAiBeginSpeaking)
@extension("x-fern-display-name", fabricAiBeginSpeaking)
model FabricAiBeginSpeakingEvent
  is SignalwireEvent<typeof fabricAiBeginSpeaking, FabricAiEventParams>;

const fabricAiWarning = "ai.warning";
@doc("Fires on a Call Fabric call leg when the AI session reports a non-fatal warning. Same fields as the Calling API's `calling.ai.warning` event.")
@summary(fabricAiWarning)
@extension("x-fern-display-name", fabricAiWarning)
model FabricAiWarningEvent
  is SignalwireEvent<typeof fabricAiWarning, FabricAiEventParams>;

const fabricAiTransparentBarge = "ai.transparent_barge";
@doc("Fires on a Call Fabric call leg when the caller interrupts the agent and the turn is handled as a transparent barge. Same fields as the Calling API's `calling.ai.transparent_barge` event.")
@summary(fabricAiTransparentBarge)
@extension("x-fern-display-name", fabricAiTransparentBarge)
model FabricAiTransparentBargeEvent
  is SignalwireEvent<typeof fabricAiTransparentBarge, FabricAiEventParams>;

const fabricAiStop = "ai.stop";
@doc("Fires on a Call Fabric call leg when the AI session stops, with session timing and billing detail. Same fields as the Calling API's `calling.ai.stop` event.")
@summary(fabricAiStop)
@extension("x-fern-display-name", fabricAiStop)
model FabricAiStopEvent
  is SignalwireEvent<typeof fabricAiStop, FabricAiEventParams>;

const fabricAiPostPrompt = "ai.post_prompt";
@doc("Fires on a Call Fabric call leg when the end-of-call summary is produced. Same fields as the Calling API's `calling.ai.post_prompt` event.")
@summary(fabricAiPostPrompt)
@extension("x-fern-display-name", fabricAiPostPrompt)
model FabricAiPostPromptEvent
  is SignalwireEvent<typeof fabricAiPostPrompt, FabricAiEventParams>;

const fabricAiSwaig = "ai.swaig";
@doc("Fires on a Call Fabric call leg when a SWAIG function is called. Same fields as the Calling API's `calling.ai.swaig` event.")
@summary(fabricAiSwaig)
@extension("x-fern-display-name", fabricAiSwaig)
model FabricAiSwaigEvent
  is SignalwireEvent<typeof fabricAiSwaig, FabricAiEventParams>;

const fabricAiSwaigAction = "ai.swaig_action";
@doc("Fires on a Call Fabric call leg when a SWAIG function returns an action. Same fields as the Calling API's `calling.ai.swaig_action` event.")
@summary(fabricAiSwaigAction)
@extension("x-fern-display-name", fabricAiSwaigAction)
model FabricAiSwaigActionEvent
  is SignalwireEvent<typeof fabricAiSwaigAction, FabricAiEventParams>;

const fabricAiSidecar = "ai.sidecar";
@doc("Fires on a Call Fabric call leg when the AI sidecar reports activity. Same fields as the Calling API's `calling.ai.sidecar` event.")
@summary(fabricAiSidecar)
@extension("x-fern-display-name", fabricAiSidecar)
model FabricAiSidecarEvent
  is SignalwireEvent<typeof fabricAiSidecar, FabricAiEventParams>;

const fabricAiTranscribeUtterance = "ai.transcribe.utterance";
@doc("Fires on a Call Fabric call leg when live transcription produces an utterance. Same fields as the Calling API's `calling.ai.transcribe.utterance` event.")
@summary(fabricAiTranscribeUtterance)
@extension("x-fern-display-name", fabricAiTranscribeUtterance)
model FabricAiTranscribeUtteranceEvent
  is SignalwireEvent<typeof fabricAiTranscribeUtterance, FabricAiEventParams>;

const fabricAiTranscribeLiveSummarize = "ai.transcribe.live_summarize";
@doc("Fires on a Call Fabric call leg when live transcription produces a running summary. Same fields as the Calling API's `calling.ai.transcribe.live_summarize` event.")
@summary(fabricAiTranscribeLiveSummarize)
@extension("x-fern-display-name", fabricAiTranscribeLiveSummarize)
model FabricAiTranscribeLiveSummarizeEvent
  is SignalwireEvent<typeof fabricAiTranscribeLiveSummarize, FabricAiEventParams>;

const fabricAiTranscribeConversationLog = "ai.transcribe.conversation_log";
@doc("Fires on a Call Fabric call leg when live transcription delivers its conversation log. Same fields as the Calling API's `calling.ai.transcribe.conversation_log` event.")
@summary(fabricAiTranscribeConversationLog)
@extension("x-fern-display-name", fabricAiTranscribeConversationLog)
model FabricAiTranscribeConversationLogEvent
  is SignalwireEvent<typeof fabricAiTranscribeConversationLog, FabricAiEventParams>;

const fabricAiTranslateTranscriptDelta = "ai.translate.transcript_delta";
@doc("Fires on a Call Fabric call leg when live translation produces translated text. Same fields as the Calling API's `calling.ai.translate.transcript_delta` event.")
@summary(fabricAiTranslateTranscriptDelta)
@extension("x-fern-display-name", fabricAiTranslateTranscriptDelta)
model FabricAiTranslateTranscriptDeltaEvent
  is SignalwireEvent<typeof fabricAiTranslateTranscriptDelta, FabricAiEventParams>;

const fabricAiTranslateLiveSummary = "ai.translate.live_summary";
@doc("Fires on a Call Fabric call leg when live translation produces a running summary. Same fields as the Calling API's `calling.ai.translate.live_summary` event.")
@summary(fabricAiTranslateLiveSummary)
@extension("x-fern-display-name", fabricAiTranslateLiveSummary)
model FabricAiTranslateLiveSummaryEvent
  is SignalwireEvent<typeof fabricAiTranslateLiveSummary, FabricAiEventParams>;

const fabricAiTranslateConversationLog = "ai.translate.conversation_log";
@doc("Fires on a Call Fabric call leg when live translation delivers its conversation log. Same fields as the Calling API's `calling.ai.translate.conversation_log` event.")
@summary(fabricAiTranslateConversationLog)
@extension("x-fern-display-name", fabricAiTranslateConversationLog)
model FabricAiTranslateConversationLogEvent
  is SignalwireEvent<typeof fabricAiTranslateConversationLog, FabricAiEventParams>;

// ===========================================================================
// Conference events (room.*, rooms.*, member.promoted/demoted, recording.*,
// playback.*, stream.*)
// ===========================================================================

// ── room.started ─────────────────────────────────────────────────────────────
@doc("Payload of the `room.started` event: the room session that just started.")
@summary("Room started event payload")
model RoomStartedParams {
  @doc("The room ID.")
  room_id: string;

  @doc("The room session ID.")
  room_session_id: string;

  @doc("The room session that started, with its full state.")
  room_session: RoomSession;

  @doc("Deprecated. A legacy copy of `room_session` that carries `room_session_id` in place of `id`. Use `room_session` instead.")
  room?: Record<unknown>;
}

const fabricRoomStarted = "room.started";
@doc("Fires when a Call Fabric room session starts. Delivers the room session's initial state.")
@summary(fabricRoomStarted)
@extension("x-fern-display-name", fabricRoomStarted)
model RoomStartedEvent
  is SignalwireEvent<typeof fabricRoomStarted, RoomStartedParams>;

// ── room.subscribed ──────────────────────────────────────────────────────────
@doc("Payload of the `room.subscribed` event: the room session you subscribed to, plus your member and call identifiers.")
@summary("Room subscribed event payload")
model RoomSubscribedParams {
  @doc("The room session you subscribed to, with its full state.")
  room_session: RoomSession;

  @doc("Your member ID in this room session. Present when subscribing as a member.")
  member_id?: string;

  @doc("Your call ID in this room session. Present when subscribing as a member.")
  call_id?: string;

  @doc("Deprecated. A legacy copy of `room_session` that carries `room_session_id` in place of `id`. Use `room_session` instead.")
  room?: Record<unknown>;
}

const fabricRoomSubscribed = "room.subscribed";
@doc("Fires when you subscribe to a Call Fabric room session, delivering the room's current state and your member/call identifiers.")
@summary(fabricRoomSubscribed)
@extension("x-fern-display-name", fabricRoomSubscribed)
model RoomSubscribedEvent
  is SignalwireEvent<typeof fabricRoomSubscribed, RoomSubscribedParams>;

// ── room.ended ───────────────────────────────────────────────────────────────
@doc("Payload of the `room.ended` event: the room session that ended.")
@summary("Room ended event payload")
model RoomEndedParams {
  @doc("The room ID.")
  room_id: string;

  @doc("The room session ID.")
  room_session_id: string;

  @doc("The room session that ended, with its final state.")
  room_session: RoomSession;

  @doc("Deprecated. A legacy copy of `room_session` that carries `room_session_id` in place of `id`. Use `room_session` instead.")
  room?: Record<unknown>;
}

const fabricRoomEnded = "room.ended";
@doc("Fires when a Call Fabric room session ends. Delivers the room session's final state.")
@summary(fabricRoomEnded)
@extension("x-fern-display-name", fabricRoomEnded)
model RoomEndedEvent
  is SignalwireEvent<typeof fabricRoomEnded, RoomEndedParams>;

// ── rooms.subscribed ─────────────────────────────────────────────────────────
@doc("Payload of the `rooms.subscribed` event: a snapshot of every active room session in the project.")
@summary("Rooms subscribed event payload")
model RoomsSubscribedParams {
  @doc("Every active room session in the project at subscribe time.")
  room_sessions: RoomSession[];

  @doc("Deprecated. Legacy copies of `room_sessions` that carry `room_session_id` in place of `id`. Use `room_sessions` instead.")
  rooms?: Record<unknown>[];
}

const fabricRoomsSubscribed = "rooms.subscribed";
@doc("Fires when you subscribe to a project's room list, delivering a snapshot of every active room session.")
@summary(fabricRoomsSubscribed)
@extension("x-fern-display-name", fabricRoomsSubscribed)
model RoomsSubscribedEvent
  is SignalwireEvent<typeof fabricRoomsSubscribed, RoomsSubscribedParams>;

// ── member.promoted ──────────────────────────────────────────────────────────
@doc("Payload of the `member.promoted` event: the member that was promoted from audience to participant.")
@summary("Member promoted event payload")
model MemberPromotedParams {
  @doc("The room ID.")
  room_id: string;

  @doc("The room session ID.")
  room_session_id: string;

  @doc("The ID of the member that was promoted.")
  member_id: string;

  @doc("Your refreshed authorization for this connection, reflecting the capabilities gained by the promotion. Treat it as opaque. A `signalwire.authorization.state` event with the matching reconnect state follows.")
  authorization: Record<unknown>;
}

const fabricMemberPromoted = "member.promoted";
@doc("Fires on the promoted participant's own connection when it is promoted from audience to full member. Delivers the member ID and the connection's refreshed `authorization`; a `signalwire.authorization.state` event follows.")
@summary(fabricMemberPromoted)
@extension("x-fern-display-name", fabricMemberPromoted)
model MemberPromotedEvent
  is SignalwireEvent<typeof fabricMemberPromoted, MemberPromotedParams>;

// ── member.demoted ───────────────────────────────────────────────────────────
@doc("Payload of the `member.demoted` event: the member that was demoted from participant to audience.")
@summary("Member demoted event payload")
model MemberDemotedParams {
  @doc("The room ID.")
  room_id: string;

  @doc("The room session ID.")
  room_session_id: string;

  @doc("The ID of the member that was demoted.")
  member_id: string;

  @doc("Your refreshed authorization for this connection, reflecting the capabilities lost by the demotion. Treat it as opaque. A `signalwire.authorization.state` event with the matching reconnect state follows.")
  authorization: Record<unknown>;
}

const fabricMemberDemoted = "member.demoted";
@doc("Fires on the demoted member's own connection when it is demoted to an audience participant. Delivers the member ID and the connection's refreshed `authorization`; a `signalwire.authorization.state` event follows.")
@summary(fabricMemberDemoted)
@extension("x-fern-display-name", fabricMemberDemoted)
model MemberDemotedEvent
  is SignalwireEvent<typeof fabricMemberDemoted, MemberDemotedParams>;

// ── recording.started / recording.updated / recording.ended ──────────────────
@doc("Payload of the `recording.*` events: the room and the recording that changed state.")
@summary("Recording event payload")
model RecordingEventParams {
  @doc("The room ID.")
  room_id: string;

  @doc("The room session ID.")
  room_session_id: string;

  @doc("The recording, with its current state.")
  recording: RecordingInfo;
}

const fabricRecordingStarted = "recording.started";
@doc("Fires when a recording starts in a Call Fabric room.")
@summary(fabricRecordingStarted)
@extension("x-fern-display-name", fabricRecordingStarted)
model RecordingStartedEvent
  is SignalwireEvent<typeof fabricRecordingStarted, RecordingEventParams>;

const fabricRecordingUpdated = "recording.updated";
@doc("Fires when a recording's state changes, for example when it is paused or resumed.")
@summary(fabricRecordingUpdated)
@extension("x-fern-display-name", fabricRecordingUpdated)
model RecordingUpdatedEvent
  is SignalwireEvent<typeof fabricRecordingUpdated, RecordingEventParams>;

const fabricRecordingEnded = "recording.ended";
@doc("Fires when a recording ends, delivering the recording's final state including its duration.")
@summary(fabricRecordingEnded)
@extension("x-fern-display-name", fabricRecordingEnded)
model RecordingEndedEvent
  is SignalwireEvent<typeof fabricRecordingEnded, RecordingEventParams>;

// ── playback.started / playback.updated / playback.ended ─────────────────────
@doc("Payload of the `playback.*` events: the room and the playback that changed state.")
@summary("Playback event payload")
model PlaybackEventParams {
  @doc("The room ID.")
  room_id: string;

  @doc("The room session ID.")
  room_session_id: string;

  @doc("The playback, with its current state.")
  playback: PlaybackInfo;
}

const fabricPlaybackStarted = "playback.started";
@doc("Fires when media playback starts in a Call Fabric room.")
@summary(fabricPlaybackStarted)
@extension("x-fern-display-name", fabricPlaybackStarted)
model PlaybackStartedEvent
  is SignalwireEvent<typeof fabricPlaybackStarted, PlaybackEventParams>;

const fabricPlaybackUpdated = "playback.updated";
@doc("Fires when a playback's state changes — pause, resume, volume, or seek position.")
@summary(fabricPlaybackUpdated)
@extension("x-fern-display-name", fabricPlaybackUpdated)
model PlaybackUpdatedEvent
  is SignalwireEvent<typeof fabricPlaybackUpdated, PlaybackEventParams>;

const fabricPlaybackEnded = "playback.ended";
@doc("Fires when a playback ends. Note the wire event type is `playback.ended` (the underlying operation is playback-stopped).")
@summary(fabricPlaybackEnded)
@extension("x-fern-display-name", fabricPlaybackEnded)
model PlaybackEndedEvent
  is SignalwireEvent<typeof fabricPlaybackEnded, PlaybackEventParams>;

// ── stream.started / stream.ended ────────────────────────────────────────────
@doc("Payload of the `stream.*` events: the room and the stream that changed state.")
@summary("Stream event payload")
model StreamEventParams {
  @doc("The room ID.")
  room_id: string;

  @doc("The room session ID.")
  room_session_id: string;

  @doc("The stream, with its current state.")
  stream: StreamInfo;
}

const fabricStreamStarted = "stream.started";
@doc("Fires when an RTMP stream starts in a Call Fabric room.")
@summary(fabricStreamStarted)
@extension("x-fern-display-name", fabricStreamStarted)
model StreamStartedEvent
  is SignalwireEvent<typeof fabricStreamStarted, StreamEventParams>;

const fabricStreamEnded = "stream.ended";
@doc("Fires when an RTMP stream ends, delivering the stream's final state including its duration.")
@summary(fabricStreamEnded)
@extension("x-fern-display-name", fabricStreamEnded)
model StreamEndedEvent
  is SignalwireEvent<typeof fabricStreamEnded, StreamEventParams>;

// ===========================================================================
// conversation.* events (Call Fabric subscriber, delivered on sw_ics_<subscriber_id>)
// ===========================================================================

@doc("""
  Payload of the `conversation.broadcast` event. The server merges the broadcast payload
  with the stream metadata into a single open object, so the concrete keys are
  caller-defined. (`conversation.message` and `conversation.message.updated` carry the
  documented `ConversationMessagePayload` instead.)
  """)
@summary("Call Fabric conversation stream payload")
model ConversationStreamParams {
  ...Record<unknown>;
}

@doc("""
  Envelope flag carried alongside `params` on `conversation.message`,
  `conversation.message.updated`, and `conversation.joined`. `true` when the subscriber
  receiving the event is the author of the message; `false` otherwise. Not present on
  `conversation.broadcast`.
  """)
@summary("Conversation author flag")
model ConversationAuthorFlag {
  @doc("Whether the receiving subscriber authored this message.")
  @example(true)
  is_author: boolean;
}

@doc("""
  The merged payload of a `conversation.message` / `conversation.message.updated` event.
  The server merges the sender's message with the conversation's stream metadata into a
  single open object, so additional keys may be present. The fields below are the stable
  ones the Call Fabric browser SDK surfaces; all are optional because additional keys may
  be merged in from the sender and stream metadata.
  """)
@summary("Conversation message payload")
model ConversationMessagePayload {
  @doc("The message ID.")
  id?: string;

  @doc("The message type.")
  type?: string;

  @doc("The message subtype. Always `update` on `conversation.message.updated`.")
  subtype?: string;

  @doc("The message kind.")
  kind?: string;

  @doc("When the message was created, as a Unix timestamp in seconds with a fractional part.")
  @example(1712345678.842113)
  ts?: float64;

  @doc("The message text. `null` on `conversation.message.updated`.")
  text?: string | null;

  @doc("Human-readable name of the conversation. May be `null`.")
  conversation_name?: string | null;

  @doc("Display name of the sender.")
  user_name?: string;

  @doc("Additional message details.")
  details?: Record<unknown>;

  @doc("Customer-provided metadata for the message.")
  metadata?: Record<unknown>;

  @doc("Identifier of the conversation group.")
  group_id?: string;

  @doc("The Resource address the message was sent from.")
  from_fabric_address_id?: string;

  @doc("Whether the message is hidden. On `conversation.message` this may arrive as the string `\"false\"` rather than a boolean.")
  hidden?: boolean | "true" | "false";

  ...Record<unknown>;
}

const fabricConversationMessage = "conversation.message";
@doc("""
  Fires on a subscriber's Conversation stream when a new message is published to a
  conversation the subscriber is part of. `params` carries the merged message payload and
  stream metadata. The envelope `timestamp` is a string of Unix seconds with a fractional
  part, for example `"1712345678.842113"`.
  """)
@summary(fabricConversationMessage)
@extension("x-fern-display-name", fabricConversationMessage)
model ConversationMessageEvent
  is ConversationEvent<
    typeof fabricConversationMessage,
    ConversationMessagePayload,
    ConversationAuthorFlag
  >;

const fabricConversationMessageUpdated = "conversation.message.updated";
@doc("""
  Fires when a previously published conversation message is edited. `params` carries the
  updated, merged message payload and stream metadata; `subtype` is `update` and `text`
  is `null`. The envelope `timestamp` is a string of Unix milliseconds, for example
  `"1712345678842"`.
  """)
@summary(fabricConversationMessageUpdated)
@extension("x-fern-display-name", fabricConversationMessageUpdated)
model ConversationMessageUpdatedEvent
  is ConversationEvent<
    typeof fabricConversationMessageUpdated,
    ConversationMessagePayload,
    ConversationAuthorFlag
  >;

const fabricConversationBroadcast = "conversation.broadcast";
@doc("""
  Fires when a message is broadcast to every subscriber who shares a conversation with the
  sending address. `params` carries the merged broadcast payload and stream metadata. The
  envelope `timestamp` is a string of Unix milliseconds, for example `"1712345678842"`.
  """)
@summary(fabricConversationBroadcast)
@extension("x-fern-display-name", fabricConversationBroadcast)
model ConversationBroadcastEvent
  is ConversationEvent<
    typeof fabricConversationBroadcast,
    ConversationStreamParams
  >;

@doc("Payload of the `conversation.joined` event: the subscriber and conversation joined.")
@summary("Call Fabric conversation joined payload")
model ConversationJoinedParams {
  @doc("The subscriber that joined the conversation.")
  @example("b1c2d3e4-f5a6-7b8c-9d0e-1f2a3b4c5d6e")
  fabric_subscriber_id: string;

  @doc("The Resource address the subscriber joined from.")
  @example("c3d4e5f6-a7b8-9c0d-1e2f-3a4b5c6d7e8f")
  from_fabric_address_id: string;

  @doc("Identifier of the conversation group that was joined.")
  @example("d4e5f6a7-b8c9-0d1e-2f3a-4b5c6d7e8f90")
  group_id: string;

  @doc("Human-readable name of the conversation.")
  @example("Sales thread")
  conversation_name: string;
}

const fabricConversationJoined = "conversation.joined";
@doc("""
  Fires when a subscriber is added to a conversation. `params` identifies the subscriber, the
  originating address, and the conversation group and name. The envelope `timestamp` is a
  string of Unix seconds with a fractional part, for example `"1712345678.842"`.
  """)
@summary(fabricConversationJoined)
@extension("x-fern-display-name", fabricConversationJoined)
model ConversationJoinedEvent
  is ConversationEvent<
    typeof fabricConversationJoined,
    ConversationJoinedParams,
    ConversationAuthorFlag
  >;
