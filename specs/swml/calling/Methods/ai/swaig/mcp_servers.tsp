import "@typespec/json-schema";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

@summary("MCP server object")
model MCPServer {
  @doc("The MCP (Model Context Protocol) server URL. Required.")
  @example("https://mcp.example.com/mcp")
  url: string;

  @doc("HTTP headers sent to the MCP server. Authorization tokens go here — there is no separate auth field. Header values support variable expansion (for example, `Bearer \${global_data.token}`).")
  @example(#{ Authorization: "Bearer abc123" })
  headers?: {
    ...TypeSpec.Record<string>;
  };

  @doc("Whether to fetch the server's resources into `global_data`, when the server advertises resource support. **Default:** `false`.")
  @example(true)
  resources?: boolean | SWMLVar;

  @doc("Template variables passed to the MCP server when fetching resources, typically using variable expansion such as `\${global_data.customer_id}`. Used only when `resources` is enabled.")
  @example(#{ customer_id: "cust_12345" })
  resource_vars?: {
    ...TypeSpec.Record<string>;
  };
}
