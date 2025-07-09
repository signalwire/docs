import "@typespec/http";
import "../types";
import "./addresses";
import "./subscribers";
import "./subscriber-guest-token";
import "./subscriber-invite-token";
import "./subscriber-refresh-token";
import "./swml-webhook";
import "./swml-webhook-addresses";
import "./ai-agent";
import "./ai-agent-addresses";
import "./cxml-webhooks";
import "./cxml-webhook-addresses";
import "./embeds-tokens";
import "./sip_gateways";
import "./call-flows";
import "./conference-rooms";
import "./cxml-scripts";
import "./dialogflow-agents";
import "./freeswitch-connectors";
import "./laml-applications";
import "./relay-applications";
import "./sip-endpoints";
import "./swml-scripts";
import "./resources";
import "./call-flow-addresses";
import "./call-flow-versions";
import "./conference-room-addresses";
import "./cxml-script-addresses";
import "./dialogflow-agent-addresses";
import "./freeswitch-connector-addresses";
import "./laml-application-addresses";
import "./relay-application-addresses";
import "./sip-endpoint-addresses";
import "./swml-script-addresses";
import "./resource-addresses";
import "./domain-applications";
import "./phone-routes";
import "./resource-sip-endpoints";


using TypeSpec.Http;
using Types.StatusCodes;

@service(#{
  title: "Call Fabric API",
})
@server("https://{space_name}.signalwire.com/api/fabric/", "Endpoint", {
  space_name: string = "{Your_Space_Name}";
})
@useAuth(BasicAuth)
@doc("API to access/manage SignalWire's Call Fabric objects.")
namespace FabricAPI;
