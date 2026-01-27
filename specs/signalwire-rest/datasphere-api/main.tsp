import "@typespec/http";
import "../types";
import "../../_shared/auth.tsp";
import "./document";

using TypeSpec.Http;
using Types.StatusCodes;

@service(#{ title: "Datasphere API" })
@server(
  "https://{space_name}.signalwire.com/api/datasphere",
  "Endpoint",
  {
    space_name: string = "{Your_Space_Name}",
  }
)
@useAuth(SignalWireBasicAuth)
@doc("An AI-powered API for document search.")
namespace DatasphereAPI;
