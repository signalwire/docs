import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

/**
 * The Relay **WebRTC** service carries WebRTC signaling. You use the `message`
 * method to send a Verto frame between your client and SignalWire — this is how
 * you place, answer, and modify peer calls — and `conference.list` to discover
 * the conferences you can join. The service runs over a connection you've already
 * established with `signalwire.connect`.
 *
 * You build and read Verto frames yourself (`verto.invite`/`verto.answer`/
 * `verto.bye`/`verto.modify`, `dialogParams`, conference control). The frame
 * payload is passed through as-is; the full set of Verto methods and their
 * `params` is documented separately in `verto_messages.md`.
 *
 * **Audience:** client-side. The browser SDK exposes this for peer (Verto)
 * calling; server-side code uses the `calling` service instead. Authenticate
 * with a `jwt_token`.
 */
@channel("webrtc")
@channelPerCommand
namespace Relay.WebRTC;

// ═════════════════════════════════════════════════════════════════════════════
// Shared result envelope
// ═════════════════════════════════════════════════════════════════════════════

/**
 * The result envelope returned by every WebRTC method. `code` is a string
 * (`"200"` on success); on failure you get a non-`"200"` `code` and a
 * `message` explaining what went wrong.
 */
model Result {
  /** Result code (string), e.g. `"200"`, `"400"`, `"404"`. */
  code: string;

  /** Human-readable result message. */
  message: string;
}

// ═════════════════════════════════════════════════════════════════════════════
// webrtc.message
// ═════════════════════════════════════════════════════════════════════════════

model MessageParams {
  /**
   * The node hosting your call. Once a call exists, set this to the `node_id`
   * you received in an earlier event or response so the frame reaches the right
   * place. Leave it absent on your first message, before a call has been
   * established — SignalWire picks the node.
   */
  node_id?: string;

  /**
   * The Verto frame to send (for example a `verto.invite` carrying
   * `dialogParams`/`sdp`/`layout`/`positions`). The frame is passed through
   * as-is; see `verto_messages.md` for the full list of Verto methods and their
   * `params`.
   */
  message: Record<unknown>;

  /**
   * Event channels to subscribe to alongside this request — useful when you
   * join a conference and want its event feed. Values are conference/room event
   * channels such as `member.joined`, `member.left`, `room.ended`,
   * `room.updated`, `layout.changed`, and `member.updated` (illustrative, not
   * exhaustive).
   */
  subscribe?: string[];
}

/**
 * Send a Verto frame from your client to SignalWire — this is how you place,
 * answer, modify, or end a peer call. Pass the frame in `message`, and
 * optionally subscribe to conference/room event channels in the same request.
 *
 * The result only confirms that SignalWire received and forwarded the frame
 * (`"Received"`). The actual Verto outcome arrives later as a `webrtc.message`
 * event, so wait for that event rather than treating this acknowledgement as
 * the call result.
 */
@rpcMethod("message")
@summary("Send a Verto frame")
@opExample(#{
  parameters: #{
    node_id: "f1d2c3b4-a596-4877-8b1e-0123456789ab",
    message: #{
      jsonrpc: "2.0",
      id: "12345",
      method: "verto.invite",
      params: #{
        dialogParams: #{},
        sdp: "v=0...",
        layout: "screenshare",
        restore_layout: true,
        positions: #{ self: "reserved-1", `12345678`: "standard" },
      },
    },
    subscribe: #[
      "member.joined",
      "member.left",
      "room.ended",
      "room.updated",
      "layout.changed",
      "member.updated",
    ],
  },
  returnType: #{ code: "200", message: "Received" },
})
op message(...MessageParams): MessageResult;

/** Confirms that SignalWire received and forwarded your Verto frame. */
model MessageResult {
  ...Result;
}

// ═════════════════════════════════════════════════════════════════════════════
// conference.list
// ═════════════════════════════════════════════════════════════════════════════

/** `conference.list` takes no arguments. */
model ConferenceListParams {}

/** A single active conference you can join. */
model Conference {
  /** The node hosting this conference. Use it as the `node_id` when you join. */
  node_id: string;

  /** The conference's UUID. */
  conference_id: string;

  /** Human-readable conference name (e.g. `Awesome Room!`). */
  name: string;

  /** The extension to dial to reach the conference. */
  extension: string;

  /** When the conference was created or last active, in seconds since the epoch (with fractional seconds). */
  timestamp: float64;
}

model ConferenceListResult {
  ...Result;

  /** The active conferences you can join. */
  data: Conference[];
}

/**
 * List the active conferences you can join. Each entry gives you the name,
 * extension, and `node_id` you need to join. Takes no arguments.
 */
@rpcMethod("conference.list")
@summary("List joinable conferences")
@opExample(#{
  parameters: #{},
  returnType: #{
    code: "200",
    message: "Success",
    data: #[
      #{
        node_id: "f1d2c3b4-a596-4877-8b1e-0123456789ab",
        conference_id: "9a8b7c6d-5e4f-4a3b-2c1d-0fedcba98765",
        name: "Awesome Room!",
        extension: "5551234",
        timestamp: 1234567.1234,
      },
    ],
  },
})
op conferenceList(...ConferenceListParams): ConferenceListResult;

// ═════════════════════════════════════════════════════════════════════════════
// Events
//
// The shared event envelope (event_channel/timestamp/project_id) is folded into
// the carrier by the emitter; only the inner event params are authored here.
// ═════════════════════════════════════════════════════════════════════════════

/**
 * Delivers a Verto frame from SignalWire back to your client. This fires when
 * SignalWire has a Verto response to one of your `message` requests, or when a
 * conference/room event arrives on a channel you subscribed to. Read the frame
 * in `params` to learn the outcome.
 *
 * The frame in `params` is passed through as-is; see `verto_messages.md` for
 * the full set of Verto methods and their `params`.
 */
@event("webrtc.message")
@example(#{
  node_id: "f1d2c3b4-a596-4877-8b1e-0123456789ab",
  params: #{
    jsonrpc: "2.0",
    id: "12345",
    method: "verto.media",
    params: #{
      callID: "7c6d5e4f-3a2b-4c1d-0fed-cba987654321",
      sdp: "v=0...",
    },
  },
})
model MessageEvent {
  /**
   * The node that sent this event. Capture it once your call starts and reuse
   * it as the `node_id` on your subsequent `message` requests so they reach the
   * same node.
   */
  node_id?: string;

  /**
   * The Verto frame being delivered — either a Verto response or a
   * conference/room event. Passed through as-is; see `verto_messages.md`.
   */
  params: Record<unknown>;
}
