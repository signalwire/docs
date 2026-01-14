import "@typespec/http";
import "@typespec/openapi";
import "../types";
import "../_globally_shared/const.tsp";
import "./rooms";
import "./streams";
import "./room-sessions";
import "./room-tokens";
import "./room-recordings";
import "./conferences";
import "./conference-tokens";
import "./logs";
import "./tags.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@externalDocs(
  "https://developer.signalwire.com",
  "Find more information about this and other SignalWire APIs."
)
@info(#{
  title: "Video API",
  version: "1.0.0",
  contact: CONTACT_INFO,
  license: LICENSE_INFO,
  termsOfService: TERMS_OF_SERVICE,
})
@service(#{ title: "Video API" })
@server(
  "https://{space_name}.${SERVER_URL}/video",
  "Endpoint",
  {
    @doc(SERVER_URL_DESCRIPTION)
    @example("example")
    space_name: string = "{your_space_name}",
  }
)
@useAuth(BasicAuth)
@doc("An API to programmatically create and control your own Video Applications.")
namespace VideoAPI;
