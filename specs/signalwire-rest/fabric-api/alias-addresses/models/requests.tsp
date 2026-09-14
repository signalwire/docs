import "./core.tsp";
import "../../_shared/enums.tsp";
import "../enums.tsp";

model AliasAddressCreateRequest {
  @doc("URL-safe name for the alias — lowercase letters and numbers, with underscores or dashes in place of spaces. Must be unique within its context and is used to build the alias's address.")
  @example("support")
  @maxLength(256)
  @pattern("^[a-z0-9_-]+$")
  name: string;

  @doc("ID of the resource that handles calls and messages to this alias. Must reference a resource in your project. Cannot be changed after creation: to point an alias at a different resource, delete it and create a new one.")
  @example("b3877739-5c7e-4d4f-9d1a-2f0c8c2f1a11")
  resource_id: uuid;

  @doc("Human-friendly label for the alias. Defaults to `name`.")
  @example("Support Line")
  display_name?: string;

  @doc("Channels to enable on the alias. At least one is required. Defaults to all three.")
  @example(#[AliasAddressChannel.Audio, AliasAddressChannel.Messaging])
  @minItems(1)
  channels?: AliasAddressChannel[] = #[
    AliasAddressChannel.Audio,
    AliasAddressChannel.Messaging,
    AliasAddressChannel.Video
  ];

  @doc("Codecs to enable for calls to the alias. Defaults to none.")
  @example(#[AddressCodec.OPUS, AddressCodec.PCMU])
  codecs?: AddressCodec[] = #[];

  @doc("Access context to create the alias in. Defaults to `public`.")
  @example(AliasAddressContext.Public)
  context?: AliasAddressContext = AliasAddressContext.Public;
}

model AliasAddressUpdateRequest {
  @doc("URL-safe name for the alias — lowercase letters and numbers, with underscores or dashes in place of spaces. Must be unique within its context. Keeps the current value when omitted.")
  @example("customer-support")
  @maxLength(256)
  @pattern("^[a-z0-9_-]+$")
  name?: string;

  @doc("Human-friendly label for the alias.")
  @example("Customer Support")
  display_name?: string;

  @doc("Channels to enable on the alias. At least one is required.")
  @example(#[
    AliasAddressChannel.Audio,
    AliasAddressChannel.Messaging,
    AliasAddressChannel.Video
  ])
  @minItems(1)
  channels?: AliasAddressChannel[];

  @doc("Codecs to enable for calls to the alias.")
  @example(#[AddressCodec.OPUS])
  codecs?: AddressCodec[];

  @doc("Access context to move the alias to. Only changed when supplied; otherwise the alias stays in its current context.")
  @example(AliasAddressContext.Private)
  context?: AliasAddressContext;
}
