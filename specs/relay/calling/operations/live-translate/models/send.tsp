import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";
import "../../live-transcribe/models/send.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("""
  The live-translate action to perform. Set exactly one of `start`, `stop`,
  `summarize`, or `inject`.
  """)
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

  @doc("The action to perform. Set exactly one of `start`, `stop`, `summarize`, or `inject`.")
  action: LiveTranslateAction;

  @doc("An `http` or `https` URL to receive translation status updates.")
  status_url?: url;
}
