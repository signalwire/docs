import "./core.tsp";
import "../../_shared/const.tsp";

model SwmlScriptCreateRequest {
  @doc("Display name of the SWML Script")
  @example("Welcome Script")
  name: string;

  @doc("The contents of the SWML script.")
  @example(SWML_EXAMPLE)
  contents: string;

}

model SwmlScriptUpdateRequest {
  @doc("Display name of the SWML Script")
  @example("Welcome Script")
  display_name?: string;

  @doc("The contents of the SWML script.")
  @example(SWML_EXAMPLE)
  contents?: string;

}