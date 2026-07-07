import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Provisioning;

const provisioningConfigure = "provisioning.configure";
const provisioningConfigureResponse = "${provisioningConfigure} response";

model ConfigureRequest is JsonRpcRequest<typeof provisioningConfigure, ConfigureParams>;

@extension("x-fern-display-name", provisioningConfigureResponse)
@reply model ConfigureReply is JsonRpcResponse<ConfigureResult>;

@doc("""
  Request the runtime configuration for a connector. Supply the connector's
  identity (`relay_connector_id`) and network endpoints (`local_endpoint`,
  `external_endpoint`), and SignalWire returns its configuration. For a
  `freeswitch` target, the response includes a SIP profile rendered as XML.

  If configuration fails, the response carries an error code and a message
  describing the problem instead of a configuration.
  """)
@channel(provisioningConfigure)
@summary("Request SignalWire connector configuration")
@extension("x-fern-display-name", provisioningConfigure)
op configure(...ConfigureRequest): ConfigureReply;
