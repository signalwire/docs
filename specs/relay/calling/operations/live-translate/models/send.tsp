import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";
import "../../live-transcribe/models/send.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("""
  The live-translate action to perform. Set exactly one of `start`, `stop`,
  `summarize`, or `inject`.
  """)
@summary("Live translate action")
model LiveTranslateAction {
  @doc("Start live translation.")
  start?: LiveTranslateStart;

  @doc("Stop live translation.")
  stop?: LiveActionStop;

  @doc("Summarize the live translation so far.")
  summarize?: LiveSummarize;

  @doc("Insert a message to be translated and spoken into the call.")
  inject?: LiveTranslateInject;
}

model LiveTranslateParams {
  ...CallAddress;

  @doc("""
    The action to perform. Pass the object form and set exactly one of `start`,
    `stop`, `summarize`, or `inject`. As a shorthand you may instead pass the
    bare string `"stop"` or `"summarize"` (the object form is required to `start`
    or `inject`).
    """)
  action: LiveTranslateAction | "stop" | "summarize";

  @doc("An `http` or `https` URL to receive translation status updates.")
  @example("https://example.com/webhooks/relay")
  status_url?: url;
}
