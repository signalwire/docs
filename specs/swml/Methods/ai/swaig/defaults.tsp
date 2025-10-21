import "@typespec/json-schema";

using TypeSpec.JsonSchema;

@summary("defaults")
model SWAIGDefaults {
  @doc("Default URL to send status callbacks and reports to. Authentication can also be set in the url in the format of `username:password@url.`")
  web_hook_url?: string;
}
