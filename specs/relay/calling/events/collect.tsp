import "@signalwire/typespec-asyncapi";

import "../models/core.tsp";

using SignalWire.AsyncAPI;

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

  @doc("Where the collection currently stands. `error` means it stopped because something went wrong.")
  state: CallCollectState;

  @doc("What the caller gave you. Check its `type` to handle digits, speech, or a no-input/no-match marker.")
  result?: CallCollectResult;

  @doc("""
    Relevant when you requested partial or continuous results: `true` once the
    recognizer has finished the current utterance. With `continuous: true`, the
    collector then restarts to listen for the next one.
    """)
  final?: boolean;
}

@doc("Fires as you collect input from a caller — DTMF digits or speech — reporting partial and final results so you can react to what they said or pressed.")
@event("calling.call.collect")
// `result` is omitted: its type `CallCollectResult` is a @discriminator base,
// which @example cannot narrow to a concrete variant (digit/speech/etc.).
@example(#{
  node_id: "a3e1b2c4-1234-5678-9abc-def012345678",
  call_id: "c7f9d2e1-8765-4321-0fed-cba987654321",
  control_id: "b2d4f6a8-1111-2222-3333-444455556666",
  state: "finished",
  final: true,
})
model CallCollectEvent {
  ...CallCollectParams;
}
