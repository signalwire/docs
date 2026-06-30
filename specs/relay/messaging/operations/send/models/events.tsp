import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "@typespec/openapi";

import "../../../models/core.tsp";

using TypeSpec.OpenAPI;

namespace Relay.Messaging;

model StateEventData {
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

const messagingState = "messaging.state";
@doc("""
  Fires each time a message's delivery state changes. Match `message_id` to the
  one you got from `messaging.send` and read `message_state` to see where the
  message is in its journey. The event keeps firing until the message reaches a
  final state of `delivered`, `undelivered`, or `failed`.
  """)
@summary(messagingState)
@extension("x-fern-display-name", messagingState)
model StateEvent is SignalwireEvent<typeof messagingState, StateEventData>;

model ReceiveEventData {
  @doc("The ID of the message.")
  message_id: string;

  @doc("The context this message arrived on.")
  context: string;

  @doc("The direction of the message. Always `inbound` here.")
  direction: MessageDirection;

  @doc("Any tags attached to the message.")
  tags?: string[];

  @doc("The sender's phone number, in E.164 format.")
  from_number: string;

  @doc("The number it was sent to, in E.164 format.")
  to_number: string;

  @doc("The text of the message.")
  body: string;

  @doc("Any media URLs included with the message.")
  media?: string[];

  @doc("How many SMS segments the message was split into.")
  segments: int32;

  @doc("The message state. Always `received` for an incoming message.")
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
model ReceiveEvent is SignalwireEvent<typeof messagingReceive, ReceiveEventData>;
