@summary("SendFax object")
model SendFax {
  @summary("send_fax")
  @doc("Send a fax.")
  send_fax: {
    @doc("URL to the PDF document to fax.")
    document: url;

    @doc("Header text to include on the fax.")
    header_info?: string;

    @doc("""
      Station identity to report.
      Default is the calling party's caller ID number.
      """)
    identity?: string;

    @doc("http or https URL to deliver send_fax status events")
    status_url?: url;
  };
}
