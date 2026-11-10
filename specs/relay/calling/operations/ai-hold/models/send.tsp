import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("AI hold params")
model AiHoldParams {
  ...CallAddress;

  @doc("""
    How long to stay on hold, in seconds: a number (`60`), a numeric string
    (`"60"`), or a `"m:ss"` / `"h:mm:ss"` string (`"1:30"`). Unit suffixes are not
    supported (`"5m"` means 5 seconds). Range 1–300; a value of `0` or below, above
    300, or one that cannot be parsed falls back to the default of 300.
    """)
  @example("60")
  timeout?: string | int32 = 300;

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

  @doc("""
    An instruction the AI agent uses when taking the caller off hold. It's added to
    the conversation as a system message. Default:
    `"The user has been taken off hold."`
    """)
  @example("Thank the caller for holding and continue where you left off.")
  prompt?: string;
}
