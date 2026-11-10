import "../../../types";
import "../../../_globally_shared/const.tsp";
import "../../_shared/enums.tsp";

using TypeSpec.Http;

model PhoneNumberAddressPathID {
  @doc("Unique ID of a phone number address.")
  @example("b3f1c0a2-0f6e-4a9d-9b2a-1c2d3e4f5a6b")
  @path
  id: uuid;
}

model PhoneNumberAddress {
  @doc("Unique identifier for the phone number address.")
  @example("b3f1c0a2-0f6e-4a9d-9b2a-1c2d3e4f5a6b")
  id: uuid;

  @doc("The object type. Always `phone`.")
  @example("phone")
  type: "phone";

  @doc("The channel this address represents: `calling` for inbound calls or `messaging` for inbound messages. A phone number has one address per channel.")
  @example(UsedForType.Calling)
  handler_type: UsedForType;

  @doc("ID of the resource that handles this channel. `null` when no resource is assigned.")
  @example("8a7b6c5d-4e3f-2a1b-0c9d-8e7f6a5b4c3d")
  resource_id: uuid | null;

  @doc("Name of the phone number address.")
  @example("main-support-number")
  name: string;

  @doc("The phone number in E.164 format.")
  @example("+13105550100")
  phone_number: string;

  @doc("ID of the phone number this address belongs to.")
  @example("1f2e3d4c-5b6a-7980-a1b2-c3d4e5f60718")
  phone_number_id: uuid;

  @doc("Date and time when the phone number address was created.")
  @example(UTC_TIME_EXAMPLE)
  created_at: utcDateTime;

  @doc("Date and time when the phone number address was last updated.")
  @example(UTC_TIME_EXAMPLE)
  updated_at: utcDateTime;
}

model PhoneNumberAddressListQuery {
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
