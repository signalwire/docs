import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Messaging;

model SendResult {
  ...Result;

  @doc("The ID of the accepted message, present on success only. Use it to match up later state events.")
  @example("e5c3f2b1-8d0a-4b4c-9f3e-2a1b0c9d8e7f")
  message_id?: string;

  @doc("Present on failure; per-message user_errors from the messaging gateway.")
  data?: {
    user_errors?: unknown[];
  };
}
