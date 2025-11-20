import "@typespec/http";
import "@typespec/openapi";
import "../types";
import "./calls";
import "../_globally_shared/const.tsp";
import "./tags.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@tagMetadata(CALLS_TAG, CALLS_TAG_METADATA)
@externalDocs(
  "/rest/signalwire-rest/endpoints/calling",
  "The Calling API holds a collection of endpoints that will help you create and manage calls."
)
@info(#{
  title: "Calling API",
  version: "1.0.0",
  contact: CONTACT_INFO,
  license: LICENSE_INFO,
  termsOfService: TERMS_OF_SERVICE,
})
@service(#{ title: "Calling API" })
@server(
  "https://{space_name}.${SERVER_URL}/calling",
  "Endpoint",
  {
    @doc(SERVER_URL_DESCRIPTION)
    @example("example")
    space_name: string = "{Your_Space_Name}",
  }
)
@useAuth(BasicAuth)
@doc("API to create/manage SignalWire's Calls.")
namespace CallingAPI;
