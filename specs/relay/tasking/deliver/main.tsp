import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Tasking;

/**
 * Send a JSON message to a context. Every client subscribed to that context
 * receives it as a `queuing.relay.tasks` event. Use this to push work from a
 * short-lived process to your long-running Relay clients. You get back a result
 * confirming SignalWire accepted the request.
 */
@channel("tasking.deliver")
@summary("Deliver a task message to a context")
@opExample(#{
  parameters: #{
    context: "test",
    message: #{ foo: 123 },
  },
  returnType: #{
    code: "200",
    message: "OK",
  },
})
op deliver(...DeliverParams): DeliverResult;
