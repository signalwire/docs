import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Provisioning;
const GroupProvisioningConfigure = #["provisioning", "configure"];

const provisioningConfigure = "provisioning.configure";
const provisioningConfigureResponse = "${provisioningConfigure} response";

model ConfigureRequest is JsonRpcRequest<typeof provisioningConfigure, ConfigureParams>;

@extension("x-fern-display-name", provisioningConfigureResponse)
@reply model ConfigureReply is JsonRpcResponse<ConfigureExecuteResult>;

@doc("""
  Request the runtime configuration for a connector. Supply the connector's
  identity (`relay_connector_id`) and network endpoints (`local_endpoint`,
  `external_endpoint`), and SignalWire returns its configuration. For a
  `freeswitch` target, the response includes a SIP profile rendered as XML.

  On failure the response is a JSON-RPC `error` object
  `{ code: <integer>, message }` rather than the success `result` shape. The
  `code` is an integer (`-32001`, `-32602`, `-32003`, or `-32603`), distinct
  from the string `result.code` used elsewhere.
  """)
@channel(provisioningConfigure)
@summary("Request SignalWire connector configuration")
@extension("x-fern-display-name", provisioningConfigure)
@extension("x-fern-sdk-group-name", GroupProvisioningConfigure)
op configure(...ConfigureRequest): ConfigureReply;
