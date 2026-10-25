import "@typespec/json-schema";
import "../../../Shared/Types/main.tsp";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

@summary("AISidecarPermissions object")
model AISidecarPermissions {
  @doc("Whether SWAIG tools may run SWML on the call. **Default:** `true`.")
  @example(true)
  swaig_allow_swml?: boolean | SWMLVar = true;

  @doc("""
    Whether a `settings` action returned by a SWAIG tool is accepted. An accepted `settings` action does not
    change the sidecar's evaluations, which keep using the sidecar's `model` and default model settings.
    **Default:** `true`.
    """)
  @example(true)
  swaig_allow_settings?: boolean | SWMLVar = true;

  @doc("""
    Accepted but not enforced: SWAIG tools can set and unset the sidecar's global data whatever this is set to.
    To keep tool actions from taking effect, set `params.act_on_channel` to `false`. **Default:** `true`.
    """)
  @example(true)
  swaig_set_global_data?: boolean | SWMLVar = true;
}
