import "@typespec/http";
import "../types";
import "./ai-agent";
import "./dialogflow-agents";
import "./call-flows";
import "./conference-rooms";
import "./cxml-scripts";
import "./cxml-webhooks";
import "./embeds-tokens";
import "./addresses";
import "./freeswitch-connectors";
import "./cxml-applications";
import "./relay-applications";
import "./resources";
import "./sip-endpoints";
import "./sip_gateways";
import "./subscribers";
import "./swml-scripts";
import "./swml-webhook";
import "./domain-applications";
import "./phone-routes";
import "../_globally_shared/const.tsp";


using TypeSpec.Http;
using Types.StatusCodes;

@service(#{
  title: "Call Fabric API",
})
@server("https://{space_name}.${SERVER_URL}/fabric/", "Endpoint", {
  space_name: string = "{Your_Space_Name}";
})
@useAuth(BasicAuth)
@doc("API to access/manage SignalWire's Call Fabric objects.")
namespace FabricAPI;
