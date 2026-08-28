@summary("includes")
model SWAIGIncludes {
  @doc("Remote functions to fetch and include in your AI application.")
  @example(#["transfer call", "notify kitchen"])
  functions: string[];

  @doc("URL to fetch remote functions and include in your AI application. Authentication for the signature request is set in the url in the format of `username:password@url`.")
  @example("https://username:password@example.com")
  url: string;

  @doc("")
  meta_data?: {
    ...TypeSpec.Record<unknown>;
  };
}
