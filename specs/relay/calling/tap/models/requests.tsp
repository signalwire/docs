import "@signalwire/typespec-asyncapi";

import "../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ═════════════════════════════════════════════════════════════════════════════
// Tap subobjects (calling.tap)
//
// `tap` carries the media-selection variant (keyed on `tap.type`); `device`
// carries the delivery-target variant (keyed on `device.type`). Both are
// discriminated bases with `extends` variants. The same TapDevice shape is
// echoed back in the result as `source_device` with all params resolved.
// ═════════════════════════════════════════════════════════════════════════════

@doc("""
  Which side of the call to tap. `listen` = what the call party hears; `speak`
  = what the call party says.
  """)
union TapDirection {
  "listen",
  "speak",
  "both",
}

@doc("`audio` tap params.")
model TapAudioParams {
  @doc("Side of the call to tap. Default `speak`.")
  direction?: TapDirection = "speak";
}

@doc("Media to intercept. Discriminated on `type` (documented value `audio`).")
@discriminator("type")
model TapConfig {
  type: string;
}

@example(#{ type: "audio", params: #{ direction: "listen" } })
model TapAudio extends TapConfig {
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
  addr: string;

  @doc("RTP port.")
  port: int32;

  @doc("""
    Codec for the tapped audio (known values: `OPUS`, `PCMA`, `PCMU`).
    Matches the tapped audio if not set.
    """)
  codec?: string;

  @doc("Packetization time in ms — matches the tapped audio if not set.")
  ptime?: int32;

  @doc("Sample rate in Hz (present in the resolved `source_device` echo).")
  rate?: int32;
}

@doc("`ws` device params (delivery target).")
model TapWsDeviceParams {
  @doc("WebSocket URI.")
  uri: string;

  @doc("""
    Codec for the tapped audio (known values: `OPUS`, `PCMA`, `PCMU`).
    Matches the tapped audio if not set.
    """)
  codec?: string;

  @doc("Sample rate in Hz — matches the tapped audio if not set.")
  rate?: int32;
}

@doc("""
  Device to receive the tapped media. Discriminated on `type` (`rtp`|`ws`;
  future: `phone`|`webrtc`|`sip`). Echoed back fully-resolved as the result's
  `source_device`.
  """)
@discriminator("type")
model TapDevice {
  type: string;
}

@example(#{ type: "rtp", params: #{ addr: "127.0.0.1", port: 1234 } })
model TapRtpDevice extends TapDevice {
  type: "rtp";
  params: TapRtpDeviceParams;
}

@example(#{ type: "ws", params: #{ uri: "wss://example.com/tap" } })
model TapWsDevice extends TapDevice {
  type: "ws";
  params: TapWsDeviceParams;
}

model TapParams {
  ...CallAddress;

  @doc("Identifier used to control the active tap.")
  control_id: string;

  @doc("Media to intercept (variant keyed on `tap.type`).")
  tap: TapConfig;

  @doc("Device to receive the tapped media (variant keyed on `device.type`).")
  device: TapDevice;

  @doc("HTTP(s) URL to POST tap events to.")
  status_url?: url;
}

model TapStopParams {
  ...CallAddress;

  @doc("The tap `control_id` assigned in `calling.tap`.")
  control_id: string;
}
