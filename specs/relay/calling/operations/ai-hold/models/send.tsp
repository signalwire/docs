import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("AI hold params")
model AiHoldParams {
  ...CallAddress;

  @doc("How long to stay on hold. Accepts a duration string such as `\"5m\"` or a number of seconds such as `\"60\"`. Defaults to 300 seconds; values of `0` or below, or above 300, are clamped to 300.")
  @example("60")
  timeout?: string;

  @doc("""
    An instruction the AI agent uses to tell the caller you're putting them on
    hold. It's added to the conversation as a system message, and the agent speaks
    a response based on it — this is not audio or hold music. Default:
    `"Tell the user you are putting them on hold."`
    """)
  @example("Please hold while we transfer you.")
  prompt?: string;
}

@summary("AI unhold params")
model AiUnholdParams {
  ...CallAddress;
}
