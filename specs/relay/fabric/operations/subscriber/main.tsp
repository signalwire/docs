import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "../../models/core.tsp";
import "@typespec/openapi";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Fabric;

@doc("`subscriber.online` takes no parameters — the subscriber is identified by the Subscriber Access Token on the connection.")
@summary("Subscriber online parameters")
model SubscriberOnlineParams {}

@doc("`subscriber.offline` takes no parameters — the subscriber is identified by the Subscriber Access Token on the connection.")
@summary("Subscriber offline parameters")
model SubscriberOfflineParams {}

const subscriberOnline = "subscriber.online";
const subscriberOnlineResponse = "${subscriberOnline} response";
model SubscriberOnlineRequest is JsonRpcRequest<typeof subscriberOnline, SubscriberOnlineParams>;
model SubscriberOnlineResult { ...FabricResult<"Online">; }
@extension("x-fern-display-name", subscriberOnlineResponse)
@reply
model SubscriberOnlineReply is JsonRpcResponse<SubscriberOnlineResult>;

@doc("Registers the connected subscriber as online so it can receive inbound Call Fabric calls. The subscriber is identified by the Subscriber Access Token on the connection.")
@channel(subscriberOnline)
@summary("Register the subscriber as online")
@extension("x-fern-display-name", subscriberOnline)
op online(...SubscriberOnlineRequest): SubscriberOnlineReply;

const subscriberOffline = "subscriber.offline";
const subscriberOfflineResponse = "${subscriberOffline} response";
model SubscriberOfflineRequest is JsonRpcRequest<typeof subscriberOffline, SubscriberOfflineParams>;
model SubscriberOfflineResult { ...FabricResult<"Offline">; }
@extension("x-fern-display-name", subscriberOfflineResponse)
@reply
model SubscriberOfflineReply is JsonRpcResponse<SubscriberOfflineResult>;

@doc("Deregisters the connected subscriber, reversing `subscriber.online` so it no longer receives inbound Call Fabric calls.")
@channel(subscriberOffline)
@summary("Register the subscriber as offline")
@extension("x-fern-display-name", subscriberOffline)
op offline(...SubscriberOfflineRequest): SubscriberOfflineReply;
