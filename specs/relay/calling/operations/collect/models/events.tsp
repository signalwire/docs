import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "@typespec/openapi";

import "../../../models/core.tsp";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

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
@summary("Collect result")
@discriminator("type")
model CallCollectResult {
  type: "digit" | "error" | "finished" | "no_input" | "no_match" | "speech" | "start_of_input";
}

@doc("The collect failed before producing input.")
@summary("Collect error result")
model CallCollectResultError extends CallCollectResult {
  @example("error")
  type: "error";
}

@doc("No input was received before the timeout.")
@summary("Collect no-input result")
model CallCollectResultNoInput extends CallCollectResult {
  @example("no_input")
  type: "no_input";
}

@doc("Input was received but did not match your `digits`/`speech` criteria.")
@summary("Collect no-match result")
model CallCollectResultNoMatch extends CallCollectResult {
  @example("no_match")
  type: "no_match";
}

@doc("Signals that the caller has started speaking. You only receive this when you collect with `calling.collect`.")
@summary("Start-of-input result")
model CallCollectResultStartOfInput extends CallCollectResult {
  @example("start_of_input")
  type: "start_of_input";
}

@doc("Signals that collection ended without producing input — for example the call hung up or the collect was stopped.")
@summary("Collect finished result")
model CallCollectResultFinished extends CallCollectResult {
  @example("finished")
  type: "finished";
}

@summary("Collected digit result")
model CallCollectResultDigit extends CallCollectResult {
  @example("digit")
  type: "digit";

  params: {
    @doc("The DTMF (touch-tone) digits the caller pressed.")
    @example("1234")
    digits: string;

    @doc("The digit that ended collection, if the caller pressed your terminator key.")
    @example("#")
    terminator?: string;
  };
}

@summary("Collected speech result")
model CallCollectResultSpeech extends CallCollectResult {
  @example("speech")
  type: "speech";

  params: {
    @doc("The text the speech recognizer heard the caller say.")
    @example("I would like to speak to sales")
    text: string;

    @doc("How confident the recognizer is in the result (for example `83.2`).")
    @example(83.2)
    confidence?: float64;
  };
}

@summary("Collect event")
model CallCollectParams {
  ...CallAddress;

  @doc("The `control_id` of the collection this event refers to, returned when you started it with `calling.collect`.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("Where the collection currently stands. `error` means it stopped because something went wrong. Present for partial and continuous collections; a one-shot collect reports its `result` without a `state`.")
  @example("finished")
  state?: CallCollectState;

  @doc("What the caller gave you. Check its `type` to handle digits, speech, or a no-input/no-match marker.")
  result?: CallCollectResult;

  @doc("""
    Relevant when you requested partial or continuous results: `true` once the
    recognizer has finished the current utterance. With `continuous: true`, the
    collector then restarts to listen for the next one.
    """)
  @example(true)
  final?: boolean;
}

const callingCallCollect = "calling.call.collect";
@doc("Fires as you collect input from a caller — DTMF digits or speech — reporting partial and final results so you can react to what they said or pressed.")
@summary(callingCallCollect)
@extension("x-fern-display-name", callingCallCollect)
model CallCollectEvent is SignalwireEvent<typeof callingCallCollect, CallCollectParams>;
