import "@signalwire/typespec-asyncapi";

import "../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Messaging;

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

@doc("""
  Fires when someone sends a message to one of your numbers. The payload gives
  you the full incoming message — who it's from, the text, and any media — so
  you can react or reply.
  """)
@summary("messaging.receive")
model ReceiveEvent is SignalwireEvent<"messaging.receive", ReceiveEventData>;
