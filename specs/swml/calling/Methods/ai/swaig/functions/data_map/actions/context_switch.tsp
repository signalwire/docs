import "../../../../_shared/pom.tsp";

namespace SWML.Calling;

@summary("Prompt text content")
model PromptTextContent {
  @doc("The instructions as a single block of text.")
  @example("You are now a billing specialist.")
  text: string;
}

@summary("Prompt POM content")
model PromptPomContent {
  @doc("The instructions as a Prompt Object Model (POM).")
  @minItems(1)
  pom: POM[];
}

@summary("Prompt content")
@doc("Instructions given as an object with `text` or `pom`, the same shape as a prompt.")
union PromptContent {
  PromptTextContent,
  PromptPomContent,
}

@summary("context_switch Action")
model ContextSwitchAction {
  @doc("""
    Replaces the agent's instructions mid-conversation. You can use variables in `system_prompt`,
    `user_prompt`, `system_pom`, and `user_pom`. In a `data_map` function they're expanded along with the
    rest of the output; in a reply from your `web_hook_url`, they're expanded when the action runs. Either
    way they're expanded only once, so a value that itself contains `\${...}` is left as it is.
    """)
  @summary("context_switch")
  context_switch: {
    @doc("The new instructions for the agent. Set this or `system_pom`.")
    @example("You are now a billing specialist. Help the customer with their billing inquiry.")
    system_prompt?: string;

    @doc("The new instructions as an object with `text` or `pom`. Used instead of `system_prompt` when both are set.")
    system_pom?: PromptContent;

    @doc("""
      If `true`, the conversation so far is summarized and the summary is carried into the new context.
      When the caller hasn't spoken yet there's nothing to summarize, so `full_reset` is ignored.
      **Default:** `false`.
      """)
    @example(true)
    consolidate?: boolean | SWMLVar;

    @doc("""
      If `true`, the new instructions replace the agent's original prompt. Otherwise the conversation is
      cleared and the new instructions are added. **Default:** `false`.
      """)
    @example(false)
    full_reset?: boolean = false;

    @doc("""
      A string serving as simulated user input for the AI Agent.
      During a context_switch in the AI's prompt, the user_prompt offers the AI pre-established context or guidance.
      Default is not set
      """)
    @example("I need help with my recent invoice.")
    user_prompt?: string;

    @doc("The simulated user input as an object with `text` or `pom`. Used instead of `user_prompt` when both are set.")
    user_pom?: PromptContent;
  };
}
