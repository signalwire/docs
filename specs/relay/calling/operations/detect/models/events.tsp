import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "@typespec/openapi";

import "../../../models/core.tsp";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

@doc("What the fax detector heard.")
union CallDetectFaxEvent {
  @doc("The answering fax machine's tone (CED).")
  "CED",

  @doc("The calling fax machine's tone (CNG).")
  "CNG",

  @doc("The detector finished.")
  "finished",
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
    when `detect_interruptions` is `false`, or once a beep has been detected.
    """)
  "READY",

  @doc("""
    The machine's greeting started over and interrupted your message. You only
    receive this when `detect_interruptions=true`.
    """)
  "NOT_READY",

  @doc("The detector finished.")
  "finished",
}

@doc("""
  What the detector found. Read `type` to know which detector reported it: `fax`,
  `machine`, or `digit`. Whatever the type, the `event` field also carries the
  generic `finished` value when the detector completes.
  """)
@summary("Detect result")
@discriminator("type")
model CallDetectResult {
  type: "digit" | "fax" | "machine";
}

@summary("Fax detection result")
model CallDetectFax extends CallDetectResult {
  @example("fax")
  type: "fax";

  params: {
    @doc("What the fax detector heard.")
    @example("CED")
    event: CallDetectFaxEvent;
  };
}

@summary("Answering-machine detection result")
model CallDetectMachine extends CallDetectResult {
  @example("machine")
  type: "machine";

  params: {
    @doc("What the answering-machine detector concluded.")
    @example("MACHINE")
    event: CallDetectMachineEvent;

    @doc("Present and `true` when a beep was detected, signaling it's your turn to leave a message. Absent otherwise.")
    @example(true)
    beep?: boolean;
  };
}

@summary("Digit detection result")
model CallDetectDigit extends CallDetectResult {
  @example("digit")
  type: "digit";

  params: {
    @doc("The DTMF (touch-tone) digit that was detected: one of `0`-`9`, `#`, or `*`. Carries the terminal `finished` value once the detector completes.")
    @example("5")
    event: string;
  };
}

@summary("Detect event")
model CallDetectParams {
  ...CallEventAddress;

  @doc("The `control_id` of the detector this event refers to, returned when you started it with `calling.detect`.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("What the detector found, including which kind of detector reported it.")
  detect: CallDetectResult;
}

const callingCallDetect = "calling.call.detect";
@doc("Fires when a detector reports a result — a fax tone, an answering machine versus a human, or a DTMF digit.")
@summary(callingCallDetect)
@extension("x-fern-display-name", callingCallDetect)
model CallDetectEvent is SignalwireEvent<typeof callingCallDetect, CallDetectParams>;
