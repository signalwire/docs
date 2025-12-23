import "@typespec/json-schema";

using TypeSpec.JsonSchema;

@doc("Base model for common section properties")
model PomSectionBase {
  @doc("Title for the section")
  @minLength(1)
  title?: string;

  @doc("Optional array of nested subsections")
  @minItems(1)
  subsections?: POM[];

  @doc("Whether to number the section")
  numbered?: boolean | SWMLVar;

  @doc("Whether to number the bullets")
  numberedBullets?: boolean | SWMLVar;
}

@doc("Content model with body text and optional bullets")
model PomSectionBodyContent is PomSectionBase {
  @doc("Body text for the section")
  body: string;

  @doc("Optional array of bullet points")
  @minItems(1)
  bullets?: string[];
}

@doc("Content model with bullets and optional body")
model PomSectionBulletsContent is PomSectionBase {
  @doc("Body text for the section (optional)")
  body?: string;

  @doc("Array of bullet points")
  @minItems(1)
  bullets: string[];
}

@doc("Regular section that requires either body or bullets.")
union POM {
  PomSectionBodyContent,
  PomSectionBulletsContent,
}
