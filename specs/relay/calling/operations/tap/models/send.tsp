import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("Which side of the tapped party's audio to capture: `listen` = the audio the tapped party hears; `speak` = the audio the tapped party says; `both` = both directions.")
union TapDirection {
  "listen",
  "speak",
  "both",
}

@doc("Codec for the tapped audio. Send it all uppercase (`PCMU`) or all lowercase (`pcmu`); mixed case such as `Pcmu` is rejected.")
union TapCodec {
  "OPUS",
  "PCMA",
  "PCMU",
  "opus",
  "pcma",
  "pcmu",
}

@doc("Audio-tap settings.")
@summary("Audio tap params")
model TapAudioParams {
  @doc("Side of the call to tap. Required; there is no default.")
  @example("listen")
  direction: TapDirection;
}

@doc("The media to intercept. Only `audio` is currently supported.")
@discriminator("type")
model TapConfig {
  type: "audio";
}

model TapAudio extends TapConfig {
  @example("audio")
  type: "audio";

  params: TapAudioParams;
}

@doc("RTP delivery-target settings.")
@summary("RTP delivery target")
model TapRtpDeviceParams {
  @doc("RTP destination IPv4 address, in dotted-quad form. Must be a public address; private, loopback, link-local, documentation, multicast, and other reserved ranges are rejected, as are octets with leading zeros.")
  @example("12.34.56.78")
  addr: string;

  @doc("RTP port.")
  @minValue(1)
  @maxValue(65535)
  @example(1234)
  port: int32;

  @doc("Codec for the tapped audio. If not set, uses the call's codec when it is `PCMU`, `PCMA`, or `OPUS`, and `PCMU` otherwise.")
  @example("PCMU")
  codec?: TapCodec;

  @doc("Packet interval, in milliseconds — how many milliseconds of audio each RTP packet carries. A multiple of 10 from 10 to 120. Matches the tapped audio if not set.")
  @minValue(10)
  @maxValue(120)
  @example(20)
  ptime?: int32;
}

@doc("WebSocket delivery-target settings.")
@summary("WebSocket delivery target")
model TapWsDeviceParams {
  @doc("WebSocket URI.")
  @example("wss://example.com/tap")
  uri: string;

  @doc("Codec for the tapped audio. If not set, uses the call's codec when it is `PCMU`, `PCMA`, or `OPUS`, and `PCMU` otherwise.")
  @example("PCMU")
  codec?: TapCodec;
}

@doc("Where to deliver the tapped media. Choose `rtp` or `ws`. The result echoes this back fully resolved as `source_device`.")
@discriminator("type")
model TapDevice {
  type: "rtp" | "ws";
}

model TapRtpDevice extends TapDevice {
  @example("rtp")
  type: "rtp";

  params: TapRtpDeviceParams;
}

model TapWsDevice extends TapDevice {
  @example("ws")
  type: "ws";

  params: TapWsDeviceParams;
}

model TapParams {
  ...CallAddress;

  @doc("Identifier used to control the active tap.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("Media to intercept.")
  tap: TapConfig;

  @doc("Device to receive the tapped media.")
  device: TapDevice;
}

model TapStopParams {
  ...CallAddress;

  @doc("The `control_id` you set when you started the tap with `calling.tap`.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;
}
