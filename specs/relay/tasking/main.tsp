import "@signalwire/typespec-asyncapi";

import "./operations/tasks/main.tsp";

using SignalWire.AsyncAPI;

@doc("""
  Tasking hands a JSON payload from one process to another. You deliver a task by
  POSTing it to the Tasking REST endpoint (`POST /api/relay/rest/tasks`) with a
  `context` and a `message`; SignalWire then forwards that message as a
  `queuing.relay.tasks` event to every client subscribed to that context. The
  message is your own data — SignalWire carries it through unchanged.

  This service documents that inbound `queuing.relay.tasks` event. The delivery
  call itself is an HTTPS request, documented in the REST API reference. Reach for
  Tasking when a short-lived or stateless process (a web request handler, a cron
  job) needs to push work to a long-running Relay client.
  """)
namespace Relay.Tasking;
