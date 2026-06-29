import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/state.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model ConnectRequest is JsonRpcRequest<"calling.connect", ConnectParams>;
@reply model ConnectReply is JsonRpcResponse<ConnectResult>;

@doc("""
  Calls a new device and bridges it to this already-active call, joining both
  legs together. Use this to add a party to a live call, such as forwarding or
  transferring a caller. Only one connect can run at a time on a given call — if
  another operation is still in progress, the request fails with a conflict error
  telling you to wait for it to finish. Connection progress arrives through
  `calling.call.connect` events.
  """)
// NOTE: no @opExample here — the required `devices: ConnectDevice[][]` (and the
// optional `ringback: Ringback[]`) are @discriminator bases, and TypeSpec
// value-checking does not narrow a discriminated base to its variant, so an inline
// frame example can't carry real device/ringback `params`. The ConnectDevice and
// Ringback variant models in common.tsp carry schema-level @example values instead.
@channel("calling.connect")
@summary("Connect a device to an active call")
op connect(...ConnectRequest): ConnectReply | CallConnectEvent;
