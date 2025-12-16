import "./steps.tsp";
import "../../_shared/pom.tsp";
import "../../_shared/fillers.tsp";

using TypeSpec.JsonSchema;

@summary("contexts")
model Contexts {
  @doc("The default context to use at the beginning of the conversation. Additional context steps can be defined as any other key in the object.")
  default?: ContextsObject;

  ...TypeSpec.Record<ContextsObject>;
}

model ContextObjectBase {
  @summary("steps")
  @doc("An array of objects that define the steps in the context. These steps are used to define the flow of the conversation.")
  steps: ContextSteps[];

  @doc("A boolean value, if set to `true`, the conversation history will be reset and the agent will only have the context of the original system prompt.")
  @example(true)
  isolated?: boolean;

  @doc("An array of objects that define the enter fillers for the context. Enter fillers are used when entering the context.")
  enter_fillers?: FunctionFillers[];

  @doc("An array of objects that define the exit fillers for the context. Exit fillers are used when exiting the context.")
  exit_fillers?: FunctionFillers[];
}

@summary("ContextsPOMObject")
model ContextsPOMObject is ContextObjectBase {
  @doc("An array of objects that define the POM for the context. POM is the Post-Prompt Object Model, which is used to define the flow of the conversation.")
  @minItems(1)
  pom?: POM[];
}

model ContextsTextObject is ContextObjectBase {
  @doc("The text to send to the agent.")
  @example("You are now helping the customer with their order.")
  text?: string;
}

union ContextsObject {
  ContextsPOMObject,
  ContextsTextObject,
}
