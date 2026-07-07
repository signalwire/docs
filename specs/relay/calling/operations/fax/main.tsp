import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";
import "./models/events.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingSendFax = "calling.send_fax";
const callingSendFaxResponse = "${callingSendFax} response";

model SendFaxRequest is JsonRpcRequest<typeof callingSendFax, SendFaxParams>;

@extension("x-fern-display-name", callingSendFaxResponse)
@reply model SendFaxReply is JsonRpcResponse<SendFaxResult>;

@doc("""
  Send a PDF document as a fax over an active call. The call must be a single
  leg with nothing else running on it. This call acknowledges the request right
  away; progress and the final outcome arrive asynchronously as
  `calling.call.fax` events keyed on your `control_id`.
  """)
@channel(callingSendFax)
@summary("Send a PDF fax")
@extension("x-fern-display-name", callingSendFax)
op sendFax(...SendFaxRequest): SendFaxReply | CallFaxEvent;

const callingSendFaxStop = "calling.send_fax.stop";
const callingSendFaxStopResponse = "${callingSendFaxStop} response";

model SendFaxStopRequest is JsonRpcRequest<typeof callingSendFaxStop, SendFaxStopParams>;

@extension("x-fern-display-name", callingSendFaxStopResponse)
@reply model SendFaxStopReply is JsonRpcResponse<SendFaxStopResult>;

@doc("Stop sending a fax.")
@channel(callingSendFaxStop)
@summary("Stop sending a fax")
@extension("x-fern-display-name", callingSendFaxStop)
op sendFaxStop(...SendFaxStopRequest): SendFaxStopReply;

const callingReceiveFax = "calling.receive_fax";
const callingReceiveFaxResponse = "${callingReceiveFax} response";

model ReceiveFaxRequest is JsonRpcRequest<typeof callingReceiveFax, ReceiveFaxParams>;

@extension("x-fern-display-name", callingReceiveFaxResponse)
@reply model ReceiveFaxReply is JsonRpcResponse<ReceiveFaxResult>;

@doc("""
  Receive an incoming fax on an active call and save it as a PDF. The call must
  be a single leg with nothing else running on it. This call acknowledges the
  request right away; progress and the final outcome arrive asynchronously as
  `calling.call.fax` events keyed on your `control_id`.
  """)
@channel(callingReceiveFax)
@summary("Receive a fax")
@extension("x-fern-display-name", callingReceiveFax)
op receiveFax(...ReceiveFaxRequest): ReceiveFaxReply | CallFaxEvent;

const callingReceiveFaxStop = "calling.receive_fax.stop";
const callingReceiveFaxStopResponse = "${callingReceiveFaxStop} response";

model ReceiveFaxStopRequest is JsonRpcRequest<typeof callingReceiveFaxStop, ReceiveFaxStopParams>;

@extension("x-fern-display-name", callingReceiveFaxStopResponse)
@reply model ReceiveFaxStopReply is JsonRpcResponse<ReceiveFaxStopResult>;

@doc("Stop receiving a fax.")
@channel(callingReceiveFaxStop)
@summary("Stop receiving a fax")
@extension("x-fern-display-name", callingReceiveFaxStop)
op receiveFaxStop(...ReceiveFaxStopRequest): ReceiveFaxStopReply;
