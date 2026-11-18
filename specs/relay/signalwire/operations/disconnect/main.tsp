import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Signalwire;

const signalwireDisconnect = "signalwire.disconnect";

@doc("""
  A `signalwire.disconnect` request the service pushes to you when it is about to
  close your connection — for example during a deployment. Stop sending new
  requests on this connection. A few seconds later the service closes the socket;
  it does not wait for a reply, so the close comes on schedule whether or not you
  answer. You may reply with an empty result `{}`.

  `restart` tells you how to reconnect. When it is `false`, reconnect and restore
  your session by passing your saved `protocol` and `authorization_state` to
  `signalwire.connect`. When it is `true`, reconnect as a fresh connection, without
  them.

  You receive this message; you do not send it (that is why this channel has no
  send operation).
  """)
@summary("Service is about to disconnect the client")
@extension("x-fern-display-name", signalwireDisconnect)
model DisconnectEvent
  is JsonRpcRequest<typeof signalwireDisconnect, DisconnectParams>;

@doc("""
  Delivers the server-initiated `signalwire.disconnect` request.
  This channel is receive-only: you receive the disconnect and may reply with an
  empty result — you never send a disconnect.
  """)
@channel(signalwireDisconnect)
@summary("Service is about to disconnect the client")
@extension("x-fern-display-name", signalwireDisconnect)
op disconnect(): DisconnectEvent;
