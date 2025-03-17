import "@typespec/http";
import "../types";
import "./recordings";


using TypeSpec.Http;
using Types.StatusCodes;

@service({
  title: "Relay API",
})
@server("https://{space_name}.signalwire.com/api/relay/rest/", "Endpoint", {
  space_name: string = "{Your_Space_Name}";
})
@useAuth(BasicAuth)
@doc("API to access/manage SignalWire's Relay objects.")
namespace RelayAPI;
