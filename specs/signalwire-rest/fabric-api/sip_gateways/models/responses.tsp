import "../../../types";
import "@typespec/openapi3";
import "../../_shared/fabric-address";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

model SipGatewayCreateResponse {
  @doc("Unique ID of the resource.")
  @example("0823a606-0aff-4c90-9eba-f88ba118fe05")
  id: string;

  @doc("Project ID associated with the resource.")
  @example("bc949800-7b40-43cf-8438-a85facfcbdd1")
  project_id: string;

  @doc("Display name of the SIP Gateway.")
  @example("My SIP Gateway")
  display_name: string;

  @doc("Type of the resource.")
  @example("sip_gateway")
  type: "sip_gateway";

  @doc("Timestamp when the resource was created.")
  @example(utcDateTime.fromISO("2025-04-01T19:05:42Z"))
  created_at: utcDateTime;

  @doc("Timestamp when the resource was last updated.")
  @example(utcDateTime.fromISO("2025-04-01T19:05:42Z"))
  updated_at: utcDateTime;

  @doc("SIP Gateway configuration details.")
  sip_gateway: SipGateway;
}

model SipGatewayUpdateResponse is SipGatewayCreateResponse {}
model SipGatewayResponse is SipGatewayCreateResponse {}

model SipGateway {
  @doc("Unique ID of the SIP Gateway.")
  @example("cce59cad-104d-4c28-ada4-98cfd102ae09")
  id: string;

  @doc("The URI for the SIP Gateway.")
  @example("user3@domain.com")
  uri: string;

  @doc("Display name of the SIP Gateway.")
  @example("My SIP Gateway")
  name: string;

  @doc("List of supported SIP ciphers.")
  @example(#["AEAD_AES_256_GCM_8", "AES_256_CM_HMAC_SHA1_80"])
  ciphers: string[];

  @doc("List of supported codecs.")
  @example(#["OPUS"])
  codecs: string[];

  @doc("Specifies the encryption requirement.")
  @example("required")
  encryption: "optional" | "required" | "disabled";
}

model SipGatewayListResponse {
  @doc("List of SIP Gateways.")
  data: SipGatewayCreateResponse[];

  @doc("Pagination links for the response.")
  links: SipGatewayPaginationResponse;
}

@example(#{
  self: "https://{space_name}.signalwire.com/api/fabric/resources/sip_gateways?page_number=0&page_size=50",
  first: "https://{space_name}.signalwire.com/api/fabric/resources/sip_gateways?page_number=0&page_size=50",
  next: "https://{space_name}.signalwire.com/api/fabric/resources/sip_gateways?page_number=1&page_size=50&page_token=PAbff61159-faab-48b3-959a-3021a8f5beca",
  prev: "https://{space_name}.signalwire.com/api/fabric/resources/sip_gateways?page_number=0&page_size=50&page_token=PAbff61159-faab-48b3-959a-3021a8f5beca"
})
model SipGatewayPaginationResponse is FabricAddressPaginationResponse {}
