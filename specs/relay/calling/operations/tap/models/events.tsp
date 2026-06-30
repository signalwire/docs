import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "@typespec/openapi";

import "../../../models/core.tsp";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

@doc("Where the tap is in its lifecycle: `tapping` while audio is flowing, `finished` once it stops.")
union TapState {
  "tapping",
  "finished",
}

@doc("Which side of the call audio is being tapped: the caller speaking, what they hear, or both.")
union CallTapDirection {
  "speak",
  "listen",
  "both",
}

@doc("Describes the media being tapped. Currently always `audio`.")
@discriminator("type")
model TapMedia {
  type: string;
}

@doc("An audio tap.")
model CallTapAudio extends TapMedia {
  type: "audio";
  params: {
    @doc("Which side(s) of the call audio this tap captures.")
    direction: CallTapDirection;
  };
}

@doc("Describes where the tapped audio is being sent: `rtp` or `ws`.")
@discriminator("type")
model CallTapDevice {
  type: string;
}

@doc("The tapped audio is streamed to an RTP destination.")
model CallTapRtpDevice extends CallTapDevice {
  type: "rtp";
  params: {
    @doc("IP address the tapped audio is sent to.")
    addr: string;

    @doc("Port the tapped audio is sent to.")
    port: int32;

    @doc("Codec used for the tapped audio stream. Absent when it matches the tapped audio.")
    codec?: string;

    @doc("Packetization time of the stream, in milliseconds. Absent when it matches the tapped audio.")
    ptime?: int32;
  };
}

@doc("The tapped audio is streamed to a WebSocket destination.")
model CallTapWsDevice extends CallTapDevice {
  type: "ws";
  params: {
    @doc("WebSocket URI the tapped audio is sent to.")
    uri: string;

    @doc("Codec used for the tapped audio stream. Absent when it matches the tapped audio.")
    codec?: string;
  };
}

model CallTapParams {
  ...CallAddress;

  @doc("The `control_id` of the tap this event belongs to.")
  control_id: string;

  @doc("Whether the tap is still running (`tapping`) or has stopped (`finished`).")
  state: TapState;

  @doc("What media is being tapped.")
  tap: TapMedia;

  @doc("Where the tapped audio is being sent.")
  device: CallTapDevice;
}

const callingCallTap = "calling.call.tap";
@doc("Fires when a tap starts streaming call audio and again when it stops. Check `state` to tell which.")
@summary(callingCallTap)
@extension("x-fern-display-name", callingCallTap)
model CallTapEvent is SignalwireEvent<typeof callingCallTap, CallTapParams>;
