import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Tasking;

@doc("""
  Fires when a task arrives on a context you're subscribed to. The payload tells
  you which `context` the task came in on and carries the `message` exactly as
  the sender passed it to `tasking.deliver`.
  """)
@event("queuing.relay.tasks")
@example(#{
  context: "test",
  message: #{ foo: 123 },
})
model TasksEvent {
  @doc("The context this task arrived on.")
  context: string;

  @doc("The message payload, exactly as the sender passed it to `tasking.deliver`.")
  message: Record<unknown>;
}
