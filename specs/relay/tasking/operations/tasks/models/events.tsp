import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "@typespec/openapi";

using TypeSpec.OpenAPI;

namespace Relay.Tasking;

const queuingRelayTasks = "queuing.relay.tasks";
@doc("""
  Fires when a task arrives on a context you're subscribed to. The payload tells
  you which `context` the task came in on and carries the `message` exactly as
  the sender passed it to the Tasking REST endpoint (`POST /api/relay/rest/tasks`).
  """)
@summary(queuingRelayTasks)
@extension("x-fern-display-name", queuingRelayTasks)
model TasksEvent is TaskingEvent<typeof queuingRelayTasks>;
