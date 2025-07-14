import "../../";

model SipGatewayAddressListResponse {
  data: FabricAddressCall[];
  links: SipGatewayAddressPaginationResponse;
}
