import "@signalwire/typespec-asyncapi";
import "@typespec/openapi";

import "../../events/shared.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Fabric;

@doc("""
  Receive-only. Fires every time a Call Fabric call leg changes state — created,
  ringing, answered, ending, ended. Track a call through its lifecycle with
  `call_state`, and match `tag` to the call you created.
  """)
@channel(fabricCallState)
@summary("Receive Call Fabric call-state changes")
@extension("x-fern-display-name", fabricCallState)
op callState(): CallStateEvent;

@doc("Receive-only. Fires when you join a Call Fabric call, delivering the room session, your identifiers, and your capabilities.")
@channel(fabricCallJoined)
@summary("Receive call-joined events")
@extension("x-fern-display-name", fabricCallJoined)
op callJoined(): CallJoinedEvent;

@doc("Receive-only. Fires when you leave a Call Fabric call, delivering the room session and, when supplied, the reason.")
@channel(fabricCallLeft)
@summary("Receive call-left events")
@extension("x-fern-display-name", fabricCallLeft)
op callLeft(): CallLeftEvent;

@doc("Receive-only. Fires when a member joins the conference, delivering the new member's full state.")
@channel(fabricMemberJoined)
@summary("Receive member-joined events")
@extension("x-fern-display-name", fabricMemberJoined)
op memberJoined(): MemberJoinedEvent;

@doc("Receive-only. Fires when a member leaves the conference, delivering the member and, when supplied, the reason.")
@channel(fabricMemberLeft)
@summary("Receive member-left events")
@extension("x-fern-display-name", fabricMemberLeft)
op memberLeft(): MemberLeftEvent;

@doc("Receive-only. Fires when a member's state changes; the member's `updated` field lists which properties changed. Follows member-control methods such as `call.mute`, `call.deaf`, and the volume setters.")
@channel(fabricMemberUpdated)
@summary("Receive member-updated events")
@extension("x-fern-display-name", fabricMemberUpdated)
op memberUpdated(): MemberUpdatedEvent;

@doc("Receive-only. Fires when a member starts or stops talking, delivering the member `id` and a `talking` boolean.")
@channel(fabricMemberTalking)
@summary("Receive member-talking events")
@extension("x-fern-display-name", fabricMemberTalking)
op memberTalking(): MemberTalkingEvent;

@doc("Receive-only. Fires when the room session's state changes — lock, layout, recording, and so on.")
@channel(fabricRoomUpdated)
@summary("Receive room-updated events")
@extension("x-fern-display-name", fabricRoomUpdated)
op roomUpdated(): RoomUpdatedEvent;

@doc("Receive-only. Fires when the video layout changes, for example after `call.layout.set`. Delivers the new layout. Wire event type is `layout.changed`.")
@channel(fabricLayoutChanged)
@summary("Receive layout-changed events")
@extension("x-fern-display-name", fabricLayoutChanged)
op layoutChanged(): LayoutChangedEvent;

@doc("Receive-only. Fires when audio playback on a Call Fabric call starts, pauses, resumes, finishes, or errors. Track a play action through to completion with `state`.")
@channel(fabricCallPlay)
@summary("Receive call.play events")
@extension("x-fern-display-name", fabricCallPlay)
op callPlay(): CallPlayEvent;

@doc("Receive-only. Fires as a connect request progresses, telling you whether your Call Fabric call has been bridged to the peer. Watch `connect_state`.")
@channel(fabricCallConnect)
@summary("Receive call.connect events")
@extension("x-fern-display-name", fabricCallConnect)
op callConnect(): CallConnectEvent;

@doc("Receive-only. Fires when a recording on a Call Fabric call starts, pauses, resumes, or finishes. The finished event includes the download URL, duration, and file size.")
@channel(fabricCallRecord)
@summary("Receive call.record events")
@extension("x-fern-display-name", fabricCallRecord)
op callRecord(): CallRecordEvent;

@doc("Receive-only. Fires as you collect input from a caller on a Call Fabric call — DTMF digits or speech — reporting partial and final results.")
@channel(fabricCallCollect)
@summary("Receive call.collect events")
@extension("x-fern-display-name", fabricCallCollect)
op callCollect(): CallCollectEvent;

@doc("Receive-only. Fires when a tap starts streaming Call Fabric call audio and again when it stops. Check `state` to tell which.")
@channel(fabricCallTap)
@summary("Receive call.tap events")
@extension("x-fern-display-name", fabricCallTap)
op callTap(): CallTapEvent;

@doc("Receive-only. Fires when a media stream on a Call Fabric call starts and again when it stops. Check `state` to tell which.")
@channel(fabricCallStream)
@summary("Receive call.stream events")
@extension("x-fern-display-name", fabricCallStream)
op callStream(): CallStreamEvent;

@doc("Receive-only. Fires when a detector on a Call Fabric call reports a result — a fax tone, an answering machine versus a human, or a DTMF digit.")
@channel(fabricCallDetect)
@summary("Receive call.detect events")
@extension("x-fern-display-name", fabricCallDetect)
op callDetect(): CallDetectEvent;

@doc("Receive-only. Fires when a Call Fabric room session starts. Delivers the room session's initial state.")
@channel(fabricRoomStarted)
@summary("Receive room.started events")
@extension("x-fern-display-name", fabricRoomStarted)
op roomStarted(): RoomStartedEvent;

