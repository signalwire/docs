import "@typespec/openapi";
import "./core.tsp";
import "../../_shared/fabric-address";

using TypeSpec.OpenAPI;

@summary("Domain Application Address")
@doc("The Address created for the Domain Application on the Resource. Its `type` is `app` for most handlers, `room` for a Video Room, and `call` for a Resource that connects the call to a SIP endpoint or connector.")
@oneOf
union FabricDomainApplicationResponse {
  FabricAddressApp,
  FabricAddressRoom,
  FabricAddressCall,
}
