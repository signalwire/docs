import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Fabric;

@doc("""
  A member of a Call Fabric conference — one participant's state. Carried on the
  `member.updated`, `member.joined`, and `member.left` events and returned by
  `call.member.list`. Fields match the Video API's `Member`.

  Note: on a 1:1 (non-conference) call, `member.joined`/`member.left` carry a leaner
  variant of this object — it keys the member by `member_id`
  instead of `id`, adds `node_id` (and, when present, `address_id` and `subscriber_id`),
  and reports `echo_cancellation`/`auto_gain`/`noise_suppression`/`denoise`/`lowbitrate`
  (all defaulting to `false`) instead of the volume/sensitivity fields. If you consume
  member events on direct 1:1 calls, treat those fields as the variant set.
  """)
@summary("Call Fabric member")
model Member {
  @doc("The member ID. Equals the call ID for a member that is not in a conference.")
  @example("c2a1e9f4-6b3d-4e7a-8f1c-2d3e4f5a6b7c")
  id: string;

  @doc("The room this member belongs to. In a 1:1 call this is the call ID; in a conference it is the room ID.")
  room_id: string;

  @doc("The room session this member belongs to.")
  room_session_id: string;

  @doc("Friendly display name — the caller ID for a 1:1 call.")
  @example("Alice")
  name: string;

  @doc("The member type, such as `member` or `screen`.")
  @example("member")
  type: string;

  @doc("The member's call ID. Present on join events and where the member is addressed directly.")
  call_id?: string;

  @doc("Associated parent member, for a screenshare or an additional-device member.")
  parent_id?: string;

  @doc("Whether the member's audio is muted.")
  audio_muted: boolean;

  @doc("Whether the member's video is muted.")
  video_muted: boolean;

  @doc("Whether the member has their hand raised.")
  handraised: boolean;

  @doc("Whether the member is visible in the layout. Always `true` for a 1:1 call.")
  visible: boolean;

  @doc("Whether the member is deafened (not hearing the conference audio).")
  deaf: boolean;

  @doc("Input (microphone) volume, in decibels, from -50 to 50.")
  @example(0)
  input_volume: int32;

  @doc("Output (speaker) volume, in decibels, from -50 to 50.")
  @example(0)
  output_volume: int32;

  @doc("Input (microphone) sensitivity, from 0.0 to 100.0.")
  @example(50)
  input_sensitivity: float64;

  @doc("The member's last-requested layout position.")
  requested_position: string;

  @doc("Customer-provided metadata for the member.")
  meta: Record<unknown>;

  @doc("The fields that changed — present on the `member.updated` event.")
  updated?: string[];
}

@doc("A minimal member reference carried on the `member.talking` event: just the member `id` and whether they are talking.")
@summary("Talking member reference")
model TalkingMember {
  @doc("The member ID.")
  @example("c2a1e9f4-6b3d-4e7a-8f1c-2d3e4f5a6b7c")
  id: string;

  @doc("Whether the member is currently talking.")
  talking: boolean;
}

@doc("One layer of a Call Fabric video layout — a positioned region that can show a member's video or a played file.")
@summary("Layout layer")
model LayoutLayer {
  @doc("The layer's index in the layout.")
  layer_index: int32;

  @doc("The layer's z-index (stacking order).")
  z_index: int32;

  @doc("The member shown in this layer, when one is assigned.")
  member_id?: string;

  @doc("Whether this layer is playing a file rather than showing a member.")
  playing_file: boolean;

  @doc("The named position this layer occupies, such as `standard-1`.")
  position: string;

  @doc("The reservation name for this layer, when reserved.")
  reservation?: string;

  @doc("Whether this layer is currently visible.")
  visible: boolean;

  @doc("The layer's horizontal offset, as a percentage of the frame.")
  x: int32;

  @doc("The layer's vertical offset, as a percentage of the frame.")
  y: int32;

  @doc("The layer's width, as a percentage of the frame.")
  width: int32;

  @doc("The layer's height, as a percentage of the frame.")
  height: int32;
}

@doc("A Call Fabric video layout, as delivered on the `layout.changed` event.")
@summary("Layout")
model LayoutInfo {
  @doc("The room ID.")
  room_id: string;

  @doc("The room session ID.")
  room_session_id: string;

  @doc("The layout's name, such as `grid-responsive`.")
  @example("grid-responsive")
  name: string;

  @doc("The layout's layers.")
  layers: LayoutLayer[];
}

@doc("""
  The full state of a Call Fabric room session — the shared conference a set of members
  are in. Delivered on `room.updated`. Fields match the Video API's Room Session.
  """)
