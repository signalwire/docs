import "@signalwire/typespec-asyncapi";
import "@typespec/openapi";

import "./models/events.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Tasking;
const GroupQueuingRelayTasks = #["queuing"];

@channel(queuingRelayTasks)
@summary("Receive tasks delivered to a subscribed context")
@extension("x-fern-display-name", queuingRelayTasks)
@extension("x-fern-sdk-group-name", GroupQueuingRelayTasks)
op tasks(): TasksEvent;
