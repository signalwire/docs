import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/fax.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("""
  Send a PDF document as a fax over an active call. The call must be a single
  leg with nothing else running on it. This call acknowledges the request right
  away; progress and the final outcome arrive asynchronously as
  `calling.call.fax` events keyed on your `control_id`.
  """)
@channel("calling.send_fax")
@summary("Send a PDF fax")
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
    control_id: "fax-1",
    document: "https://example.com/my_doc_to_fax.pdf",
    identity: "+155512312345",
    header_info: "SignalWire",
  },
  returnType: #{
    code: "200",
    message: "Sending Fax",
    control_id: "fax-1",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
  },
})
op sendFax(...SendFaxParams): SendFaxResult | CallFaxEvent;

@doc("Stop sending a fax.")
@channel("calling.send_fax.stop")
@summary("Stop sending a fax")
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
    control_id: "fax-1",
  },
  returnType: #{
    code: "200",
    message: "Stopping send fax",
    control_id: "fax-1",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
  },
})
op sendFaxStop(...SendFaxStopParams): SendFaxStopResult;

@doc("""
  Receive an incoming fax on an active call and save it as a PDF. The call must
  be a single leg with nothing else running on it. This call acknowledges the
  request right away; progress and the final outcome arrive asynchronously as
  `calling.call.fax` events keyed on your `control_id`.
  """)
@channel("calling.receive_fax")
@summary("Receive a fax")
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
    control_id: "fax-1",
  },
  returnType: #{
    code: "200",
    message: "Receiving Fax",
    control_id: "fax-1",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
  },
})
op receiveFax(...ReceiveFaxParams): ReceiveFaxResult | CallFaxEvent;

@doc("Stop receiving a fax.")
@channel("calling.receive_fax.stop")
@summary("Stop receiving a fax")
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
    control_id: "fax-1",
  },
  returnType: #{
    code: "200",
    message: "Stopping receive fax",
    control_id: "fax-1",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
  },
})
op receiveFaxStop(...ReceiveFaxStopParams): ReceiveFaxStopResult;
