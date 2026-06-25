import "@signalwire/typespec-asyncapi";

import "./models/core.tsp";
import "./operations/deliver/main.tsp";
import "./events/tasks.tsp";

using SignalWire.AsyncAPI;

@doc("""
  Tasking lets you hand a JSON payload from one process to another over Relay.
  You call `tasking.deliver` with a `context` and a `message`, and SignalWire
  forwards that message as a `queuing.relay.tasks` event to every client
  subscribed to that context. The message is your own data — SignalWire doesn't
  read or change it, it just carries it through to your consumers unchanged.

  Reach for this when a short-lived or stateless process (a web request handler,
  a cron job) needs to push work to a long-running Relay client.
  """)
namespace Relay.Tasking;
