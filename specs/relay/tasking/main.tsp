import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

/**
 * The `tasking` service delivers arbitrary, caller-defined JSON messages to
 * Relay consumers subscribed to a context. A client calls `tasking.deliver`
 * with a `context` and an opaque `message`; SignalWire queues the task and
 * pushes a `queuing.relay.tasks` event to every consumer listening on that
 * context. The `message` payload is never inspected — it is echoed verbatim
 * from the deliver request into the task event.
 */
@channel("tasking")
namespace Relay.Tasking;

// ─────────────────────────────────────────────────────────────────────────────
// tasking.deliver
// ─────────────────────────────────────────────────────────────────────────────

/**
 * Standard Relay `{code, message}` result. `code` is a STRING (`"200"` on
 * success). The Tasking source does not enumerate result fields or non-200
 * codes; per the Relay convention every response carries at least these two.
 */
model Result {
  /** Result code (string). `"200"` on success. */
  code: string;
  /** Human-readable result message. */
  message: string;
}

model DeliverParams {
  /** The context to deliver the task to. Consumers subscribed to this context receive the `queuing.relay.tasks` event. */
  context: string;

  /**
   * The message to send. Opaque, caller-defined JSON (e.g. `{ "foo": 123 }`);
   * SignalWire imposes no schema and echoes it verbatim into the task event.
   */
  message: Record<unknown>;
}

/** Acknowledgement of a `tasking.deliver` request. */
model DeliverResult {
  ...Result;
}

/**
 * Send an arbitrary JSON message to a context for delivery to subscribed Relay
 * consumers. SignalWire queues the task and pushes it as a
 * `queuing.relay.tasks` event.
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
 * A task has been received. Pushed to consumers subscribed to the task's
 * `context`, carrying the opaque `message` echoed verbatim from the
 * originating `tasking.deliver` call.
 */
@event("queuing.relay.tasks")
@example(#{
  context: "test",
  message: #{ foo: 123 },
})
model TasksEvent {
  /** The context that received the event. */
  context: string;

  /** The opaque message passed to the task, echoed verbatim from `tasking.deliver`. */
  message: Record<unknown>;
}
