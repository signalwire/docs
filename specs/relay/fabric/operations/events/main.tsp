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

@doc("Receive-only. Fires when you leave a Call Fabric call, delivering the room session and the reason.")
@channel(fabricCallLeft)
@summary("Receive call-left events")
@extension("x-fern-display-name", fabricCallLeft)
op callLeft(): CallLeftEvent;

@doc("Receive-only. Fires when a member joins the conference, delivering the new member's full state.")
@channel(fabricMemberJoined)
@summary("Receive member-joined events")
@extension("x-fern-display-name", fabricMemberJoined)
op memberJoined(): MemberJoinedEvent;

@doc("Receive-only. Fires when a member leaves the conference, delivering the member and the reason.")
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
