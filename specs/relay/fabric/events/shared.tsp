import "@signalwire/typespec-asyncapi";
import "../../common/frames.tsp";
import "@typespec/openapi";

import "../models/core.tsp";
import "../models/entities.tsp";

using TypeSpec.OpenAPI;

namespace Relay.Fabric;

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
  @doc("The call this event is about. Present on essentially every event.")
  @example("c2a1e9f4-6b3d-4e7a-8f1c-2d3e4f5a6b7c")
  call_id?: string;

  @doc("The node the call leg lives on.")
  @example("a3f1c2d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d")
  node_id: string;

  @doc("The room session this call leg belongs to. In a 1:1 call this is the call ID.")
  room_session_id?: string;

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

  @doc("When the call started, in epoch milliseconds.")
  @example(1712345678123)
  start_time?: int64;

  @doc("When the call was answered, in epoch milliseconds. Present once the call has been answered.")
  @example(1712345680456)
  answer_time?: int64;

  @doc("When the call ended, in epoch milliseconds. Present once the call has ended.")
  @example(1712345695789)
  end_time?: int64;

  @doc("Why the call ended: one of `hangup`, `cancel`, `busy`, `decline`, `noAnswer`, `error`. Present once the call has ended.")
  @example("hangup")
  end_reason?: string;

  @doc("Which side ended the call — `inbound` or `outbound`. Present once the call has ended.")
  @example("outbound")
  end_source?: string;

  @doc("Set to the string `\"true\"` on the call leg that won a dial race. Absent otherwise. Note the value is the string `\"true\"`, not a JSON boolean.")
  @example("true")
  dial_winner?: "true";

  @doc("Inbound-audio Mean Opinion Score (voice quality). Present when RTP quality stats are available.")
  @example(4)
  audio_in_mos?: int32;

  @doc("The device handling this call leg.")
  device?: FabricCallDevice;

  @doc("Present when this leg is directly connected to another call.")
  peer?: FabricPeerRef;

  @doc("Present when this call was created by another call.")
  parent?: FabricParentRef;
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

  @doc("The capabilities granted to you on this call — the operations you are permitted to perform.")
  capabilities: string[];

  @doc("The call ID this call originated from. Present when it resolves.")
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

  @doc("The call ID this call originated from. Present when it resolves.")
  origin_call_id?: string;

  @doc("Why you left the call, when a reason is supplied.")
  @example("hangup")
  reason?: string;
}

const fabricCallLeft = "call.left";
@doc("Fires when you leave a Call Fabric call, delivering the (reduced) room session you left and, when supplied, the reason.")
@summary(fabricCallLeft)
@extension("x-fern-display-name", fabricCallLeft)
model CallLeftEvent is SignalwireEvent<typeof fabricCallLeft, CallLeftParams>;

@doc("Payload of the `member.joined` event: the member that joined and the room they joined.")
@summary("Member joined event payload")
model MemberJoinedParams {
  @doc("The member that joined, with their state.")
  member: Member;

  @doc("The room ID.")
  room_id: string;

  @doc("The room session ID.")
  room_session_id: string;

  @doc("The node the member's call leg lives on.")
  node_id: string;

  @doc("The call ID this member originated from. Present when it resolves.")
  origin_call_id?: string;
}

const fabricMemberJoined = "member.joined";
@doc("Fires when a member joins a Call Fabric conference, delivering the new member's state.")
@summary(fabricMemberJoined)
@extension("x-fern-display-name", fabricMemberJoined)
model MemberJoinedEvent
  is SignalwireEvent<typeof fabricMemberJoined, MemberJoinedParams>;

@doc("Payload of the `member.left` event: the member that left and the room.")
@summary("Member left event payload")
model MemberLeftParams {
  @doc("The member that left, with their last-known state.")
  member: Member;

  @doc("The room ID.")
  room_id: string;

  @doc("The room session ID.")
  room_session_id: string;

  @doc("The node the member's call leg lived on.")
  node_id: string;

  @doc("The call ID this member originated from. Present when it resolves.")
  origin_call_id?: string;

  @doc("Why the member left, when a reason is supplied.")
  @example("hangup")
  reason?: string;
}

const fabricMemberLeft = "member.left";
@doc("Fires when a member leaves a Call Fabric conference, delivering the member and, when supplied, the reason.")
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
