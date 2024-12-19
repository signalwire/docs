import "@typespec/openapi3";
import "./enums.tsp";
import "../../../types";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

model ExternalLAMLHandlerIDPath {
  @doc("Unique ID of a External LAML Handler.")
  @path
  external_laml_handler_id: uuid
}

model ExternalLAMLHandlerAddress {
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
