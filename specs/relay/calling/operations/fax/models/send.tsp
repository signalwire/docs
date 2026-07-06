import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model SendFaxParams {
  ...CallAddress;

  @doc("Identifier used to control the active faxing.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("HTTP or HTTPS URL of the fax document to send. Commonly a PDF or TIFF; the server converts it for transmission.")
  @example("https://example.com/my_doc_to_fax.pdf")
  document: url;

  @doc("Identity to display on the receiving fax. Default is the SignalWire DID.")
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

  @doc("The send-fax `control_id` assigned in `calling.send_fax`.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;
}

model ReceiveFaxParams {
  ...CallAddress;

  @doc("Identifier used to control the active faxing.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("HTTP(s) URL to POST fax events to.")
  @example("https://example.com/webhooks/relay")
  status_url?: url;
}

model ReceiveFaxStopParams {
  ...CallAddress;

  @doc("The fax `control_id` assigned in `calling.receive_fax`.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;
}
