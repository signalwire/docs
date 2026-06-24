import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../events/echo.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("""
  Echoes the caller's audio back to them — whatever they say is played straight
  back. Handy for testing that audio is flowing in both directions on a call.
  Echo stops on its own when the `timeout` expires or the call ends.
  """)
@channel("calling.echo")
@summary("Echo audio back to the caller")
@opExample(#{
  parameters: #{ node_id: "a3e1b2c4-...", call_id: "c7f9d2e1-...", timeout: 30 },
  returnType: #{ code: "200", message: "Echo started" },
})
op echo(...EchoParams): EchoResult | CallEchoEvent;
