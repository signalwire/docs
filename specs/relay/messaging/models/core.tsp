import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Messaging;

/**
 * The outcome of a request. `code` is a string set to `"200"` when the request
 * succeeds; any other value (such as `"400"` or `"404"`) means it failed, and
 * `message` explains why.
 */
model Result {
  /** Result code as a string. `"200"` means success; anything else is an error. */
  code: string;

  /** A human-readable explanation of the result. */
  message: string;
}

/** Whether a message is coming in to you or going out from you. */
union MessageDirection {
  /** A message someone sent to you. */
  "inbound",

  /** A message you sent out. */
  "outbound",
}

/**
 * The delivery state of a message, reported through `messaging.state` events.
 * An outbound message moves through `queued`, `initiated`, and `sent`, then
 * settles on one of the final states: `delivered`, `undelivered`, or `failed`.
 */
union MessageState {
  /** Accepted and waiting to be processed. */
  "queued",

  /** Processing has started. */
  "initiated",

  /** Handed off to the carrier for delivery. */
  "sent",

  /** Confirmed delivered to the recipient's phone. A final state. */
  "delivered",

  /** The carrier could not deliver the message. A final state. */
  "undelivered",

  /** The message failed before reaching the carrier. A final state. */
  "failed",
}
