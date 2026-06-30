import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "@typespec/openapi";

import "../../../models/core.tsp";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.collect
// ─────────────────────────────────────────────────────────────────────────────

@doc("Where input collection currently stands: still listening, finished, or stopped on an error.")
union CallCollectState {
  "collecting",
  "error",
  "finished",
}

@doc("""
  What the caller gave you. Read `type` to know which kind of result this is. The
  `error`, `no_input`, `no_match`, and `start_of_input` types are markers with no
  extra data, while `digit` and `speech` include a `params` object with the
  collected input.
  """)
@discriminator("type")
model CallCollectResult {
  type: string;
}

model CallCollectResultError extends CallCollectResult {
  type: "error";
}

model CallCollectResultNoInput extends CallCollectResult {
  type: "no_input";
}

model CallCollectResultNoMatch extends CallCollectResult {
  type: "no_match";
}

@doc("Signals that the caller has started speaking. You only receive this when you collect with `calling.collect`.")
model CallCollectResultStartOfInput extends CallCollectResult {
  type: "start_of_input";
}

model CallCollectResultDigit extends CallCollectResult {
  type: "digit";
  params: {
    @doc("The DTMF digits the caller pressed.")
    digits: string;

    @doc("The digit that ended collection, if the caller pressed your terminator key.")
    terminator?: string;
  };
}

model CallCollectResultSpeech extends CallCollectResult {
  type: "speech";
  params: {
    @doc("The text the speech recognizer heard the caller say.")
    text: string;

    @doc("How confident the recognizer is in the result (for example `83.2`).")
    confidence?: float64;
  };
}

model CallCollectParams {
  ...CallAddress;

  @doc("The `control_id` of the collection this event refers to, returned when you started it with `calling.collect`.")
  control_id: string;

  @doc("Where the collection currently stands. `error` means it stopped because something went wrong. Present for partial and continuous collections; a one-shot collect reports its `result` without a `state`.")
  state?: CallCollectState;

  @doc("What the caller gave you. Check its `type` to handle digits, speech, or a no-input/no-match marker.")
  result?: CallCollectResult;

  @doc("""
    Relevant when you requested partial or continuous results: `true` once the
    recognizer has finished the current utterance. With `continuous: true`, the
    collector then restarts to listen for the next one.
    """)
  final?: boolean;
}

const callingCallCollect = "calling.call.collect";
@doc("Fires as you collect input from a caller — DTMF digits or speech — reporting partial and final results so you can react to what they said or pressed.")
@summary(callingCallCollect)
@extension("x-fern-display-name", callingCallCollect)
model CallCollectEvent is SignalwireEvent<typeof callingCallCollect, CallCollectParams>;
