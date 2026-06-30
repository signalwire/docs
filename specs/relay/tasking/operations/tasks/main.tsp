import "@signalwire/typespec-asyncapi";
import "@typespec/openapi";

import "./models/events.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Tasking;

// Receive-only channel. A client subscribed to a context (via `signalwire.receive`) is pushed
// `queuing.relay.tasks` events. The operation takes NO request parameters, so the emitter renders
// it as a receive-only channel — no `send` op, no request frame, just the inbound event. The
// `queuingRelayTasks` const and `TasksEvent` model are the single source of truth in ./models/events.tsp.
@channel(queuingRelayTasks)
@summary("Receive tasks delivered to a subscribed context")
@extension("x-fern-display-name", queuingRelayTasks)
op tasks(): TasksEvent;
