import "@typespec/http";
import "@typespec/openapi";
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
import "../../_shared/auth.tsp";
import "./tags.tsp";
import "../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

@route("/api/fabric")
namespace SignalWireAPI.Fabric;
