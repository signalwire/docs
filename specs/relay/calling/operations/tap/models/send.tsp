import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("Which side of the tapped party's audio to capture: `listen` = the audio the tapped party hears; `speak` = the audio the tapped party says (the default); `both` = both directions.")
union TapDirection {
  "listen",
  "speak",
  "both",
}

@doc("Codec for the tapped audio. Case-insensitive; the uppercase form shown here is canonical.")
union TapCodec {
  "OPUS",
  "PCMA",
  "PCMU",
}

@doc("Audio-tap settings.")
@summary("Audio tap params")
model TapAudioParams {
  @doc("Side of the call to tap.")
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
  @doc("RTP destination IPv4 address. Must be a public IP address you control; private addresses and SignalWire's own addresses are rejected.")
  @example("12.34.56.78")
  addr: string;

  @doc("RTP port.")
  @example(1234)
  port: int32;

  @doc("Codec for the tapped audio. Matches the tapped audio if not set.")
  @example("PCMU")
  codec?: TapCodec;

  @doc("Packet interval, in milliseconds — how many milliseconds of audio each RTP packet carries. Matches the tapped audio if not set.")
  @example(20)
  ptime?: int32;
}

@doc("WebSocket delivery-target settings.")
@summary("WebSocket delivery target")
model TapWsDeviceParams {
  @doc("WebSocket URI.")
  @example("wss://example.com/tap")
  uri: string;

  @doc("Codec for the tapped audio. Matches the tapped audio if not set.")
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

  @doc("HTTP(s) URL that tap status events are POSTed to.")
  @example("https://example.com/webhooks/relay")
  status_url?: url;
}

model TapStopParams {
  ...CallAddress;

  @doc("The `control_id` you set when you started the tap with `calling.tap`.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;
}
