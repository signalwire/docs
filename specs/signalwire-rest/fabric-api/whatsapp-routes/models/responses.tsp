import "@typespec/openapi";
import "./core.tsp";
import "../../_shared/fabric-address";

using TypeSpec.OpenAPI;

@summary("WhatsApp number address")
@doc("The address created for the WhatsApp number on the Resource. Its `type` is `app` for every handler except a Video Room, which returns `room`.")
@oneOf
union WhatsAppRouteResponse {
  FabricAddressApp,
  FabricAddressRoom,
}
