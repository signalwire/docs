import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "@typespec/openapi";

import "../../../models/core.tsp";
import "../../../models/devices.tsp";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

@doc("The other call being connected to yours.")
model ConnectPeer {
  @doc("Identifier of the node hosting the peer call.")
  node_id?: string;

  @doc("The peer call's `call_id`.")
  call_id?: string;

  @doc("The `tag` set on the peer call.")
  tag?: string;

  @doc("When the peer was reached through a queue, the queue's id.")
  queue_id?: string;

  @doc("The queue's friendly name.")
  queue_name?: string;

  @doc("The device handling the peer call.")
  device?: CallDevice;
}

model CallConnectParams {
  ...CallAddress;

  @doc("The `tag` you set on the connect request, so you can match this event to it.")
  tag?: string;

  @doc("The other call yours is being connected to.")
  peer?: ConnectPeer;

  @doc("Where the connection stands: `connecting`, `connected`, `disconnected`, or `failed`.")
  connect_state: "disconnected" | "connecting" | "connected" | "failed";

  @doc("Why the connect failed. Present when `connect_state` is `failed`.")
  failed_reason?: string;
}

const callingCallConnect = "calling.call.connect";
@doc("Fires as a connect request progresses, telling you whether your call has been bridged to the peer. Watch `connect_state` to know when the two calls are joined, torn down, or have failed to connect.")
@summary(callingCallConnect)
@extension("x-fern-display-name", callingCallConnect)
model CallConnectEvent is SignalwireEvent<typeof callingCallConnect, CallConnectParams>;
