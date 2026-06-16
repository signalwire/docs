import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

/**
 * The Relay **Messaging** service sends outbound SMS/MMS to PSTN numbers and
 * delivers inbound-message and delivery-state events. It rides on a connection
 * established by `signalwire.connect`; messages are routed by **context**.
 */
@service(#{ title: "SignalWire Relay — Messaging" })
@server("production", #{
  host: "relay.signalwire.com",
  protocol: "wss",
  pathname: "/api/relay/wss",
  description: "SignalWire Relay WebSocket endpoint.",
})
@channel("messaging")
@bearerAuth("JWT")
namespace Relay.Messaging;

// ═════════════════════════════════════════════════════════════════════════════
// Shared result envelope & enums
// ═════════════════════════════════════════════════════════════════════════════

/**
 * The common Relay result envelope. `code` is a STRING (`"200"` on success);
 * errors are carried in-band via a non-`"200"` `code` plus `message` — there is
 * no JSON-RPC `error` object.
 */
model Result {
  /** Result code (string), e.g. `"200"`, `"400"`, `"404"`. */
  code: string;

  /** Human-readable result message. */
  message: string;
}

/** The direction of a message relative to the SignalWire platform. */
union MessageDirection {
  /** Message received from the carrier network (toward the client). */
  "inbound",

  /** Message sent toward the carrier network (away from the client). */
  "outbound",
}

/** Delivery-lifecycle state of a message (`messaging.state`). */
union MessageState {
  /** Message accepted and waiting to be processed. */
  "queued",

  /** Message processing has started. */
  "initiated",

  /** Message handed off to the carrier. */
  "sent",

  /** Carrier confirmed delivery to the handset. */
  "delivered",

  /** Carrier reported the message could not be delivered. */
  "undelivered",

  /** Message failed before/at the carrier. */
  "failed",
}

// ═════════════════════════════════════════════════════════════════════════════
// messaging.send
// ═════════════════════════════════════════════════════════════════════════════

model SendParams {
  /** The context to receive inbound events for this message. */
  context: string;

  /** Optional client-defined tags, surfaced for searching in the UI. */
  tags?: string[];

  /**
   * Region of the world to originate the message from. Defaults to a value
   * picked from account preferences or device location.
   */
  region?: string;

  /** Destination phone number, in E.164 format. */
  to_number: string;

  /** Origin phone number, in E.164 format. */
  from_number: string;

  /**
   * Body of the message. Required if `media` is absent; at least one of `body`
   * or `media` must be present (both may be supplied).
   */
  body?: string;

  /**
   * An array of media URLs to send (MMS). Required if `body` is absent; at
   * least one of `body` or `media` must be present (both may be supplied).
   */
  media?: string[];
}

model SendResult {
  ...Result;

  /** The UUID of the accepted message (present on success). */
  message_id: string;
}

/**
 * Send an outbound SMS/MMS to a PSTN phone number. At least one of `body` or
 * `media` must be supplied.
 */
@rpcMethod("messaging.send")
@summary("Send an outbound message")
op send(...SendParams): SendResult;

// ═════════════════════════════════════════════════════════════════════════════
// Events
//
// The shared event envelope (context/timestamp/space_id/project_id) is folded
// into the carrier by the emitter; only the inner event params are authored.
// ═════════════════════════════════════════════════════════════════════════════

/**
 * An inbound message has been received.
 */
@event("messaging.receive")
model ReceiveEvent {
  /** The UUID of the message. */
  message_id: string;

  /** The context the message was set on. */
  context: string;

  /** The message's direction. Always `inbound` for this event. */
  direction: MessageDirection;

  /** Optional client data this message is tagged with. */
  tags?: string[];

  /** Origin phone number, in E.164 format. */
  from_number: string;

  /** Destination phone number, in E.164 format. */
  to_number: string;

  /** Body of the message. */
  body: string;

  /** An array of media URLs included with the message. */
  media: string[];

  /** Number of segments the message was split into. */
  segments: int32;

  /** The message state. Always `received` for an inbound message. */
  message_state: "received";
}

/**
 * A change in the delivery state of a message.
 */
@event("messaging.state")
model StateEvent {
  /** The UUID of the message. */
  message_id: string;

  /** The context the message was set on. */
  context: string;

  /** The message's direction. */
  direction: MessageDirection;

  /** Optional client data this message is tagged with. */
  tags?: string[];

  /** Origin phone number, in E.164 format. */
  from_number: string;

  /** Destination phone number, in E.164 format. */
  to_number: string;

  /** Body of the message. */
  body: string;

  /** An array of media URLs included with the message. */
  media: string[];

  /** Number of segments the message was split into. */
  segments: int32;

  /** The new delivery-lifecycle state of the message. */
  message_state: MessageState;

  /** Explanation of the state. Present only on `undelivered`/`failed`. */
  reason?: string;
}