@summary("Room session")
model RoomSession {
  @doc("The room session ID.")
  id: string;

  @doc("The room ID.")
  room_id: string;

  @doc("The event channel this room session publishes on.")
  event_channel: string;

  @doc("The room's name.")
  name: string;

  @doc("The room's display name.")
  display_name: string;

  @doc("The name of the layout currently applied.")
  layout_name: string;

  @doc("Whether the room is locked to new participants.")
  locked: boolean;

  @doc("Whether the room is currently being recorded.")
  recording: boolean;

  @doc("Whether the room is currently being streamed.")
  streaming: boolean;

  @doc("Whether video-muted members are hidden from the layout.")
  hide_video_muted: boolean;

  @doc("Whether raised hands are prioritized in the layout.")
  prioritize_handraise: boolean;

  @doc("Number of audience (receive-only) participants.")
  audience_count?: int32;

  @doc("A preview image URL for the room, when available.")
  preview_url?: string;

  @doc("Customer-provided metadata for the room.")
  meta: Record<unknown>;

  @doc("The members currently in the room session. Included when requested.")
  members?: Member[];

  @doc("The room's recordings. Included when requested.")
  recordings?: Record<unknown>[];

  @doc("The room's streams. Included when requested.")
  streams?: Record<unknown>[];

  @doc("The room's playbacks. Included when requested.")
  playbacks?: Record<unknown>[];

  @doc("The fields that changed — present on the `room.updated` event.")
  updated?: string[];
}

@doc("""
  The room-session summary embedded in `call.joined` and `call.left`. This is a leaner
  shape than the conference `RoomSession` on `room.updated`. On
  `call.left` the collection fields (`members`/`recordings`/`streams`/`playbacks`) are
  absent entirely.
  """)
@summary("Call room session")
model CallRoomSession {
  @doc("The room ID.")
  room_id: string;

  @doc("The room session ID.")
  room_session_id: string;

  @doc("The event channel this room session publishes on.")
  event_channel: string;

  @doc("The name of the layout currently applied. On a 1:1 call this is `1x1`.")
  @example("1x1")
  layout_name: string;

  @doc("Customer-provided metadata for the room.")
  meta: Record<unknown>;

  @doc("The members in the session. Present on `call.joined`, absent on `call.left`.")
  members?: Member[];

  @doc("The room's recordings. Present (as an empty array) on `call.joined`, absent on `call.left`.")
  recordings?: Record<unknown>[];

  @doc("The room's streams. Present (as an empty array) on `call.joined`, absent on `call.left`.")
  streams?: Record<unknown>[];

  @doc("The room's playbacks. Present (as an empty array) on `call.joined`, absent on `call.left`.")
  playbacks?: Record<unknown>[];
}

@doc("A Call Fabric room recording, as carried on the `recording.*` events and in a room session's `recordings` collection.")
@summary("Recording")
model RecordingInfo {
  @doc("The recording ID.")
  @example("c2a1e9f4-6b3d-4e7a-8f1c-2d3e4f5a6b7c")
  id: string;

  @doc("The recording state, such as `recording`, `paused`, or `completed`.")
  @example("recording")
  state: string;

  @doc("When the recording started, as a Unix timestamp in seconds.")
  @example(1712345678)
  started_at: float64;

  @doc("Recording duration in seconds. Present once the recording has ended.")
  @example(42.5)
  duration?: float64;

  @doc("When the recording ended, as a Unix timestamp in seconds. Present once the recording has ended.")
  @example(1712345720)
  ended_at?: float64;
}

@doc("A Call Fabric RTMP stream, as carried on the `stream.*` events and in a room session's `streams` collection.")
@summary("Stream")
model StreamInfo {
  @doc("The stream ID.")
  @example("c2a1e9f4-6b3d-4e7a-8f1c-2d3e4f5a6b7c")
  id: string;

  @doc("The stream state, such as `streaming` or `completed`.")
  @example("streaming")
  state: string;

  @doc("The RTMP destination URL the room is being streamed to. Omitted when it is not reported on the event.")
  @example("rtmp://example.com/live/streamkey")
  url?: string;

  @doc("Stream duration in seconds. Present once the stream has ended.")
  @example(42.5)
  duration?: float64;

  @doc("When the stream started, as a Unix timestamp in seconds.")
  @example(1712345678)
  started_at: float64;

  @doc("When the stream ended, as a Unix timestamp in seconds. Present once the stream has ended.")
  @example(1712345720)
  ended_at?: float64;
}

@doc("A Call Fabric media playback, as carried on the `playback.*` events and in a room session's `playbacks` collection.")
@summary("Playback")
model PlaybackInfo {
  @doc("The playback ID.")
  @example("c2a1e9f4-6b3d-4e7a-8f1c-2d3e4f5a6b7c")
  id: string;

  @doc("The URL of the media being played.")
  @example("https://example.com/media/audio.mp3")
  url: string;

  @doc("Whether the playback supports seeking.")
  seekable: boolean;

  @doc("The current playback position, in milliseconds from the start.")
  @example(0)
  position: int32;

  @doc("The playback state, such as `playing`, `paused`, or `completed`.")
  @example("playing")
  state: string;

  @doc("The playback volume, from -50 to 50.")
  @example(0)
  volume: int32;

  @doc("When the playback started, as a Unix timestamp in seconds.")
  @example(1712345678)
  started_at: float64;

  @doc("When the playback ended, as a Unix timestamp in seconds. Present once the playback has ended.")
  @example(1712345720)
  ended_at?: float64;
}
