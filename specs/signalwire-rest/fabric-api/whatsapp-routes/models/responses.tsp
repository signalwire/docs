import "@typespec/openapi";
import "./core.tsp";
import "../../_shared/fabric-address";

using TypeSpec.OpenAPI;

@summary("WhatsApp number Address")
@doc("The Address created for the WhatsApp number on the Resource. Its `type` is `app` for most handlers, `room` for a Video Room, and `call` for a Resource that connects the call to a SIP endpoint or connector.")
@oneOf
union WhatsAppRouteResponse {
  FabricAddressApp,
  FabricAddressRoom,
  FabricAddressCall,
}
