@summary("Transfer object")
model Transfer {
  @summary("transfer")
  @doc("Transfer the execution of the script to a new URL or SWML Section.")
  transfer: {
    @doc("""
      Specifies where to transfer the call. The value can be one of:
      - `<section_name>` - section in the SWML document to jump to
      - A URL (http or https) that returns a SWML document - Sends HTTP POST
      - An inline SWML document (as a JSON string)
      """)
    @example("https://example.com/transfer-handler")
    dest: string;

    @doc("""
      Named parameters to send to transfer destination.
      Accepts an object mapping variable names to values.
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
