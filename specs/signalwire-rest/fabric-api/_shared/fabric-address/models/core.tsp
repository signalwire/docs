import "@typespec/openapi3";
import "../../../../types";
import "../../enums.tsp";
import "../../const.tsp";

using TypeSpec.Http;

model FabricAddressID {
  @doc("Unique ID of a FabricAddress.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @path
  id: uuid;
}

// Fields shared by the project-scoped address returned under a resource
// (FabricAddress, adds resource_id) and the Subscriber-facing address at
// /addresses (FabricClientAddress, adds codecs and created_at).
model FabricAddressCommon {
  @doc("Unique ID of the Fabric Address.")
  @example("691af061-cd86-4893-a605-173f47afc4c2")
  id: uuid;

  @doc("Name of the Fabric Address.")
  @example("justice-league")
  name: string;

  @doc("Display name of the Fabric Address.")
  @example("Justice League")
  display_name: string;

  type: DisplayTypes;

  @doc("Cover URL of the Fabric Address, or `null` when the resource has no cover image.")
  @example("https://coverurl.com")
  cover_url: string | null;

  @doc("Preview URL of the Fabric Address, or `null` when no preview is available. Only Conference Room addresses return one, while a session with room previews enabled is in progress.")
  @example("https://previewurl.com")
  preview_url: string | null;

  @doc("Locks the Fabric Address. This is used to prevent the Fabric Address from accepting calls.")
  @example(true)
  locked: boolean;

  @doc("Channels of the Fabric Address.")
  channels: AddressChannel;

  @doc("The address in canonical form: `/<context>/<name>` for a resource address, `sip:<domain>` for a SIP address, or the E.164 number for a phone number or WhatsApp number address. `null` when the phone number, WhatsApp number, or SIP domain behind the address no longer exists.")
  @example("/public/justice-league")
  canonical_uri: string | null;
}

@doc("A resource address as returned by the project-scoped resource endpoints.")
model FabricAddress {
  @doc("Unique ID of the Fabric Address.")
  @example("691af061-cd86-4893-a605-173f47afc4c2")
  id: uuid;

  @doc("Unique ID of the resource the address routes to.")
  @example("993ed018-9e79-4e50-b97b-984bd5534095")
  resource_id: uuid;

  ...OmitProperties<FabricAddressCommon, "id">;
}

@doc("A resource address as returned to a Subscriber client.")
model FabricClientAddress {
  ...FabricAddressCommon;

  @doc("Codecs enabled for calls to the address, or `null` when none are set.")
  @example(#[AddressCodec.OPUS, AddressCodec.PCMU])
  codecs: AddressCodec[] | null;

  @doc("Fabric Address Creation Date.")
  @example(UTC_TIME_EXAMPLE)
  created_at: utcDateTime;
}

@summary("Application Address")
model FabricAddressApp {
  ...OmitProperties<FabricAddress, "type">;

  @doc("The display type of a fabric address pointing to an application.")
  @example(DisplayTypes.App)
  type: DisplayTypes.App;
}

@summary("Room Address")
model FabricAddressRoom {
  ...OmitProperties<FabricAddress, "type">;

  @doc("The display type of a fabric address pointing to a Conference Room.")
  @example(DisplayTypes.Room)
  type: DisplayTypes.Room;
}

@summary("Call Address")
model FabricAddressCall {
  ...OmitProperties<FabricAddress, "type">;

  @doc("The display type of a fabric address pointing to call.")
  @example(DisplayTypes.Call)
  type: DisplayTypes.Call;
}

@summary("Subscriber Address")
model FabricAddressSubscriber {
  ...OmitProperties<FabricAddress, "type">;

  @doc("The display type of a fabric address pointing to a [Subscriber](/docs/platform/subscribers).")
  @example(DisplayTypes.Subscriber)
  type: DisplayTypes.Subscriber;
}
