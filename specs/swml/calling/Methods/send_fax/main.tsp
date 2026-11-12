namespace SWML.Calling;
@summary("send_fax Method")
model SendFax {
  @summary("send_fax")
  @doc("""
    Send a fax.
    For a live inbound call that hasn't been answered yet, the method first attempts to answer it.
    """)
  send_fax: {
    @doc("URL to the PDF document to fax.")
    @example("https://example.com/document.pdf")
    document: url;

    @doc("""
      Header text to include on the fax.
      When omitted or empty, the call's destination address is used (the destination number for phone calls).
      """)
    @example("Invoice #12345")
    header_info?: string;

    @doc("""
      Station identity to report.
      When omitted, the call's originating address is used (the calling number for phone calls).
      """)
    @example("+15551234567")
    identity?: string;

    @doc("http or https URL to deliver send_fax status events")
    @example("https://example.com/fax-status")
    status_url?: url;
  };
}
