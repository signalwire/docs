import "../../../types";

using TypeSpec.Http;

model SwmlScriptPathID {
  @doc("Unique ID of a SWML Script.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @path
  id: uuid
}

model SwmlScriptID {
  @doc("Unique ID of a SWML Script.")
  swml_script_id: uuid
}

model SwmlScript {
  @doc("The SWML script contents")
  @example("{\"version\":\"1.0.0\",\"sections\":{\"main\":[{\"play\":{\"url\":\"https://example.com/welcome.mp3\"}}]}}")
  contents: string;

  @doc("Optional description of the SWML script")
  @example("Welcome message script")
  description?: string;
}

model SwmlScriptWithID {
  ...SwmlScriptID,
  ...SwmlScript
}