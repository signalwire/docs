import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Signalwire;
const GroupSignalwireDisconnect = #["signalwire", "disconnect"];

const signalwireDisconnect = "signalwire.disconnect";

@doc("""
  A `signalwire.disconnect` request the service pushes to you when it is about to
  close your connection — for example during a deployment. The frame carries a
  single `restart` flag. Flush anything pending and reply with an empty result
  `{}` to acknowledge; that reply should be the last thing you send before the
  connection closes. If `restart` is `true`, reconnect afterward.

  You receive this message; you do not send it (that is why this channel has no
  send operation).
  """)
@summary("Service is about to disconnect the client")
@extension("x-fern-display-name", signalwireDisconnect)
model DisconnectEvent is JsonRpcRequest<typeof signalwireDisconnect, DisconnectParams>;

@doc("""
  Delivers the server-initiated `signalwire.disconnect` request described above.
  This channel is receive-only: the SDK receives the disconnect and replies with
  an empty acknowledgement — it never sends a disconnect.
  """)
@channel(signalwireDisconnect)
@summary("Service is about to disconnect the client")
@extension("x-fern-display-name", signalwireDisconnect)
@extension("x-fern-sdk-group-name", GroupSignalwireDisconnect)
op disconnect(): DisconnectEvent;
