import "./core.tsp";
import "../../addresses/models/responses.tsp";

using TypeSpec.Http;

@doc("Response containing a list of phone numbers.")
model PhoneNumberListResponse {
  @doc("Pagination links.")
  links?: PaginationLinks;

  @doc("List of phone numbers.")
  data?: PhoneNumber[];
}

@doc("Response containing a single phone number.")
model PhoneNumberResponse {
  ...PhoneNumber;
}

@doc("Response containing available phone numbers for purchase.")
model AvailablePhoneNumbersResponse {
  @doc("Pagination links.")
  links?: PaginationLinks;

  @doc("List of available phone numbers.")
  data?: AvailablePhoneNumber[];
}

@doc("Response containing phone number lookup result.")
model PhoneNumberLookupResponse {
  ...PhoneNumberLookup;
}
