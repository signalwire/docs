import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

/**
 * The Relay **WebRTC** service is a thin transport wrapper around the Verto
 * signaling sub-protocol. Methods are dispatched as `blade.execute`; the
 * `message` method tunnels an opaque inner Verto JSON-RPC frame to FreeSWITCH,
 * and `conference.list` enumerates joinable conferences. It rides on a
 * connection established by `signalwire.connect`.
 *
 * The inner Verto message protocol itself (`verto.invite`/`verto.answer`/
 * `verto.bye`/`verto.modify`, `dialogParams`, conference control) is OUT OF
 * SCOPE here and is modeled as a loose pass-through. Its full union is defined
 * separately in `verto_messages.md`.
 */
@service(#{ title: "SignalWire Relay — WebRTC" })
@server("production", #{
  host: "relay.signalwire.com",
  protocol: "wss",
  description: "SignalWire Relay WebSocket endpoint.",
})
@channel("webrtc")
@bearerAuth("JWT")
namespace Relay.WebRTC;

// ═════════════════════════════════════════════════════════════════════════════
// Shared result envelope
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

// ═════════════════════════════════════════════════════════════════════════════
// webrtc.message
// ═════════════════════════════════════════════════════════════════════════════

model MessageParams {
  /**
   * The FreeSWITCH node id this message targets. Set by the client to the FS
   * nodeid once a call exists (sourced from prior events/responses); absent on
   * the very first message before a call is established.
   */
  node_id?: string;

  /**
   * The inner Verto JSON-RPC 2.0 frame to transport to FreeSWITCH (e.g. a
   * `verto.invite` with `dialogParams`/`sdp`/`layout`/`positions`). Modeled as
   * a loose pass-through: the full Verto method/`params` union is out of scope
   * here (see `verto_messages.md`).
   */
  message: Record<unknown>;

  /**
   * "Event channel" subscriptions to apply alongside this request — intended
   * for the case of joining a conference and wanting its event feed. Values are
   * conference/room event channels (e.g. `member.joined`, `member.left`,
   * `room.ended`, `room.updated`, `layout.changed`, `member.updated`);
   * illustrative, not exhaustive.
   */
  subscribe?: string[];
}

/**
 * Transport a Verto JSON-RPC message from the client to FreeSWITCH. Carries the
 * opaque inner Verto frame plus optional event-channel subscriptions.
 *
 * The result only acknowledges receipt/forwarding (`"Received"`); the actual
 * Verto outcome arrives asynchronously via the `webrtc.message` event.
 */
@rpcMethod("message")
@summary("Transport a Verto message to FreeSWITCH")
op message(...MessageParams): MessageResult;

/** Acknowledgement that the Verto message was received and forwarded. */
model MessageResult {
  ...Result;
}

// ═════════════════════════════════════════════════════════════════════════════
// conference.list
// ═════════════════════════════════════════════════════════════════════════════

/** Empty parameters — `conference.list` takes no arguments. */
model ConferenceListParams {}

/** A single active conference the client may join. */
model Conference {
  /** The FreeSWITCH node id hosting the conference. */
  node_id: string;

  /** The conference's UUID. */
  conference_id: string;

  /** Human-readable conference name (e.g. `Awesome Room!`). */
  name: string;

  /** Extension to dial to reach the conference. */
  extension: string;

  /** Creation/last-activity time, in seconds since epoch (microsecond resolution). */
  timestamp: float64;
}

model ConferenceListResult {
  ...Result;

  /** The active conferences the current client can join. */
  data: Conference[];
}

/**
 * List the active conferences the current client can join. Async-safe.
 */
@rpcMethod("conference.list")
@summary("List joinable conferences")
op conferenceList(...ConferenceListParams): ConferenceListResult;

// ═════════════════════════════════════════════════════════════════════════════
// Events
//
// The shared event envelope (event_channel/timestamp/project_id) is folded into
// the carrier by the emitter; only the inner event params are authored here.
// ═════════════════════════════════════════════════════════════════════════════

/**
 * Transport event delivering a Verto JSON-RPC message from FreeSWITCH back to
 * the client — both Verto responses and subscribed conference/room events.
 *
 * The inner `params` is the opaque Verto frame; its full union is out of scope
 * here (see `verto_messages.md`).
 */
@event("webrtc.message")
model MessageEvent {
  /**
   * The FreeSWITCH node id sending the event. Sent by FS so the client can
   * capture the specific nodeid once a call is started.
   */
  node_id?: string;

  /**
   * The Verto JSON-RPC frame being transported (a Verto response or a
   * conference/room event). Loose pass-through — see `verto_messages.md`.
   */
  params: Record<unknown>;
}
