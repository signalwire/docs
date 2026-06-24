import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Messaging;

@doc("""
  The outcome of a request. `code` is a string set to `"200"` when the request
  succeeds; any other value (such as `"400"` or `"404"`) means it failed, and
  `message` explains why.
  """)
model Result {
  @doc("Result code as a string. `\"200\"` means success; anything else is an error.")
  code: string;

  @doc("A human-readable explanation of the result.")
  message: string;
}

@doc("Whether a message is coming in to you or going out from you.")
union MessageDirection {
  @doc("A message someone sent to you.")
  "inbound",

  @doc("A message you sent out.")
  "outbound",
}

@doc("""
  The delivery state of a message, reported through `messaging.state` events.
  An outbound message moves through `queued`, `initiated`, and `sent`, then
  settles on one of the final states: `delivered`, `undelivered`, or `failed`.
  """)
union MessageState {
  @doc("Accepted and waiting to be processed.")
  "queued",

  @doc("Processing has started.")
  "initiated",

  @doc("Handed off to the carrier for delivery.")
  "sent",

  @doc("Confirmed delivered to the recipient's phone. A final state.")
  "delivered",

  @doc("The carrier could not deliver the message. A final state.")
  "undelivered",

  @doc("The message failed before reaching the carrier. A final state.")
  "failed",
}