@doc("Receive-only. Fires when you subscribe to a Call Fabric room session, delivering the room's current state and your member/call identifiers.")
@channel(fabricRoomSubscribed)
@summary("Receive room.subscribed events")
@extension("x-fern-display-name", fabricRoomSubscribed)
op roomSubscribed(): RoomSubscribedEvent;

@doc("Receive-only. Fires when a Call Fabric room session ends. Delivers the room session's final state and, when supplied, the reason.")
@channel(fabricRoomEnded)
@summary("Receive room.ended events")
@extension("x-fern-display-name", fabricRoomEnded)
op roomEnded(): RoomEndedEvent;

@doc("Receive-only. Fires when you subscribe to a project's room list, delivering a snapshot of every active room session.")
@channel(fabricRoomsSubscribed)
@summary("Receive rooms.subscribed events")
@extension("x-fern-display-name", fabricRoomsSubscribed)
op roomsSubscribed(): RoomsSubscribedEvent;

@doc("Receive-only. Fires when an audience participant is promoted to a full member. Delivers the promoted member's ID and your refreshed authorization.")
@channel(fabricMemberPromoted)
@summary("Receive member.promoted events")
@extension("x-fern-display-name", fabricMemberPromoted)
op memberPromoted(): MemberPromotedEvent;

@doc("Receive-only. Fires when a full member is demoted to an audience participant. Delivers the demoted member's ID and your refreshed authorization.")
@channel(fabricMemberDemoted)
@summary("Receive member.demoted events")
@extension("x-fern-display-name", fabricMemberDemoted)
op memberDemoted(): MemberDemotedEvent;

@doc("Receive-only. Fires when a recording starts in a Call Fabric room, for example after `call.recording.start`.")
@channel(fabricRecordingStarted)
@summary("Receive recording.started events")
@extension("x-fern-display-name", fabricRecordingStarted)
op recordingStarted(): RecordingStartedEvent;

@doc("Receive-only. Fires when a recording's state changes, for example when it is paused or resumed.")
@channel(fabricRecordingUpdated)
@summary("Receive recording.updated events")
@extension("x-fern-display-name", fabricRecordingUpdated)
op recordingUpdated(): RecordingUpdatedEvent;

@doc("Receive-only. Fires when a recording ends, delivering the recording's final state including its duration.")
@channel(fabricRecordingEnded)
@summary("Receive recording.ended events")
@extension("x-fern-display-name", fabricRecordingEnded)
op recordingEnded(): RecordingEndedEvent;

@doc("Receive-only. Fires when media playback starts in a Call Fabric room, for example after `call.play`.")
@channel(fabricPlaybackStarted)
@summary("Receive playback.started events")
@extension("x-fern-display-name", fabricPlaybackStarted)
op playbackStarted(): PlaybackStartedEvent;

@doc("Receive-only. Fires when a playback's state changes — pause, resume, volume, or seek position.")
@channel(fabricPlaybackUpdated)
@summary("Receive playback.updated events")
@extension("x-fern-display-name", fabricPlaybackUpdated)
op playbackUpdated(): PlaybackUpdatedEvent;

@doc("Receive-only. Fires when a playback ends. Wire event type is `playback.ended`.")
@channel(fabricPlaybackEnded)
@summary("Receive playback.ended events")
@extension("x-fern-display-name", fabricPlaybackEnded)
op playbackEnded(): PlaybackEndedEvent;

@doc("Receive-only. Fires when an RTMP stream starts in a Call Fabric room, for example after `call.stream.start`.")
@channel(fabricStreamStarted)
@summary("Receive stream.started events")
@extension("x-fern-display-name", fabricStreamStarted)
op streamStarted(): StreamStartedEvent;

@doc("Receive-only. Fires when an RTMP stream ends, delivering the stream's final state including its duration.")
@channel(fabricStreamEnded)
@summary("Receive stream.ended events")
@extension("x-fern-display-name", fabricStreamEnded)
op streamEnded(): StreamEndedEvent;

@doc("Receive-only. Fires on a subscriber's Conversation stream when a new message is published to a conversation the subscriber is part of.")
@channel(fabricConversationMessage)
@summary("Receive conversation.message events")
@extension("x-fern-display-name", fabricConversationMessage)
op conversationMessage(): ConversationMessageEvent;

@doc("Receive-only. Fires when a previously published conversation message is edited.")
@channel(fabricConversationMessageUpdated)
@summary("Receive conversation.message.updated events")
@extension("x-fern-display-name", fabricConversationMessageUpdated)
op conversationMessageUpdated(): ConversationMessageUpdatedEvent;

@doc("Receive-only. Fires when a subscriber is added to a conversation, identifying the subscriber, originating address, and conversation group and name.")
@channel(fabricConversationJoined)
@summary("Receive conversation.joined events")
@extension("x-fern-display-name", fabricConversationJoined)
op conversationJoined(): ConversationJoinedEvent;

@doc("Receive-only. Fires when a message is broadcast to every subscriber who shares a conversation with the sending address.")
@channel(fabricConversationBroadcast)
@summary("Receive conversation.broadcast events")
@extension("x-fern-display-name", fabricConversationBroadcast)
op conversationBroadcast(): ConversationBroadcastEvent;
