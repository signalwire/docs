import "@signalwire/typespec-asyncapi";

import "../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.detect
// ─────────────────────────────────────────────────────────────────────────────

@doc("What the fax detector heard.")
union CallDetectFaxEvent {
  @doc("The answering fax machine's tone (CED).")
  "CED",

  @doc("The calling fax machine's tone (CNG).")
  "CNG",

  @doc("The detector finished.")
  "finished",

  @doc("The detector could not start.")
  "error",
}

@doc("What the answering-machine detector concluded.")
union CallDetectMachineEvent {
  @doc("An answering machine picked up.")
  "MACHINE",

  @doc("A human answered. This is a final result.")
  "HUMAN",

  @doc("The detector could not tell whether it was a human or a machine.")
  "UNKNOWN",

  @doc("""
    The machine is ready for you to leave your message. This is a final result
    when `detect_interruptions=false` or `beep=true`.
    """)
  "READY",

  @doc("""
    The machine's greeting started over and interrupted your message. You only
    receive this when `detect_interruptions=true`.
    """)
  "NOT_READY",

  @doc("The detector finished.")
  "finished",

  @doc("The detector could not start.")
  "error",
}

@doc("""
  What the detector found. Read `type` to know which detector reported it: `fax`,
  `machine`, or `digit`. Whatever the type, the `event` field can also carry the
  generic `finished` value when the detector completes, or `error` if it could not
  start.
  """)
@discriminator("type")
model CallDetectResult {
  type: string;
}

model CallDetectFax extends CallDetectResult {
  type: "fax";
  params: {
    @doc("What the fax detector heard.")
    event: CallDetectFaxEvent;
  };
}

model CallDetectMachine extends CallDetectResult {
  type: "machine";
  params: {
    @doc("What the answering-machine detector concluded.")
    event: CallDetectMachineEvent;

    @doc("Whether a beep was detected, signaling it's your turn to leave a message.")
    beep?: boolean;
  };
}

model CallDetectDigit extends CallDetectResult {
  type: "digit";
  params: {
    @doc("The DTMF digit that was detected: one of `0`-`9`, `#`, or `*`.")
    event: string;
  };
}

model CallDetectParams {
  ...CallAddress;

  @doc("The `control_id` of the detector this event refers to, returned when you started it with `calling.detect`.")
  control_id: string;

  @doc("What the detector found, including which kind of detector reported it.")
  detect: CallDetectResult;
}

@doc("Fires when a detector reports a result — a fax tone, an answering machine versus a human, or a DTMF digit.")
// No @example: the required `detect` field is typed as the @discriminator base
// `CallDetectResult`, which @example cannot narrow to a concrete variant
// (fax/machine/digit). Omitting a required field would be an invalid example.
@event("calling.call.detect")
model CallDetectEvent {
  ...CallDetectParams;
}
