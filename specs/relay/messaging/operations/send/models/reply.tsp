import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Messaging;

@doc("The result of a `messaging.send` request: a `code`/`message` outcome plus, on success, the accepted `message_id`.")
@summary("Send result")
model SendResult {
  ...Result;

  @doc("The ID of the accepted message, present on success only. Use it to match up later state events.")
  @example("e5c3f2b1-8d0a-4b4c-9f3e-2a1b0c9d8e7f")
  message_id?: string;

  @doc("Present on failure. A map of field name to the list of validation error messages for that field.")
  @example(#{ url: #["is not a valid URL"] })
  data?: Record<string[]>;
}
