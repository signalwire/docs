import "../../../types";
import "../../../_globally_shared/const.tsp";
import "../../_shared/enums.tsp";
import "../enums.tsp";

using TypeSpec.Http;

model AliasAddressPathID {
  @doc("Unique ID of an alias address.")
  @example("8f14e45f-ceea-467d-9c2b-7a1d3a9b2c34")
  @path
  id: uuid;
}

model AliasAddress {
  @doc("Unique identifier for the alias address.")
  @example("8f14e45f-ceea-467d-9c2b-7a1d3a9b2c34")
  id: uuid;

  @doc("The object type. Always `alias_address`.")
  @example("alias_address")
  type: "alias_address";

  @doc("ID of the resource that handles calls and messages to this alias.")
  @example("b3877739-5c7e-4d4f-9d1a-2f0c8c2f1a11")
  resource_id: uuid;

  @doc("URL-safe name for the alias. Used to build its address.")
  @example("support")
  name: string;

  @doc("Human-friendly label for the alias. Defaults to `name`.")
  @example("Support Line")
  display_name: string;

  @doc("Display type derived from the handler resource. Returned for reference only and cannot be set.")
  @example(DisplayTypes.App)
  display_type: DisplayTypes;

  @doc("Channels enabled on this alias.")
  @example(#[
    AliasAddressChannel.Audio,
    AliasAddressChannel.Messaging,
    AliasAddressChannel.Video
  ])
  channels: AliasAddressChannel[];

  @doc("Codecs enabled for calls to this alias. Empty when none are set.")
  @example(#[])
  codecs: AddressCodec[];

  @doc("Access context the alias lives in.")
  @example(AliasAddressContext.Public)
  context: AliasAddressContext;

  @doc("The resource address this alias resolves to, in the form `/<context>/<name>`.")
  @example("/public/support")
  uri: string;

  @doc("Date and time when the alias address was created.")
  @example(UTC_TIME_EXAMPLE)
  created_at: utcDateTime;

  @doc("Date and time when the alias address was last updated.")
  @example(UTC_TIME_EXAMPLE)
  updated_at: utcDateTime;
}

model AliasAddressListQuery {
  @doc("The number of results per page.")
  @query
  @minValue(1)
  @maxValue(1000)
  page_size?: int32 = 50;

  @doc("The page index, used together with `page_token`.")
  @query
  @minValue(0)
  page_number?: int32 = 0;

  @doc("Opaque cursor token from a previous response's `links.next` or `links.prev`. Begins with `PA` or `PB`.")
  @query
  page_token?: string;
}
