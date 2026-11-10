import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("""
  The AI settings to change. Each key is the same setting as in the `ai` method's
  `params`, with the same range. Send at least one supported key; unknown keys are
  ignored, but a request with no supported key is rejected. Values may be integers
  or integer strings.
  """)
@summary("AI adjust settings")
model AiAdjustSettings {
  @doc("""
    Milliseconds to wait before prompting the caller to respond: `1000`–`600000`, or
    `0` to disable. If it ends up below `end_of_speech_timeout`, it is raised to
    `end_of_speech_timeout` + 1000.
    """)
  @example(30000)
  attention_timeout?: int32 | string;

  @doc("Milliseconds the outbound call recipient has to respond before timeout: `10000`–`600000`.")
  @example(120000)
  outbound_attention_timeout?: int32 | string;

  @doc("Milliseconds of silence at the end of an utterance that marks end of speech: `0`–`10000`.")
  @example(700)
  end_of_speech_timeout?: int32 | string;

  @doc("Milliseconds to wait for a speech event: `0`–`10000`.")
  @example(1400)
  speech_event_timeout?: int32 | string;

  @doc("Milliseconds to wait for the first word after speech is detected: `0`–`10000`.")
  @example(1000)
  first_word_timeout?: int32 | string;

  @doc("Milliseconds of inactivity before the agent exits: `10000`–`3600000`, or `0` to disable.")
  @example(600000)
  inactivity_timeout?: int32 | string;
}

@summary("AI adjust params")
model AiAdjustParams {
  ...CallAddress;

  @doc("The settings to change. Must be a non-empty object.")
  @example(#{ attention_timeout: 30000, end_of_speech_timeout: 1000 })
  settings: AiAdjustSettings;
}
