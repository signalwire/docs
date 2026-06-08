import "@typespec/json-schema";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

@summary("global_data object")
@doc("A key-value object for data that persists throughout an AI or sidecar session.")
model GlobalData {
  ...TypeSpec.Record<unknown>;
}
