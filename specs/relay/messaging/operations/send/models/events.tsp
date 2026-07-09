import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "@typespec/openapi";

import "../../../models/core.tsp";

using TypeSpec.OpenAPI;

namespace Relay.Messaging;

@summary("Delivery-state event data")
model StateEventData {
  @doc("The ID of the message, matching the one returned by `messaging.send`.")
  @example("e5c3f2b1-8d0a-4b4c-9f3e-2a1b0c9d8e7f")
  message_id: string;

  @doc("The context the message belongs to.")
  @example("office")
  context: string;

  @doc("The direction of the message, `inbound` or `outbound`.")
  @example("outbound")
  direction: MessageDirection;

  @doc("Your label for the message, echoed back so you can correlate this state update with the message you sent.")
  @example("order-98765")
  tag?: string;

  @doc("Reserved. Always an empty array in the current implementation; use `tag` to label a message.")
  @example(#[])
  tags?: string[];

  @doc("The sender's phone number, in E.164 format.")
  @example("+15551230001")
  from_number: string;

  @doc("The recipient's phone number, in E.164 format.")
  @example("+15551230002")
  to_number: string;

  @doc("The text of the message.")
  @example("Your order has shipped!")
  body: string;

  @doc("Any media URLs included with the message. Absent for text-only messages.")
  @example(#["https://example.com/receipt.png"])
  media?: string[];

  @doc("How many SMS segments the message was split into.")
  @example(1)
  segments: int32;

  @doc("The message's new delivery state.")
  @example("delivered")
  message_state: MessageState;

  @doc("Why the message ended up in this state. Included only when it is `undelivered` or `failed`.")
  @example("spam")
  reason?: string;
}

const messagingState = "messaging.state";
@doc("""
  Fires each time a message's delivery state changes. Match `message_id` to the
  one you got from `messaging.send` and read `message_state` to see where the
  message is in its journey. The event keeps firing until the message reaches a
  final state of `delivered`, `undelivered`, or `failed`.
  """)
@summary(messagingState)
@extension("x-fern-display-name", messagingState)
model StateEvent is MessagingEvent<typeof messagingState, StateEventData>;

@summary("Inbound-message event data")
model ReceiveEventData {
  @doc("The unique ID of this inbound message.")
  @example("e5c3f2b1-8d0a-4b4c-9f3e-2a1b0c9d8e7f")
  message_id: string;

  @doc("The context this message arrived on.")
  @example("office")
  context: string;

  @doc("The direction of the message. Always `inbound` here.")
  @example("inbound")
  direction: MessageDirection;

  @doc("Reserved. Always an empty array in the current implementation.")
  @example(#[])
  tags?: string[];

  @doc("The sender's phone number, in E.164 format.")
  @example("+15551230002")
  from_number: string;

  @doc("The number it was sent to, in E.164 format.")
  @example("+15551230001")
  to_number: string;

  @doc("The text of the message.")
  @example("Is my order on the way?")
  body: string;

  @doc("Any media URLs included with the message.")
  @example(#["https://example.com/photo.jpg"])
  media?: string[];

  @doc("How many SMS segments the message was split into.")
  @example(1)
  segments: int32;

  @doc("The message state. Always `received` for an incoming message.")
  @example("received")
  message_state: "received";
}

const messagingReceive = "messaging.receive";
@doc("""
  Fires when someone sends a message to one of your numbers. The payload gives
  you the full incoming message — who it's from, the text, and any media — so
  you can react or reply.
  """)
@summary(messagingReceive)
@extension("x-fern-display-name", messagingReceive)
model ReceiveEvent is MessagingEvent<typeof messagingReceive, ReceiveEventData>;
