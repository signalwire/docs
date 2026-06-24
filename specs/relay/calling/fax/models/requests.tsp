import "@signalwire/typespec-asyncapi";

import "../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model SendFaxParams {
  ...CallAddress;

  /** Identifier used to control the active faxing. */
  control_id: string;

  /** Location of the fax document to send. PDF format only. */
  document: url;

  /** Identity to display on the receiving fax. Default is the SignalWire DID. */
  identity?: string;

  /**
   * Custom info added to the header of each fax page (alongside identity, date,
   * and page number). `SignalWire` is the default. Set to empty string to
   * disable sending any header.
   */
  header_info?: string = "SignalWire";

  /** HTTP(s) URL to POST fax events to. */
  status_url?: url;
}

model SendFaxStopParams {
  ...CallAddress;

  /** The send-fax `control_id` assigned in `calling.send_fax`. */
  control_id: string;
}

model ReceiveFaxParams {
  ...CallAddress;

  /** Identifier used to control the active faxing. */
  control_id: string;

  /** HTTP(s) URL to POST fax events to. */
  status_url?: url;
}

model ReceiveFaxStopParams {
  ...CallAddress;

  /** The fax `control_id` assigned in `calling.receive_fax`. */
  control_id: string;
}
