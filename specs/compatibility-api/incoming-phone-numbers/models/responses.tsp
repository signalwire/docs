import "./core.tsp";
import "../../_shared/pagination.tsp";

using TypeSpec.Http;

@doc("Response containing a list of incoming phone numbers.")
model IncomingPhoneNumberListResponse {
  ...Pagination;

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
