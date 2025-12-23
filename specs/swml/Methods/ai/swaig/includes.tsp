import "@typespec/json-schema";

using TypeSpec.JsonSchema;

@summary("includes")
model SWAIGIncludes {
  @doc("Remote functions to fetch and include in your AI application.")
  functions: string[];

  @doc("URL to fetch remote functions and include in your AI application. Authentication can also be set in the url in the format of `username:password@url`.")
  url: string;

  @doc("")
  meta_data?: {
    ...TypeSpec.Record<unknown>;
  };
}
