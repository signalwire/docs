import "@signalwire/typespec-asyncapi";
import "../common.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.dial
// ─────────────────────────────────────────────────────────────────────────────

model DialParams {
  /** Identifier added to all call and dial events. */
  tag: string;

  /** Region to originate from. */
  region?: string;

  /**
   * Devices to dial. The outer array is sequential ringing groups; the inner
   * array is simultaneous (parallel) dials within a group. The first device to
   * answer wins.
   */
  devices: DialDevice[][];

  /** Maximum price per minute willing to be paid. */
  max_price_per_minute?: float64;
}

model DialResult {
  ...RelayResult;
}

/**
 * Dial outbound call(s) to device(s). First device to answer wins. Call
 * identifiers arrive asynchronously via `calling.call.dial` / `calling.call.state`
 * events keyed on `tag` — not in this synchronous result.
 */
// NOTE: no @opExample here — the required `devices: DialDevice[][]` is a @discriminator
// base, and TypeSpec value-checking does not narrow a discriminated base to its
// variant, so an inline frame example can't carry real device `params`. The
// DialDevice variant models in common.tsp carry schema-level @example values instead.
@rpcMethod("calling.dial")
@summary("Dial outbound call(s); first to answer wins")
op dial(...DialParams): DialResult | CallDialEvent;

// ─────────────────────────────────────────────────────────────────────────────
// calling.answer
// ─────────────────────────────────────────────────────────────────────────────

model AnswerParams {
  ...CallAddress;

  /**
   * Codecs to negotiate (SignalWire-picked if unset). If a listed codec is
   * unsupported by the call type the request fails with `"400"` — check
   * `call.device.type` in `calling.call.state` events to determine the call type
   * (`phone` supports a narrower set than `sip`/`webrtc`).
   */
  codecs?: AnswerCodec[];
}

model AnswerResult {
  ...RelayResult;
}

/** Answer an incoming call. */
@rpcMethod("calling.answer")
@summary("Answer an incoming call")
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
    codecs: #["PCMU", "PCMA"],
  },
  returnType: #{ code: "200", message: "Answered" },
})
op answer(...AnswerParams): AnswerResult;

// ─────────────────────────────────────────────────────────────────────────────
// calling.end
// ─────────────────────────────────────────────────────────────────────────────

model EndParams {
  ...CallAddress;

  /** Why the call is ending. */
  reason?: CallEndReason = "hangup";
}

model EndResult {
  ...RelayResult;
}

/** End an active or ringing call. */
@rpcMethod("calling.end")
@summary("End a call")
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
    reason: "hangup",
  },
  returnType: #{ code: "200", message: "Disconnecting call" },
})
op end(...EndParams): EndResult;

// ─────────────────────────────────────────────────────────────────────────────
// calling.connect
// ─────────────────────────────────────────────────────────────────────────────

model ConnectParams {
  ...CallAddress;

  /** Audio to play to the caller while connecting. */
  ringback?: Ringback[];

  /** Identifier added to created calls' events. */
  tag?: string;

  /**
   * Devices to connect. Same sequential/parallel topology as `calling.dial`.
   */
  devices: ConnectDevice[][];

  /** Maximum duration once connected, in MINUTES. */
  max_duration?: int32;

  /** Maximum price per minute willing to be paid. */
  max_price_per_minute?: float64;

  /**
   * URL to POST `calling.call.connect` events to (statuses: `connecting`,
   * `connected`, `failed`, `disconnected`).
   */
  status_url?: url;
}

model ConnectResult {
  ...RelayResult;
}

/**
 * Call a device and connect it to this active call. Only one connect may execute
 * at a time per call.
 */
// NOTE: no @opExample here — the required `devices: ConnectDevice[][]` (and the
// optional `ringback: Ringback[]`) are @discriminator bases, and TypeSpec
// value-checking does not narrow a discriminated base to its variant, so an inline
// frame example can't carry real device/ringback `params`. The ConnectDevice and
// Ringback variant models in common.tsp carry schema-level @example values instead.
@rpcMethod("calling.connect")
@summary("Connect a device to an active call")
op connect(...ConnectParams): ConnectResult | CallConnectEvent;

// ─────────────────────────────────────────────────────────────────────────────
// calling.disconnect
// ─────────────────────────────────────────────────────────────────────────────

model DisconnectParams {
  ...CallAddress;
}

model DisconnectResult {
  ...RelayResult;
}

/** Disconnect all calls from this call without hanging up on them. */
@rpcMethod("calling.disconnect")
@summary("Disconnect connected legs without hanging up")
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
  },
  returnType: #{ code: "200", message: "Disconnecting" },
})
op disconnect(...DisconnectParams): DisconnectResult;
