import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Provisioning;

model ConfigureRequest is JsonRpcRequest<"provisioning.configure", ConfigureParams>;
@reply model ConfigureReply is JsonRpcResponse<ConfigureResult>;

@doc("""
  Request the runtime configuration for a connector. Supply the connector's
  identity (`relay_connector_id`) and network endpoints (`local_endpoint`,
  `external_endpoint`), and SignalWire returns its configuration. For a
  `freeswitch` target, the response includes a SIP profile rendered as XML.
  """)
@channel("provisioning.configure")
@summary("Request SignalWire connector configuration")
op configure(...ConfigureRequest): ConfigureReply;
