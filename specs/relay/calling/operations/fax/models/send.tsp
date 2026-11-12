import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model SendFaxParams {
  ...CallAddress;

  @doc("Your identifier for this fax. Reuse it to stop the fax (`calling.send_fax.stop`) and to correlate the `calling.call.fax` events for it.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("HTTP or HTTPS URL of the PDF document to send.")
  @example("https://example.com/my_doc_to_fax.pdf")
  document: url;

  @doc("Identity to display on the receiving fax. Defaults to the call's `from` number: your SignalWire number on an outbound call, or the caller's number on an inbound call.")
  @example("+15551230001")
  identity?: string;

  @doc("""
    Custom info added to the header of each fax page. Defaults to the
    destination number; an empty string also uses the destination number, so
    the header can't be turned off.
    """)
  @example("Acme Corp")
  header_info?: string;
}

model SendFaxStopParams {
  ...CallAddress;

  @doc("The `control_id` you passed to `calling.send_fax`.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;
}

model ReceiveFaxParams {
  ...CallAddress;

  @doc("Your identifier for this fax. Reuse it to stop the fax (`calling.receive_fax.stop`) and to correlate the `calling.call.fax` events for it.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;
}

model ReceiveFaxStopParams {
  ...CallAddress;

  @doc("The `control_id` you passed to `calling.receive_fax`.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;
}
