import "@typespec/json-schema";
import "../../../../Shared/Types/main.tsp";
import "./defaults.tsp";
import "./functions.tsp";
import "../../ai/swaig/mcp_servers.tsp";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

// The `ai_sidecar` SWML method expands SWML variables throughout its configuration, unlike `ai`,
// which uses its configuration as written. So the sidecar re-types
// `resources` to also take a variable. Everything else is the shared MCP server object.
@summary("MCP server object")
model AISidecarMCPServer {
  ...OmitProperties<MCPServer, "resources" | "resource_vars">;

  @doc("Whether to fetch the server's resources into `global_data`, when the server advertises resource support. **Default:** `false`.")
  @example(true)
  resources?: boolean | SWMLVar = false;

  ...PickProperties<MCPServer, "resource_vars">;
}

@summary("AISidecarSWAIG object")
model AISidecarSWAIG {
  @doc("Default settings applied to all functions that do not override them.")
  defaults?: AISidecarSWAIGDefaults;

  @doc("An array of functions the model can call during the conversation.")
  functions?: AISidecarSWAIGFunction[];

  @doc("An array of MCP (Model Context Protocol) servers whose tools and resources are made available to the model.")
  mcp_servers?: AISidecarMCPServer[];
}
