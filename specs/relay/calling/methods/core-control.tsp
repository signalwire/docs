import "@signalwire/typespec-asyncapi";
import "../common.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.begin (deprecated)
// ─────────────────────────────────────────────────────────────────────────────

model BeginParams {
  /** Identifier added to all call events. */
  tag?: string;

  /** Region to originate from (account/device default if unset). */
  region?: string;

  /** The single device to call (only `phone` is documented for this method). */
  device: DialDevice;
}

model BeginResult {
  ...RelayResult;

  /** The created call id. */
  call_id?: string;

  /** Node the call is on. */
  node_id?: string;
}

/** (Deprecated — use `calling.dial`.) Make an outbound call to a single device. */
@rpcMethod("calling.begin")
@summary("(Deprecated) Make an outbound call to a single device")
op begin(...BeginParams): BeginResult;

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
@rpcMethod("calling.dial")
@summary("Dial outbound call(s); first to answer wins")
op dial(...DialParams): DialResult;

// ─────────────────────────────────────────────────────────────────────────────
// calling.answer
// ─────────────────────────────────────────────────────────────────────────────

model AnswerParams {
  ...CallAddress;

  /**
   * Codecs to negotiate (SignalWire-picked if unset). If a listed codec is
   * unsupported by the call type the request fails with `"400"`.
   */
  codecs?: AnswerCodec[];
}

model AnswerResult {
  ...RelayResult;
}

/** Answer an incoming call. */
@rpcMethod("calling.answer")
@summary("Answer an incoming call")
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

  /** URL to POST connect events to. */
  status_url?: url;
}

model ConnectResult {
  ...RelayResult;
}

/**
 * Call a device and connect it to this active call. Only one connect may execute
 * at a time per call.
 */
@rpcMethod("calling.connect")
@summary("Connect a device to an active call")
op connect(...ConnectParams): ConnectResult;

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
op disconnect(...DisconnectParams): DisconnectResult;
