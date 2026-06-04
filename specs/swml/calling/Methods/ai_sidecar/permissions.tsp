import "@typespec/json-schema";
import "../../../Shared/Types/main.tsp";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

@summary("AISidecarPermissions object")
model AISidecarPermissions {
  @doc("Whether SWAIG tools may run SWML on the call. **Default:** `true`.")
  @example(true)
  swaig_allow_swml?: boolean | SWMLVar = true;

  @doc("Whether SWAIG tools may change the sidecar's settings, such as the model. **Default:** `true`.")
  @example(true)
  swaig_allow_settings?: boolean | SWMLVar = true;

  @doc("Whether SWAIG tools may set the sidecar's global data. **Default:** `true`.")
  @example(true)
  swaig_set_global_data?: boolean | SWMLVar = true;
}
