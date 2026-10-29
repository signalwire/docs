import "@typespec/json-schema";
import "../../../Shared/Types/main.tsp";
import "../ai/_shared/pom.tsp";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

// The `ai_sidecar` SWML method expands SWML variables throughout its configuration, unlike `ai`
// and `amazon_bedrock`, which use their configuration as written. So the
// sidecar's POM sections re-type the two numbering flags to also take a variable (one that holds a
// boolean). Everything else is the shared POM section.
@doc("Base model for common section properties")
model AISidecarPomSectionBase {
  ...OmitProperties<
    PomSectionBase,
    "subsections" | "numbered" | "numberedBullets"
  >;

  @doc("Optional array of nested subsections")
  @minItems(1)
  subsections?: AISidecarPOM[];

  @doc("Whether to number the section")
  @example(true)
  numbered?: boolean | SWMLVar;

  @doc("Whether to number the bullets")
  @example(false)
  numberedBullets?: boolean | SWMLVar;
}

@summary("Section with Body")
@doc("Content model with body text and optional bullets")
model AISidecarPomSectionBodyContent {
  ...AISidecarPomSectionBase;
  ...PickProperties<PomSectionBodyContent, "body" | "bullets">;
}

@summary("Section with Bullets")
@doc("Content model with bullets and optional body")
model AISidecarPomSectionBulletsContent {
  ...AISidecarPomSectionBase;
  ...PickProperties<PomSectionBulletsContent, "body" | "bullets">;
}

@doc("Regular section that requires either body or bullets.")
union AISidecarPOM {
  AISidecarPomSectionBodyContent,
  AISidecarPomSectionBulletsContent,
}

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
  pom: AISidecarPOM[];
}

@oneOf
@summary("AISidecarPrompt")
union AISidecarPrompt {
  @doc("The operator prompt as a single block of text.")
  string,

  AISidecarPromptText,
  AISidecarPromptPom,
}
