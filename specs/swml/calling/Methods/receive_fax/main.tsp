import "../../../Shared/Types/main.tsp";

namespace SWML.Calling;
@summary("receive_fax Method")
model ReceiveFax {
  @summary("receive_fax")
  @doc("Receive a fax being delivered to this call.")
  receive_fax: {
    @doc("""
      http or https URL to deliver receive_fax status events.
      Can also be a SWML variable reference, substituted when the method runs; the resolved value
      must be an http or https URL.
      """)
    @example("https://example.com/fax-received")
    status_url?: url | SWMLVar;
  };
}
