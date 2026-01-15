import "./core.tsp";
import "../../_shared/pagination.tsp";

using TypeSpec.Http;

@doc("Response containing a list of incoming phone numbers.")
model IncomingPhoneNumberListResponse {
  ...Pagination;

  @doc("The end of the page.")
  @example("0")
  end?: string;

  @doc("The number of pages.")
  @example("1")
  num_pages?: string;

  @doc("The start of the page.")
  @example("0")
  start?: string;

  @doc("The total number of results.")
  @example("1")
  total?: string;

  @doc("The unique identifier for this account.")
  @example("b3877c40-da60-4998-90ad-b792e98472ac")
  account_sid?: string;

  @doc("List of incoming phone numbers.")
  incoming_phone_numbers?: IncomingPhoneNumber[];
}

@doc("Response containing a single incoming phone number.")
model IncomingPhoneNumberResponse {
  ...IncomingPhoneNumber;
}
