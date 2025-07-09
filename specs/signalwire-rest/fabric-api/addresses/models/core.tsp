import "@typespec/openapi3";
import "../../../types";
import "../../enums.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

model FabricAddressID {
  @doc("Unique ID of a FabricAddress.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @path
  id: uuid
}

model FabricAddress {
  @doc("Unique ID of the Fabric Address.")
  @example("691af061-cd86-4893-a605-173f47afc4c2")
  id: uuid;

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

  @doc("Locks the Fabric Address. This is used to prevent the Fabric Address from accepting calls.")
  @example(true)
  locked: boolean;

  @doc("Channels of the Fabric Address.")
  channel: AddressChannel;

  @doc("Fabric Address Creation Date.")
  @example(utcDateTime.fromISO("2024-05-06T12:20-12Z"))
  created_at: utcDateTime;
}
