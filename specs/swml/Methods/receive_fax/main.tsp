@summary("ReceiveFax object")
model ReceiveFax {
  @summary("receive_fax")
  @doc("Receive a fax being delivered to this call.")
  receive_fax: {
    @doc("http or https URL to deliver receive_fax status events")
    status_url?: url;
  };
}
