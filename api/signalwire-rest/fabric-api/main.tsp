import "@typespec/http";
import "../types";
import "./addresses";
import "./subscribers";
import "./subscriber-guest-token";
import "./subscriber-invite-token";
import "./external-laml-handler";
import "./external-laml-handler-addresses";
import "./external-swml-handler";
import "./external-swml-handler-addresses";
import "./ai-agent";
import "./ai-agent-addresses";
import "./cxml-application";
import "./cxml-application-addresses";


using TypeSpec.Http;
using Types.StatusCodes;

@service({
  title: "Call Fabric API",
})
@server("https://{space_name}.signalwire.com/api/fabric/", "Endpoint", {
  space_name: string = "{Your_Space_Name}";
})
@useAuth(BasicAuth)
@doc("API to access/manage SignalWire's Call Fabric objects.")
namespace FabricAPI;
