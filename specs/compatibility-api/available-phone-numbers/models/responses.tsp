import "./core.tsp";

using TypeSpec.Http;

@doc("Response containing a list of available phone numbers.")
model AvailablePhoneNumberListResponse {
  @doc("The URI for the API call.")
  uri?: string;

  @doc("List of available phone numbers.")
  available_phone_numbers?: AvailablePhoneNumber[];
}

@doc("Response containing a list of available phone number resources.")
model AvailablePhoneNumberResourcesResponse {
  @doc("The URI for the API call.")
  uri?: string;

  @doc("Country resources.")
  countries?: CountryResource;
}
