namespace SWML.Calling;

@summary("Transfer destination")
model TransferDestination {
  @doc("The destination to transfer to: the name of a section in the current SWML document, or a URL that returns SWML to execute.")
  @minLength(1)
  @example("https://example.com/transfer.json")
  dest: string;

  @doc("Whether to include a conversation summary when transferring. **Default:** `false`.")
  @example(true)
  summarize?: boolean = false;
}

// The destination form of `transfer`, used without a sibling `SWML`. The boolean form that
// accompanies `SWML` is a different meaning and stays on `SWMLAction`.
@summary("transfer Action")
model TransferAction {
  @doc("""
    Ends the AI session and transfers the call to a destination. Set it to an object with `dest`, or to the
    destination string as shorthand for `dest`.
    """)
  @summary("transfer")
  @example(#{ dest: "https://example.com/transfer.json", summarize: true })
  transfer: TransferDestination | string;
}
