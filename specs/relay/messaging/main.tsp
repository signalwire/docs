import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

/**
 * Send SMS and MMS messages to phone numbers and react to incoming messages and
 * delivery updates. Call `messaging.send` to send a message, then listen for
 * `messaging.state` events to track delivery and `messaging.receive` events to
 * handle replies. Messages are grouped by a **context** you choose, so you can
 * route events for different parts of your app to different handlers.
 *
 * Use this from your server. Browser clients send messages through the REST API
 * instead.
 */
@channel("messaging")
namespace Relay.Messaging;

// ═════════════════════════════════════════════════════════════════════════════
// Shared result envelope & enums
// ═════════════════════════════════════════════════════════════════════════════

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

// ═════════════════════════════════════════════════════════════════════════════
// messaging.send
// ═════════════════════════════════════════════════════════════════════════════

model SendParams {
  /** The context that delivery and reply events for this message are sent to. */
  context: string;

  /** Your own labels to attach to the message, so you can search for it in the UI later. */
  tags?: string[];

  /**
   * The region of the world to send the message from. If you leave this out,
   * SignalWire picks one based on your account settings.
   */
  region?: string;

  /** The recipient's phone number, in E.164 format (for example, `+15551231234`). */
  to_number: string;

  /** The phone number to send from, in E.164 format. Must be a number on your account. */
  from_number: string;

  /**
   * The text of the message. You must include `body`, `media`, or both — at
   * least one is required.
   */
  body?: string;

  /**
   * One or more media URLs to send as an MMS. You must include `body`, `media`,
   * or both — at least one is required.
   */
  media?: string[];
}

model SendResult {
  ...Result;

  /** The ID of the accepted message, returned when the send succeeds. Use it to match up later state events. */
  message_id: string;
}

/**
 * Send an SMS or MMS to a phone number. Include `body`, `media`, or both. A
 * successful response means SignalWire accepted the message and returns its
 * `message_id` — it does not mean the message was delivered yet. Watch for
 * `messaging.state` events on the same `context` to follow delivery.
 */
@rpcMethod("messaging.send")
@summary("Send an outbound message")
@opExample(#{
  parameters: #{
    context: "my_context",
    tags: #["Custom", "client", "data"],
    region: "us",
    to_number: "+15553214321",
    from_number: "+15551231234",
    body: "Message Body",
    media: #["https://example.com/cat.jpg"],
  },
  returnType: #{
    code: "200",
    message: "Message accepted",
    message_id: "b1c2d3e4-5f6a-7b8c-9d0e-1f2a3b4c5d6e",
  },
})
op send(...SendParams): SendResult;

// ═════════════════════════════════════════════════════════════════════════════
// Events
//
// The shared event envelope (context/timestamp/space_id/project_id) is folded
// into the carrier by the emitter; only the inner event params are authored.
// ═════════════════════════════════════════════════════════════════════════════

/**
 * Fires when someone sends a message to one of your numbers. The payload gives
 * you the full incoming message — who it's from, the text, and any media — so
 * you can react or reply.
 */
@event("messaging.receive")
@example(#{
  message_id: "a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d",
  context: "my_context",
  direction: "inbound",
  tags: #["Custom", "client", "data"],
  from_number: "+15551231234",
  to_number: "+15553214321",
  body: "Message Body",
  media: #["https://example.com/cat.jpg"],
  segments: 1,
  message_state: "received",
})
model ReceiveEvent {
  /** The ID of the message. */
  message_id: string;

  /** The context this message arrived on. */
  context: string;

  /** The direction of the message. Always `inbound` here. */
  direction: MessageDirection;

  /** Any tags attached to the message. */
  tags?: string[];

  /** The sender's phone number, in E.164 format. */
  from_number: string;

  /** The number it was sent to, in E.164 format. */
  to_number: string;

  /** The text of the message. */
  body: string;

  /** Any media URLs included with the message. */
  media: string[];

  /** How many SMS segments the message was split into. */
  segments: int32;

  /** The message state. Always `received` for an incoming message. */
  message_state: "received";
}

/**
 * Fires each time a message's delivery state changes. Match `message_id` to the
 * one you got from `messaging.send` and read `message_state` to see where the
 * message is in its journey. The event keeps firing until the message reaches a
 * final state of `delivered`, `undelivered`, or `failed`.
 */
@event("messaging.state")
@example(#{
  message_id: "a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d",
  context: "my_context",
  direction: "outbound",
  tags: #["Custom", "client", "data"],
  from_number: "+15551231234",
  to_number: "+15553214321",
  body: "Message Body",
  media: #[],
  segments: 1,
  message_state: "failed",
  reason: "spam",
})
model StateEvent {
  /** The ID of the message, matching the one returned by `messaging.send`. */
  message_id: string;

  /** The context the message belongs to. */
  context: string;

  /** The direction of the message, `inbound` or `outbound`. */
  direction: MessageDirection;

  /** Any tags attached to the message. */
  tags?: string[];

  /** The sender's phone number, in E.164 format. */
  from_number: string;

  /** The recipient's phone number, in E.164 format. */
  to_number: string;

  /** The text of the message. */
  body: string;

  /** Any media URLs included with the message. */
  media: string[];

  /** How many SMS segments the message was split into. */
  segments: int32;

  /** The message's new delivery state. */
  message_state: MessageState;

  /** Why the message ended up in this state. Included only when it is `undelivered` or `failed`. */
  reason?: string;
}
