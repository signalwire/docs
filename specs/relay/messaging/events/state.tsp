import "@signalwire/typespec-asyncapi";

import "../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Messaging;

@doc("""
  Fires each time a message's delivery state changes. Match `message_id` to the
  one you got from `messaging.send` and read `message_state` to see where the
  message is in its journey. The event keeps firing until the message reaches a
  final state of `delivered`, `undelivered`, or `failed`.
  """)
@event("messaging.state")
@example(#{
  message_id: "a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d",
  context: "my_context",
  direction: "outbound",
  tags: #[],
  from_number: "+15551231234",
  to_number: "+15553214321",
  body: "Message Body",
  media: #[],
  segments: 1,
  message_state: "failed",
  reason: "spam",
})
model StateEvent {
  @doc("The ID of the message, matching the one returned by `messaging.send`.")
  message_id: string;

  @doc("The context the message belongs to.")
  context: string;

  @doc("The direction of the message, `inbound` or `outbound`.")
  direction: MessageDirection;

  @doc("Any tags attached to the message.")
  tags?: string[];

  @doc("The sender's phone number, in E.164 format.")
  from_number: string;

  @doc("The recipient's phone number, in E.164 format.")
  to_number: string;

  @doc("The text of the message.")
  body: string;

  @doc("Any media URLs included with the message.")
  media: string[];

  @doc("How many SMS segments the message was split into.")
  segments: int32;

  @doc("The message's new delivery state.")
  message_state: MessageState;

  @doc("Why the message ended up in this state. Included only when it is `undelivered` or `failed`.")
  reason?: string;
}
