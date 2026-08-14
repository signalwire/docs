import "@typespec/json-schema";
import "./defaults.tsp";
import "./functions.tsp";
import "../../ai/swaig/mcp_servers.tsp";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

@summary("AISidecarSWAIG object")
model AISidecarSWAIG {
  @doc("Default settings applied to all functions that do not override them.")
  defaults?: AISidecarSWAIGDefaults;

  @doc("An array of functions the model can call during the conversation.")
  functions?: AISidecarSWAIGFunction[];

  @doc("An array of MCP (Model Context Protocol) servers whose tools and resources are made available to the model.")
  mcp_servers?: MCPServer[];
}
