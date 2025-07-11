import "./core.tsp";

model SwmlScriptCreateRequest {
  @doc("Display name of the SWML Script")
  @example("Welcome Script")
  display_name: string;

  @doc("The SWML script contents")
  @example("{\"version\":\"1.0.0\",\"sections\":{\"main\":[{\"play\":{\"url\":\"https://example.com/welcome.mp3\"}}]}}")
  contents: string;

  @doc("Optional description of the SWML script")
  @example("Welcome message script")
  description?: string;
}

model SwmlScriptUpdateRequest {
  @doc("Display name of the SWML Script")
  @example("Welcome Script")
  display_name?: string;

  @doc("The SWML script contents")
  @example("{\"version\":\"1.0.0\",\"sections\":{\"main\":[{\"play\":{\"url\":\"https://example.com/welcome.mp3\"}}]}}")
  contents?: string;

  @doc("Optional description of the SWML script")
  @example("Welcome message script")
  description?: string;
}