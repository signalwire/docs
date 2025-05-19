import "../../../types";

using TypeSpec.Http;

model SipGatewayID {
  @doc("Unique ID of a SIP Gateway.")
  @path
  id: uuid
}

model SipGatewayAddressPaginationResponse {
  @doc("Link of the current page")
  @example("https://{space_name}.signalwire.com/api/fabric/resources/sip_gateways/a87db7ed-8ebe-42e4-829f-8ba5a4152f54/addresses?page_number=0&page_size=50")
  self: url;

  @doc("Link to the first page")
  @example("https://{space_name}.signalwire.com/api/fabric/resources/sip_gateways/a87db7ed-8ebe-42e4-829f-8ba5a4152f54/addresses?page_number=0&page_size=50")
  first: url;

  @doc("Link to the next page")
  @example("https://{space_name}.signalwire.com/api/fabric/resources/sip_gateways/a87db7ed-8ebe-42e4-829f-8ba5a4152f54/addresses?page_number=1&page_size=50&page_token=PAbff61159-faab-48b3-959a-3021a8f5beca")
  next: url;
}

model SipGatewayAddress {
  @doc("Unique ID of the Fabric Address.")
  @example("691af061-cd86-4893-a605-173f47afc4c2")
  id: uuid;

  @doc("Fabric resource ID that the Fabric Address belongs to.")
  @example("691af061-cd86-4893-a605-173f47afc4c2")
  resource_id: uuid;

  @doc("Name of the Fabric Address.")
  @example("justice-league")
  name: string;

  @doc("Display name of the Fabric Address.")
  @example("Justice League")
  display_name: string;

  @doc("Type of the Fabric Address.")
  @example(DisplayTypes.App)
  type: DisplayTypes;

  @doc("Cover url of the Fabric Address.")
  @example("https://coverurl.com")
  cover_url: string;

  @doc("Preview url of the Fabric Address.")
  @example("https://previewurl.com")
  preview_url: string;

  @doc("Channels of the Fabric Address.")
  channel: AddressChannel;
}
