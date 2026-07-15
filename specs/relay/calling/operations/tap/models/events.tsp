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

@doc("Which side of the tapped party's audio to capture: `listen` = the audio the tapped party hears; `speak` = the audio the tapped party says (the default); `both` = both directions.")
union CallTapDirection {
  "speak",
  "listen",
  "both",
}

@doc("Describes the media being tapped. Currently always `audio`.")
@discriminator("type")
model CallTapMedia {
  @example("audio")
  type: "audio";
}

@doc("An audio tap.")
model CallTapAudio extends CallTapMedia {
  @example("audio")
  type: "audio";

  params: {
    @doc("Which side(s) of the call audio this tap captures.")
    @example("listen")
    direction: CallTapDirection;
  };
}

@doc("Describes where the tapped audio is being sent: `rtp` or `ws`.")
@discriminator("type")
model CallTapDevice {
  type: "rtp" | "ws";
}

@doc("The tapped audio is streamed to an RTP destination.")
model CallTapRtpDevice extends CallTapDevice {
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
model CallTapWsDevice extends CallTapDevice {
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

model CallTapParams {
  ...CallEventAddress;

  @doc("The `control_id` of the tap this event belongs to.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("Whether the tap is still running (`tapping`) or has stopped (`finished`).")
  @example("tapping")
  state: TapState;

  @doc("What media is being tapped.")
  tap: CallTapMedia;

  @doc("Where the tapped audio is being sent.")
  device: CallTapDevice;
}

const callingCallTap = "calling.call.tap";
@doc("Fires when a tap starts streaming call audio and again when it stops. Check `state` to tell which.")
@summary(callingCallTap)
@extension("x-fern-display-name", callingCallTap)
model CallTapEvent is SignalwireEvent<typeof callingCallTap, CallTapParams>;
