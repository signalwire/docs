import "./steps.tsp";
import "../../_shared/pom.tsp";
import "../../_shared/fillers.tsp";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

@summary("contexts")
model Contexts {
  @doc("The default context to use at the beginning of the conversation. Additional context steps can be defined as any other key in the object.")
  default: ContextsObject;

  ...TypeSpec.Record<ContextsObject>;
}

@summary("Context history mode")
union ContextHistoryMode {
  @doc("Hide the instructions of earlier steps, but keep the conversation.")
  "default",

  @doc("Keep the instructions of earlier steps and the conversation.")
  "keep",

  @doc("Hide the instructions of earlier steps and the earlier conversation, including function calls and their results.")
  "hide",
}

model ContextObjectBase {
  @summary("steps")
  @doc("An array of step objects that define the conversation flow for this context. Steps execute sequentially unless otherwise specified.")
  steps: ContextSteps[];

  @doc("""
    The name of the step to start at when this context is entered, matched case-insensitively.
    When omitted, or when no step has that name, the context starts at its first step.
    """)
  @example("collect_details")
  initial_step?: string;

  @doc("""
    How much of the earlier conversation the AI sees when it moves from one step to the next in this context.
    **Default:** `default`.
    """)
  @example("hide")
  history?: ContextHistoryMode;

  @doc("""
    Steps the AI can move to when it switches to this context, before the current step's own
    `valid_steps` apply. Include `next` to allow the following step.
    """)
  @example(#["collect_details", "next"])
  valid_steps?: string[];

  @doc("""
    Contexts the AI can switch to when it switches to this context, before the current step's own
    `valid_contexts` apply.
    """)
  @example(#["support"])
  valid_contexts?: string[];

  @doc("""
    A post-prompt for the end-of-call summary. While this context is active, including when it is
    the starting context, it replaces `ai.post_prompt`; switching to a context without one restores
    `ai.post_prompt`. Takes the same properties as `ai.post_prompt` except `model`.
    """)
  post_prompt?: ContextPostPrompt;

  @doc("When `true`, resets conversation history to only the system prompt when entering this context. Useful for focused tasks that shouldn't be influenced by previous conversation. **Default:** `false`.")
  @example(true)
  isolated?: boolean = false;

  @doc("Filler phrases played when entering this context, keyed by language code.")
  enter_fillers?: FunctionFillers;

  @doc("Filler phrases played when leaving this context, keyed by language code.")
  exit_fillers?: FunctionFillers;
}

@summary("ContextsPOMObject")
model ContextsPOMObject is ContextObjectBase {
  @doc("Instructions for this context as a Prompt Object Model (POM). They are added to the instructions of each step in the context. Set either `prompt` or `pom`, not both.")
  @minItems(1)
  pom?: POM[];
}

@summary("ContextsTextObject")
model ContextsTextObject is ContextObjectBase {
  @doc("Instructions for this context. They are added to the instructions of each step in the context.")
  @example("You are now helping the customer with their order.")
  prompt?: string;
}

union ContextsObject {
  ContextsPOMObject,
  ContextsTextObject,
}
