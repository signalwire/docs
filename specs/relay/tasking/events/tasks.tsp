import "@signalwire/typespec-asyncapi";
import "../../common/frames.tsp";
import "@typespec/openapi";

using TypeSpec.OpenAPI;

namespace Relay.Tasking;

model TasksEventData {
  @doc("The context this task arrived on.")
  context: string;

  @doc("The message payload, exactly as the sender passed it to `tasking.deliver`.")
  message: Record<unknown>;
}

const queuingRelayTasks = "queuing.relay.tasks";
@doc("""
  Fires when a task arrives on a context you're subscribed to. The payload tells
  you which `context` the task came in on and carries the `message` exactly as
  the sender passed it to `tasking.deliver`.
  """)
@summary(queuingRelayTasks)
@extension("x-fern-display-name", queuingRelayTasks)
model TasksEvent is SignalwireEvent<typeof queuingRelayTasks, TasksEventData>;
