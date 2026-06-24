import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Provisioning;

@doc("""
  Request the runtime configuration for a connector. Supply the connector's
  identity (`relay_connector_id`) and network endpoints (`local_endpoint`,
  `external_endpoint`), and SignalWire returns its configuration. For a
  `freeswitch` target, the response includes a SIP profile rendered as XML.
  """)
@channel("provisioning.configure")
@summary("Request SignalWire connector configuration")
@opExample(#{
  parameters: #{
    target: "freeswitch",
    local_endpoint: "10.10.0.2",
    external_endpoint: "8.8.8.8",
    relay_connector_id: "b6ef5331-dce8-4c56-890d-949039398361",
  },
  returnType: #{
    code: "200",
    message: "OK",
    configuration: #{ profile: "<FS profile XML>..." },
  },
})
op configure(...ConfigureParams): ConfigureResult;
