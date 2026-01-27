import "@typespec/http";
import "../types";
import "../../_shared/auth.tsp";
import "./conferences";

using TypeSpec.Http;
using Types.StatusCodes;

@service(#{ title: "Logs API" })
@server(
  "https://{space_name}.signalwire.com/api/logs/",
  "Endpoint",
  {
    space_name: string = "{Your_Space_Name}",
  }
)
@useAuth(SignalWireBasicAuth)
@doc("API to manage and query log data for SignalWire.")
namespace LogsAPI;
