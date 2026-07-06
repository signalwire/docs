import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("""
  Which side of the call to tap. `listen` = what the call party hears; `speak`
  = what the call party says.
  """)
union TapDirection {
  "listen",
  "speak",
  "both",
}

@doc("Codec for the tapped audio. Case-insensitive on the wire; the uppercase form is canonical.")
union TapCodec {
  "OPUS",
  "PCMA",
  "PCMU",
}

@doc("`audio` tap params.")
model TapAudioParams {
  @doc("Side of the call to tap.")
  @example("listen")
  direction: TapDirection;
}

@doc("Media to intercept. Discriminated on `type` (documented value `audio`).")
@discriminator("type")
model TapConfig {
  type: "audio";
}

model TapAudio extends TapConfig {
  @example("audio")
  type: "audio";

  params: TapAudioParams;
}

@doc("`rtp` device params (delivery target).")
model TapRtpDeviceParams {
  @doc("""
    RTP IPv4 address. Must be an IP owned by the customer or expecting our
    traffic; specifying a private IP or a SignalWire-owned public IP is
    forbidden.
    """)
  @example("127.0.0.1")
  addr: string;

  @doc("RTP port.")
  @example(1234)
  port: int32;

  @doc("Codec for the tapped audio. Matches the tapped audio if not set.")
  @example("PCMU")
  codec?: TapCodec;

  @doc("Packetization time in ms — matches the tapped audio if not set.")
  @example(20)
  ptime?: int32;
}

@doc("`ws` device params (delivery target).")
model TapWsDeviceParams {
  @doc("WebSocket URI.")
  @example("wss://example.com/tap")
  uri: string;

  @doc("Codec for the tapped audio. Matches the tapped audio if not set.")
  @example("PCMU")
  codec?: TapCodec;
}

@doc("""
  Device to receive the tapped media. Discriminated on `type` (`rtp`|`ws`;
  future: `phone`|`webrtc`|`sip`). Echoed back fully-resolved as the result's
  `source_device`.
  """)
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

  @doc("Media to intercept (variant keyed on `tap.type`).")
  tap: TapConfig;

  @doc("Device to receive the tapped media (variant keyed on `device.type`).")
  device: TapDevice;

  @doc("HTTP(s) URL to POST tap events to.")
  @example("https://example.com/webhooks/relay")
  status_url?: url;
}

model TapStopParams {
  ...CallAddress;

  @doc("The tap `control_id` assigned in `calling.tap`.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;
}
