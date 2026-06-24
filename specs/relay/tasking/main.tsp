import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

/**
 * Tasking lets you hand a JSON payload from one process to another over Relay.
 * You call `tasking.deliver` with a `context` and a `message`, and SignalWire
 * forwards that message as a `queuing.relay.tasks` event to every client
 * subscribed to that context. The message is your own data — SignalWire doesn't
 * read or change it, it just carries it through to your consumers unchanged.
 *
 * Reach for this when a short-lived or stateless process (a web request handler,
 * a cron job) needs to push work to a long-running Relay client.
 */
@channel("tasking")
namespace Relay.Tasking;

// ─────────────────────────────────────────────────────────────────────────────
// tasking.deliver
// ─────────────────────────────────────────────────────────────────────────────

/**
 * The standard result you get back from a Relay call: a `code` and a `message`.
 * `code` is a string, and you'll see `"200"` when the call succeeds.
 */
model Result {
  /** The result code, as a string. `"200"` means success. */
  code: string;
  /** A human-readable description of the result. */
  message: string;
}

model DeliverParams {
  /** The context to deliver the task to. Every client subscribed to this context receives the `queuing.relay.tasks` event. */
  context: string;

  /**
   * Your JSON payload to send (for example, `{ "foo": 123 }`). Use any shape you
   * like — SignalWire doesn't enforce a schema and passes it through to your
   * consumers unchanged.
   */
  message: Record<unknown>;
}

/** Confirms that SignalWire accepted your `tasking.deliver` request. */
model DeliverResult {
  ...Result;
}

/**
 * Send a JSON message to a context. Every client subscribed to that context
 * receives it as a `queuing.relay.tasks` event. Use this to push work from a
 * short-lived process to your long-running Relay clients. You get back a result
 * confirming SignalWire accepted the request.
 */
@rpcMethod("tasking.deliver")
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

// ─────────────────────────────────────────────────────────────────────────────
// Events
// ─────────────────────────────────────────────────────────────────────────────

/**
 * Fires when a task arrives on a context you're subscribed to. The payload tells
 * you which `context` the task came in on and carries the `message` exactly as
 * the sender passed it to `tasking.deliver`.
 */
@event("queuing.relay.tasks")
@example(#{
  context: "test",
  message: #{ foo: 123 },
})
model TasksEvent {
  /** The context this task arrived on. */
  context: string;

  /** The message payload, exactly as the sender passed it to `tasking.deliver`. */
  message: Record<unknown>;
}
