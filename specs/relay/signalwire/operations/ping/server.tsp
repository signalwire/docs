import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./main.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Signalwire;

@doc("""
  Check that the connection is alive, or measure round-trip time. Send
  `signalwire.ping` with an optional `timestamp` and `payload`; the service replies
  with both echoed back unchanged.

  On a protocol `2.0.0` connection the service never pings you, so a ping you send
  is the way to notice a connection that has silently stopped working: if a ping
  goes unanswered, close the socket and reconnect. The server SDKs send these pings
  for you.
  """)
@channel(signalwirePing)
@summary("Check the connection with a ping")
@extension("x-fern-display-name", signalwirePing)
op ping(...PingRequest): PingReply;
