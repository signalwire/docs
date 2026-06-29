import "@signalwire/typespec-asyncapi";

import "../models/core.tsp";

using SignalWire.AsyncAPI;

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

@doc("""
  Fires each time a message's delivery state changes. Match `message_id` to the
  one you got from `messaging.send` and read `message_state` to see where the
  message is in its journey. The event keeps firing until the message reaches a
  final state of `delivered`, `undelivered`, or `failed`.
  """)
@summary("messaging.state")
model StateEvent is SignalwireEvent<"messaging.state", StateEventData>;
