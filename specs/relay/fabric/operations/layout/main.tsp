import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Fabric;

const callLayoutList = "call.layout.list";
const callLayoutListResponse = "${callLayoutList} response";
model LayoutListRequest
  is JsonRpcRequest<typeof callLayoutList, LayoutListParams>;
@extension("x-fern-display-name", callLayoutListResponse)
@reply
model LayoutListReply is JsonRpcResponse<FabricLayoutListResult>;

@doc("Lists the video layouts available for the room.")
@channel(callLayoutList)
@summary("List available layouts")
@extension("x-fern-display-name", callLayoutList)
op layoutList(...LayoutListRequest): LayoutListReply;

const callLayoutSet = "call.layout.set";
const callLayoutSetResponse = "${callLayoutSet} response";
model LayoutSetRequest is JsonRpcRequest<typeof callLayoutSet, LayoutSetParams>;
model LayoutSetResult { ...FabricResult<"Layout set">; }
@extension("x-fern-display-name", callLayoutSetResponse)
@reply
model LayoutSetReply is JsonRpcResponse<LayoutSetResult>;

@doc("Applies a video layout to the room by name. A `layout.changed` event follows.")
@channel(callLayoutSet)
@summary("Set the room layout")
@extension("x-fern-display-name", callLayoutSet)
op layoutSet(...LayoutSetRequest): LayoutSetReply;
