import "@signalwire/typespec-asyncapi";

import "../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.detect
// ─────────────────────────────────────────────────────────────────────────────

/** What the fax detector heard. */
union CallDetectFaxEvent {
  /** The answering fax machine's tone (CED). */
  "CED",

  /** The calling fax machine's tone (CNG). */
  "CNG",

  /** The detector finished. */
  "finished",

  /** The detector could not start. */
  "error",
}

/** What the answering-machine detector concluded. */
union CallDetectMachineEvent {
  /** An answering machine picked up. */
  "MACHINE",

  /** A human answered. This is a final result. */
  "HUMAN",

  /** The detector could not tell whether it was a human or a machine. */
  "UNKNOWN",

  /**
   * The machine is ready for you to leave your message. This is a final result
   * when `detect_interruptions=false` or `beep=true`.
   */
  "READY",

  /**
   * The machine's greeting started over and interrupted your message. You only
   * receive this when `detect_interruptions=true`.
   */
  "NOT_READY",

  /** The detector finished. */
  "finished",

  /** The detector could not start. */
  "error",
}

/**
 * What the detector found. Read `type` to know which detector reported it: `fax`,
 * `machine`, or `digit`. Whatever the type, the `event` field can also carry the
 * generic `finished` value when the detector completes, or `error` if it could not
 * start.
 */
@discriminator("type")
model CallDetectResult {
  type: string;
}

model CallDetectFax extends CallDetectResult {
  type: "fax";
  params: {
    /** What the fax detector heard. */
    event: CallDetectFaxEvent;
  };
}

model CallDetectMachine extends CallDetectResult {
  type: "machine";
  params: {
    /** What the answering-machine detector concluded. */
    event: CallDetectMachineEvent;

    /** Whether a beep was detected, signaling it's your turn to leave a message. */
    beep?: boolean;
  };
}

model CallDetectDigit extends CallDetectResult {
  type: "digit";
  params: {
    /** The DTMF digit that was detected: one of `0`-`9`, `#`, or `*`. */
    event: string;
  };
}

model CallDetectParams {
  ...CallAddress;

  /** The `control_id` of the detector this event refers to, returned when you started it with `calling.detect`. */
  control_id: string;

  /** What the detector found, including which kind of detector reported it. */
  detect: CallDetectResult;
}

/** Fires when a detector reports a result — a fax tone, an answering machine versus a human, or a DTMF digit. */
// No @example: the required `detect` field is typed as the @discriminator base
// `CallDetectResult`, which @example cannot narrow to a concrete variant
// (fax/machine/digit). Omitting a required field would be an invalid example.
@event("calling.call.detect")
model CallDetectEvent {
  ...CallDetectParams;
}
