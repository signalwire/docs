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
  @example("a3f1c2d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d")
  node_id?: string;

  @doc("The peer call's `call_id`.")
  @example("c2a1e9f4-6b3d-4e7a-8f1c-2d3e4f5a6b7c")
  call_id?: string;

  @doc("The `tag` set on the peer call.")
  @example("my-tag-1")
  tag?: string;

  @doc("When the peer was reached through a queue, the queue's id.")
  @example("q-1a2b3c4d")
  queue_id?: string;

  @doc("The queue's friendly name.")
  @example("support")
  queue_name?: string;

  @doc("The device handling the peer call.")
  device?: CallDevice;
}

model CallConnectParams {
  ...CallEventAddress;

  @doc("The other call yours is being connected to.")
  peer?: ConnectPeer;

  @doc("Where the connection stands: `connecting`, `connected`, `disconnected`, or `failed`.")
  @example("connected")
  connect_state: "disconnected" | "connecting" | "connected" | "failed";

  @doc("Why the connect failed. Present when `connect_state` is `failed`.")
  @example("NO_ANSWER")
  failed_reason?: string;
}

const callingCallConnect = "calling.call.connect";
@doc("Fires as a connect request progresses, telling you whether your call has been bridged to the peer. Watch `connect_state` to know when the two calls are joined, torn down, or have failed to connect.")
@summary(callingCallConnect)
@extension("x-fern-display-name", callingCallConnect)
model CallConnectEvent is SignalwireEvent<typeof callingCallConnect, CallConnectParams>;
