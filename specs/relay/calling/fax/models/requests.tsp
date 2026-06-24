import "@signalwire/typespec-asyncapi";

import "../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model SendFaxParams {
  ...CallAddress;

  @doc("Identifier used to control the active faxing.")
  control_id: string;

  @doc("Location of the fax document to send. PDF format only.")
  document: url;

  @doc("Identity to display on the receiving fax. Default is the SignalWire DID.")
  identity?: string;

  @doc("""
    Custom info added to the header of each fax page (alongside identity, date,
    and page number). `SignalWire` is the default. Set to empty string to
    disable sending any header.
    """)
  header_info?: string = "SignalWire";

  @doc("HTTP(s) URL to POST fax events to.")
  status_url?: url;
}

model SendFaxStopParams {
  ...CallAddress;

  @doc("The send-fax `control_id` assigned in `calling.send_fax`.")
  control_id: string;
}

model ReceiveFaxParams {
  ...CallAddress;

  @doc("Identifier used to control the active faxing.")
  control_id: string;

  @doc("HTTP(s) URL to POST fax events to.")
  status_url?: url;
}

model ReceiveFaxStopParams {
  ...CallAddress;

  @doc("The fax `control_id` assigned in `calling.receive_fax`.")
  control_id: string;
}
