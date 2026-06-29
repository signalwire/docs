import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/fax.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model SendFaxRequest is JsonRpcRequest<"calling.send_fax", SendFaxParams>;
@reply model SendFaxReply is JsonRpcResponse<SendFaxResult>;

@doc("""
  Send a PDF document as a fax over an active call. The call must be a single
  leg with nothing else running on it. This call acknowledges the request right
  away; progress and the final outcome arrive asynchronously as
  `calling.call.fax` events keyed on your `control_id`.
  """)
@channel("calling.send_fax")
@summary("Send a PDF fax")
op sendFax(...SendFaxRequest): SendFaxReply | CallFaxEvent;

model SendFaxStopRequest is JsonRpcRequest<"calling.send_fax.stop", SendFaxStopParams>;
@reply model SendFaxStopReply is JsonRpcResponse<SendFaxStopResult>;

@doc("Stop sending a fax.")
@channel("calling.send_fax.stop")
@summary("Stop sending a fax")
op sendFaxStop(...SendFaxStopRequest): SendFaxStopReply;

model ReceiveFaxRequest is JsonRpcRequest<"calling.receive_fax", ReceiveFaxParams>;
@reply model ReceiveFaxReply is JsonRpcResponse<ReceiveFaxResult>;

@doc("""
  Receive an incoming fax on an active call and save it as a PDF. The call must
  be a single leg with nothing else running on it. This call acknowledges the
  request right away; progress and the final outcome arrive asynchronously as
  `calling.call.fax` events keyed on your `control_id`.
  """)
@channel("calling.receive_fax")
@summary("Receive a fax")
op receiveFax(...ReceiveFaxRequest): ReceiveFaxReply | CallFaxEvent;

model ReceiveFaxStopRequest is JsonRpcRequest<"calling.receive_fax.stop", ReceiveFaxStopParams>;
@reply model ReceiveFaxStopReply is JsonRpcResponse<ReceiveFaxStopResult>;

@doc("Stop receiving a fax.")
@channel("calling.receive_fax.stop")
@summary("Stop receiving a fax")
op receiveFaxStop(...ReceiveFaxStopRequest): ReceiveFaxStopReply;
