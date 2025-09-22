@summary("Transfer object")
model Transfer {
  @summary("transfer")
  @doc("Transfer the execution of the script to a new URL or SWML Section.")
  transfer: {
    @doc("""
      Specifies where to transfer the call. The value can be one of:
          - `<section_name>` - section in the SWML document to jump to.
          - `https://<URL>` - URL pointing to the document to transfer to. Sends HTTP POST.
      """)
    dest: string;

    @doc("""
      Named parameters to send to transfer destination.
      Accepts an object mapping variable names to values.
      Default is not set.
      """)
    params?: {
      ...TypeSpec.Record<unknown>;
    };

    @doc("""
      User data, ignored by SignalWire.
      Accepts an object mapping variable names to values.
      Default is not set.
      """)
    meta?: {
      ...TypeSpec.Record<unknown>;
    };
  };
}
