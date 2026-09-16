import "./core.tsp";
import "../../_shared/enums.tsp";

model PhoneNumberAddressCreateRequest {
  @doc("ID of a phone number your project owns. Provide this or `number`.")
  @example("1f2e3d4c-5b6a-7980-a1b2-c3d4e5f60718")
  phone_number_id?: uuid;

  @doc("A phone number your project owns, in E.164 format. Other common formats are accepted and normalized to E.164. Provide this or `phone_number_id`.")
  @example("+13105550100")
  number?: string;

  @doc("ID of the resource that should handle the channel. Must be a resource in your project of a type that can handle the chosen channel — for example, only messaging-capable resources can handle `messaging`.")
  @example("8a7b6c5d-4e3f-2a1b-0c9d-8e7f6a5b4c3d")
  resource_id: uuid;

  @doc("The channel to link the resource to: `calling` for inbound calls or `messaging` for inbound messages. The channel must not already have a resource assigned.")
  @example(UsedForType.Calling)
  handler_type: UsedForType;
}

model PhoneNumberAddressUpdateRequest {
  @doc("New name for the phone number address — lowercase letters, numbers, underscores, and hyphens only (no spaces or other special characters), up to 256 characters. Also renames the phone number. Defaults to the current value when omitted.")
  @example("renamed-support-number")
  @maxLength(256)
  @pattern("^[a-z0-9_]+(-[a-z0-9_]+)*$")
  name?: string;

  @doc("ID of the resource that should handle the channel from now on. Must be a resource in your project of a type that can handle the address's channel. Defaults to the current value when omitted.")
  @example("9c8b7a6d-5e4f-3a2b-1c0d-9e8f7a6b5c4d")
  resource_id?: uuid;
}
