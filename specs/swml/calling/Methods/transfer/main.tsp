namespace SWML.Calling;
@summary("transfer Method")
model Transfer {
  @summary("transfer")
  @doc("""
    Transfer the execution of the script to a different SWML section or URL.
    Once the transfer is complete, the script will continue executing SWML from the new location.
    """)
  transfer: {
    @doc("""
      Specifies where to transfer to. The value can be one of:
      - <section_name> - section in the SWML document to jump to
      - A URL (http or https) - URL to fetch next document from. Sends HTTP POST.
        Authentication can also be set in the URL in the format of username:password@url.
      
      Relay application destinations (`relay:`) are not supported.
      The value must not be empty, including after variable expansion. A value that expands
      to an empty string stops execution with an error.
      """)
    @example("https://example.com/transfer-handler")
    @minLength(1)
    dest: string;

    @doc("""
      Named parameters to send to transfer destination.
      Accepts an object mapping variable names to values.
      After variable expansion, the value can nest at most 63 levels of objects and arrays
      on any branch, counting `params` itself; objects and arrays share the same limit.
      Deeper nesting stops the transfer with an error.
      Default is not set.
      """)
    @example(#{ department: "sales", priority: "high" })
    params?: {
      ...TypeSpec.Record<unknown>;
    };

    @doc("""
      User data, ignored by SignalWire.
      Accepts an object mapping variable names to values.
      Default is not set.
      """)
    @example(#{ transfer_reason: "escalation", original_agent: "agent_001" })
    meta?: {
      ...TypeSpec.Record<unknown>;
    };
  };
}
