import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Provisioning;

const signalwireProvision = "signalwire.provision";
const signalwireProvisionResponse = "${signalwireProvision} response";

model ProvisionRequest is JsonRpcRequest<typeof signalwireProvision, ProvisionParams>;

@extension("x-fern-display-name", signalwireProvisionResponse)
@reply model ProvisionReply is JsonRpcResponse<ProvisionResult>;

@doc("""
  Request the runtime configuration for a connector. Supply the connector's
  `target` type (`freeswitch`), its identity (`relay_connector_id`), and its
  network endpoints (`local_endpoint`, `external_endpoint`), and SignalWire
  returns its configuration. For a `freeswitch` target, the response includes a
  SIP profile rendered as XML.

  Requires a connection whose protocol `major` version is below `4` (the server SDKs
  send `2.0.0`) and credentials with the `provisioning` scope.

  Every failure arrives as a JSON-RPC `error` rather than a result:
  - `-32001` — the connection's protocol `major` version is `4` or higher.
  - `-32003` — your credentials lack the `provisioning` scope.
  - `-32602` — a required parameter is missing, or `target` is not `freeswitch`
    (`Invalid configuration target`).
  - `-32603` — the connector was not found in your project or the configuration
    service could not be reached (`Provisioning request could not be delivered to
    provisioning gateway`), an endpoint is not a valid `IP:PORT`
    (`Provisioning request could not be processed due to a problem parsing the
    endpoints`), or the profile could not be generated (`Provisioning request could
    not be processed due to a problem parsing the generated profile`).
  """)
@channel(signalwireProvision)
@summary("Request SignalWire connector configuration")
@extension("x-fern-display-name", signalwireProvision)
op provision(...ProvisionRequest): ProvisionReply;
