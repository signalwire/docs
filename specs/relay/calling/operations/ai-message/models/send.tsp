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
@summary("AI message reset")
model AiMessageReset {
  @doc("Clear the entire conversation history.")
  @example(false)
  full_reset?: boolean;

  @doc("Replace (or clear) the user prompt context.")
  @example("I'd like to order a large pepperoni pizza for delivery.")
  user_prompt?: string;

  @doc("Replace (or clear) the system prompt context.")
  @example("You are a helpful assistant taking pizza orders.")
  system_prompt?: string;
}

@doc("""
  Parameters for `calling.ai_message`. There are two modes: send `reset` to
  reconfigure the conversation context, or send `message_text` and/or
  `global_data` to inject a message and update state. If `reset` is present,
  `message_text` and `global_data` in the same request are ignored — send those in
  a separate request.
  """)
@summary("AI message params")
model AiMessageParams {
  ...CallAddress;

  @doc("Message text to inject into the session.")
  @example("The user's order has been confirmed.")
  message_text?: string;

  @doc("Role of the message sender.")
  @example("system")
  role?: AiMessageRole;

  @doc("Conversation-reset configuration. When present, `message_text` and `global_data` in the same request are ignored.")
  reset?: AiMessageReset;

  @doc("""
    Updates the global data available to your SWAIG (SignalWire AI Gateway)
    functions. Merges into the existing global data; set a key to `null` to remove
    it. Can be sent on its own to update state without injecting a message.
    """)
  global_data?: Record<unknown>;
}
