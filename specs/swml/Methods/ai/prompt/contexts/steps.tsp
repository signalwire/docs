import "@typespec/json-schema";
import "../../_shared/pom.tsp";
import "../../../../Shared/Types";
using TypeSpec.JsonSchema;

@summary("Base context step with common properties")
model ContextStepsBase {
  @doc("The name of the step. The name must be unique within the context. The name is used for referencing the step in the context.")
  @pattern("^(?!next$).*$")
  @example("Take Pizza order")
  name: string;

  @doc("""
    The conditions that must be met for the conversation to proceed to the next step.
    If a condition is not met, the conversation will not proceed to the next step.
    It's **highly** recommended you create a custom criteria for the step to get the intended behavior.
    """)
  @example("Customer wants to order Pizza")
  step_criteria?: string;

  @doc("An array of strings, where each string is the name of a SWAIG.function that can be executed from this step.")
  @example(#["Take Order", "Confirm Order", "Confirm Address"])
  functions?: string[];

  @doc("An array of valid contexts that the conversation can transition to from this step.")
  @example(#["Place Order", "Confirm Order"])
  valid_contexts?: string[];

  @doc("A boolean value, if set to `true`, will skip the user's turn to respond in the conversation and proceed to the next step.")
  @example(true)
  skip_user_turn?: boolean | SWMLVar;

  @doc("A boolean value, if set to `true`, will end the contexts conversation and transition to a normal interaction.")
  @example(true)
  end?: boolean;

  @doc("""
    An array of valid steps that the conversation can proceed to from this step.
    If the array is empty, or the `valid_steps` key is not present, the conversation will proceed to the next step in the context.
    """)
  @example(#["get order", "confirm order"])
  valid_steps?: string[];
}

@summary("Context step with POM (Post-Prompt Object Model)")
model ContextPOMSteps is ContextStepsBase {
  @doc("An array of objects that define the POM for the step. POM is the Post-Prompt Object Model, which is used to define the flow of the conversation.")
  pom: POM[];
}

@summary("Context step with text prompt")
model ContextTextSteps is ContextStepsBase {
  @doc("The prompt or instructions given to the AI at this step.")
  @example("Your name is Franklin and you are taking orders for Franklin's Pizza.")
  text: string;
}

@summary("Context step - supports either POM or text-based steps")
union ContextSteps {
  ContextPOMSteps,
  ContextTextSteps,
}
