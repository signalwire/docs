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

  @doc("Identity to display on the receiving fax. Defaults to your SignalWire phone number.")
  @example("+15551230001")
  identity?: string;

  @doc("""
    Custom info added to the header of each fax page (alongside identity, date,
    and page number). `SignalWire` is the default. Set to empty string to
    disable sending any header.
    """)
  @example("SignalWire")
  header_info?: string = "SignalWire";

  @doc("HTTP(s) URL to POST fax events to.")
  @example("https://example.com/webhooks/relay")
  status_url?: url;
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

  @doc("HTTP(s) URL to POST fax events to.")
  @example("https://example.com/webhooks/relay")
  status_url?: url;
}

model ReceiveFaxStopParams {
  ...CallAddress;

  @doc("The `control_id` you passed to `calling.receive_fax`.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;
}
