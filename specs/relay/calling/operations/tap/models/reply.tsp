import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";
import "./send.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("Fully-resolved delivery-device settings echoed back in the tap result.")
@summary("Tap echo device params")
model TapEchoDeviceParams {
  @doc("Resolved media IPv4 address.")
  @example("10.10.10.10")
  addr: string;

  @doc("Resolved media port.")
  @example(30030)
  port: int32;

  @doc("Resolved codec for the tapped audio.")
  @example("PCMU")
  codec: string;

  @doc("Packet interval, in milliseconds — how many milliseconds of audio each RTP packet carries.")
  @example(20)
  ptime: int32;

  @doc("Sample rate in Hz.")
  @example(8000)
  rate: int32;
}

@doc("""
  The delivery device echoed back fully resolved, so the receiving end knows
  exactly what audio it will get. Both transports return the same resolved
  `params`; `type` reports which transport (`rtp` or `ws`). Note this differs from
  the request device shape — the `ws` echo carries `addr`/`port`, not `uri`.
  """)
@summary("Tap echo device")
model TapEchoDevice {
  @doc("Transport of the resolved delivery device.")
  @example("rtp")
  type: "rtp" | "ws";

  @doc("Fully-resolved delivery-device parameters.")
  params: TapEchoDeviceParams;
}

@summary("Tap result")
model TapResult {
  ...RelayResult<"Tapping call">;

  @doc("Your requested delivery device echoed back with every parameter resolved (address, port, codec, packetization time, and sample rate).")
  source_device?: TapEchoDevice;
}

@summary("Tap stop result")
model TapStopResult {
  ...RelayResult<"Stopping tap">;
}
