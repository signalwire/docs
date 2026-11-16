import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Messaging;

@doc("""
  The outcome of a request. `code` is a string set to `"200"` when the request
  succeeds; any other value (such as `"400"` or `"404"`) means it failed, and
  `message` explains why.
  """)
@summary("Request result")
model Result {
  @doc("Result code as a string. `\"200\"` means success; anything else is an error.")
  @example("200")
  code: string;

  @doc("A human-readable explanation of the result.")
  @example("Message accepted")
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
  An outbound message starts at `queued` and moves to `sent` once it's handed off
  for delivery, or to `failed` or `undelivered` if it can't be sent. After `sent`,
  what you receive depends on the channel:

  - **SMS and MMS** settle on `delivered` or `undelivered`.
  - **RCS** reports `delivered` or `undelivered`. When the recipient reads the
    message, `read` follows, either after `delivered` or straight after `sent`.
  - **WhatsApp** reports no further states after `sent`.
  """)
union MessageState {
  @doc("Accepted and waiting to be processed.")
  "queued",

  @doc("Processing has started.")
  "initiated",

  @doc("Handed off to the carrier for delivery.")
  "sent",

  @doc("Confirmed delivered to the recipient's device. Final for SMS and MMS; an RCS message can still move to `read`.")
  "delivered",

  @doc("The carrier could not deliver the message. A final state.")
  "undelivered",

  @doc("The message failed before reaching the carrier. A final state.")
  "failed",

  @doc("The recipient read the message. Reported for RCS messages only. A final state.")
  "read",
}
