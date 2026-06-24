import "@signalwire/typespec-asyncapi";
import "../common.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.dial
// ─────────────────────────────────────────────────────────────────────────────

model DialParams {
  /** Your label for this dial. Every resulting `calling.call.*` and `calling.call.dial` event carries this `tag`, so use it to match events back to this request. */
  tag: string;

  /** Geographic region to place the outbound call from. */
  region?: string;

  /**
   * Devices to dial. The outer array is sequential ringing groups; the inner
   * array is simultaneous (parallel) dials within a group. The first device to
   * answer wins.
   */
  devices: DialDevice[][];

  /** Highest price per minute you're willing to pay. Devices that would exceed this rate aren't dialed. */
  max_price_per_minute?: float64;
}

model DialResult {
  ...RelayResult;
}

/**
 * Places one or more outbound calls to the devices you specify. The first device
 * to answer wins, and any others stop ringing. Use this to start a brand-new call
 * (as opposed to `calling.connect`, which adds a leg to an existing call). The
 * synchronous result only confirms the request was accepted — the call's
 * identifiers and progress arrive asynchronously through `calling.call.dial` and
 * `calling.call.state` events keyed on `tag`.
 */
// NOTE: no @opExample here — the required `devices: DialDevice[][]` is a @discriminator
// base, and TypeSpec value-checking does not narrow a discriminated base to its
// variant, so an inline frame example can't carry real device `params`. The
// DialDevice variant models in common.tsp carry schema-level @example values instead.
@channel("calling.dial")
@summary("Dial outbound call(s); first to answer wins")
op dial(...DialParams): DialResult | CallDialEvent;

// ─────────────────────────────────────────────────────────────────────────────
// calling.answer
// ─────────────────────────────────────────────────────────────────────────────

model AnswerParams {
  ...CallAddress;

  /**
   * Audio codecs to offer when answering, in preference order. If you omit this,
   * SignalWire picks suitable codecs for you. Every codec you list must be
   * supported by the call type — otherwise the request fails with `"400"`. Phone
   * calls accept a narrower set than `sip` or `webrtc` calls, so check
   * `call.device.type` in the `calling.call.state` events to know which call type
   * you're answering.
   */
  codecs?: AnswerCodec[];
}

model AnswerResult {
  ...RelayResult;
}

/** Answers an incoming call so audio begins flowing and you can start controlling it. */
@channel("calling.answer")
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

  /** Why the call is ending. Defaults to `hangup` (a normal end). */
  reason?: CallEndReason = "hangup";
}

model EndResult {
  ...RelayResult;
}

/** Ends a call, whether it's already connected or still ringing. */
@channel("calling.end")
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

  /** Audio to play to the existing caller while the new device rings. Plays in order until the device answers. */
  ringback?: Ringback[];

  /** Your label for the new call leg. Its `calling.call.*` events carry this `tag`. */
  tag?: string;

  /**
   * Devices to call and connect. Uses the same layout as `calling.dial`: the outer
   * array rings groups in sequence, the inner array rings devices in a group at
   * once, and the first device to answer is the one that gets connected.
   */
  devices: ConnectDevice[][];

  /** Maximum length of the connected call, in seconds. The call ends automatically once this is reached. */
  max_duration?: int32;

  /** Highest price per minute you're willing to pay. Devices that would exceed this rate aren't called. */
  max_price_per_minute?: float64;

  /**
   * URL to receive `calling.call.connect` events via POST as the connection
   * progresses through the `connecting`, `connected`, `failed`, and `disconnected`
   * statuses.
   */
  status_url?: url;
}

model ConnectResult {
  ...RelayResult;
}

/**
 * Calls a new device and bridges it to this already-active call, joining both
 * legs together. Use this to add a party to a live call, such as forwarding or
 * transferring a caller. Only one connect can run at a time on a given call — if
 * another operation is still in progress, the request fails with a conflict error
 * telling you to wait for it to finish. Connection progress arrives through
 * `calling.call.connect` events.
 */
// NOTE: no @opExample here — the required `devices: ConnectDevice[][]` (and the
// optional `ringback: Ringback[]`) are @discriminator bases, and TypeSpec
// value-checking does not narrow a discriminated base to its variant, so an inline
// frame example can't carry real device/ringback `params`. The ConnectDevice and
// Ringback variant models in common.tsp carry schema-level @example values instead.
@channel("calling.connect")
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

/**
 * Splits apart legs that were joined with `calling.connect`, separating the calls
 * without hanging up on either one. Each call stays live so you can keep
 * controlling it or connect it elsewhere.
 */
@channel("calling.disconnect")
@summary("Disconnect connected legs without hanging up")
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
  },
  returnType: #{ code: "200", message: "Disconnecting" },
})
op disconnect(...DisconnectParams): DisconnectResult;
