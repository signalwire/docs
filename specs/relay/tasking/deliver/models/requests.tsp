import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Tasking;

model DeliverParams {
  @doc("The context to deliver the task to. Every client subscribed to this context receives the `queuing.relay.tasks` event.")
  context: string;

  @doc("""
    Your JSON payload to send (for example, `{ "foo": 123 }`). Use any shape you
    like — SignalWire doesn't enforce a schema and passes it through to your
    consumers unchanged.
    """)
  message: Record<unknown>;
}
