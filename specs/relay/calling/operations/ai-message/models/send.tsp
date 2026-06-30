import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("Role of an injected AI-message sender.")
union AiMessageRole {
  "system",
  "user",
  "assistant",
}

@doc("""
  Conversation-reset configuration. Each field clears or replaces part of the
  session context.
  """)
model AiMessageReset {
  @doc("Clear the entire conversation history.")
  full_reset?: boolean;

  @doc("Replace (or clear) the user prompt context.")
  user_prompt?: string;

  @doc("Replace (or clear) the system prompt context.")
  system_prompt?: string;

  @doc("Summarize the existing conversation into a condensed form before applying the reset.")
  consolidate?: boolean;
}

model AiMessageParams {
  ...CallAddress;

  @doc("Message text to inject into the session.")
  message_text?: string;

  @doc("Role of the message sender.")
  role?: AiMessageRole;

  @doc("Conversation-reset configuration.")
  reset?: AiMessageReset;

  @doc("Updated global data for SWAIG functions.")
  global_data?: Record<unknown>;
}
