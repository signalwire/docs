import "@typespec/json-schema";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

@summary("MCP server object")
model MCPServer {
  @doc("The MCP (Model Context Protocol) server URL. Required.")
  @example("https://mcp.example.com/mcp")
  url: string;

  @doc("HTTP headers sent to the MCP server. Authorization tokens go here — there is no separate auth field. Header values are sent exactly as written; variables such as `\${global_data.token}` are not expanded.")
  @example(#{ Authorization: "Bearer abc123" })
  headers?: {
    ...TypeSpec.Record<string>;
  };

  @doc("Whether to fetch the server's resources into `global_data`, when the server advertises resource support. **Default:** `false`.")
  @example(true)
  resources?: boolean = false;

  @doc("""
    Values for `{name}` placeholders in the URI templates of the server's resources. When a resource
    URI contains `{customer_id}`, the value of the `customer_id` key replaces it. Values are used exactly
    as written; variables such as `\${global_data.customer_id}` are not expanded. A placeholder with no
    matching key is left as it is. Used only when `resources` is enabled.
    """)
  @example(#{ customer_id: "cust_12345" })
  resource_vars?: {
    ...TypeSpec.Record<string>;
  };
}
