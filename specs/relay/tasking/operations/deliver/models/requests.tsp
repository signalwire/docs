import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Tasking;

model DeliverParams {
  @doc("The context to deliver the task to. Every client subscribed to this context receives the `queuing.relay.tasks` event. Defaults to `\"default\"` when omitted.")
  context?: string = "default";

  @doc("""
    Your JSON payload to send (for example, `{ "foo": 123 }`). Use any shape you
    like — SignalWire doesn't enforce a schema and passes it through to your
    consumers unchanged. The payload must not be empty, and its serialized JSON
    must not exceed 2000 characters.
    """)
  message: Record<unknown>;
}
