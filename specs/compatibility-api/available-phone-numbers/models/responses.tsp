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
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/AvailablePhoneNumbers/US/Local")
  uri?: string;

  @doc("Country resource information.")
  countries?: CountryResource;
}

@doc("Response containing available phone number resources for a specific country.")
model AvailablePhoneNumberByCountryResponse {
  @doc("The URI for the API call.")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/AvailablePhoneNumbers/US/Local")
  uri?: string;

  @doc("New numbers on SignalWire are marked as `beta`. Possible values are `true` or `false`.")
  beta?: boolean;

  @doc("The country the number is from.")
  @example("United States")
  country?: string;

  @doc("The ISO country code of the number.")
  @example("US")
  country_code?: string;

  @doc("URIs for subresources.")
  subresource_uris?: CountrySubresourceUris;
}
