import "@typespec/json-schema";
import "../ai/_shared/pom.tsp";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

@summary("AISidecarPromptText object")
model AISidecarPromptText {
  @doc("The operator prompt as a single block of text.")
  @example("You are a real-time sales copilot. After each customer turn, give the agent one concise piece of advice.")
  text: string;
}

@summary("AISidecarPromptPom object")
model AISidecarPromptPom {
  @doc("""
    The operator prompt as a Prompt Object Model (POM) — a structured array of sections that SignalWire renders into a markdown document before sending it to the model.
    """)
  @minItems(1)
  pom: POM[];
}

@summary("AISidecarPromptFile object")
model AISidecarPromptFile {
  @doc("Path to a server-side file whose contents are used as the operator prompt.")
  @example("/etc/swml/sidecar_prompts/sales.md")
  file: string;
}

@oneOf
@summary("AISidecarPrompt")
union AISidecarPrompt {
  @doc("The operator prompt as a single block of text.")
  string,

  AISidecarPromptText,
  AISidecarPromptPom,
  AISidecarPromptFile,
}
