using TypeSpec.Http;

model AvailablePhoneNumbersAccountSidPath {
  @doc("The Project ID that uniquely identifies the Account to retrieve.")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  @format("uuid")
  @path
  AccountSid: string;
}

model IsoCountryPath {
  @doc("The ISO country code of the number.")
  @example("US")
  @path
  IsoCountry: string;
}

@doc("Phone number capabilities.")
model PhoneNumberCapabilities {
  @doc("Whether or not voice is enabled on the number.")
  @example(true)
  voice?: boolean;

  @doc("Whether or not SMS is enabled on the number.")
  @example(true)
  SMS?: boolean;

  @doc("Whether or not MMS is enabled on the number.")
  @example(true)
  MMS?: boolean;

  @doc("Whether or not fax is enabled on the number.")
  @example(true)
  fax?: boolean;
}

@doc("Available phone number model.")
model AvailablePhoneNumber {
  @doc("New numbers on SignalWire are marked as `beta`.")
  @example(false)
  beta?: boolean;

  @doc("Whether or not a number can receive calls and messages.")
  capabilities?: PhoneNumberCapabilities;

  @doc("A formatted version of the number.")
  @example("253-218-6751")
  friendly_name?: string;

  @doc("The ISO country code of the number.")
  @example("US")
  iso_country?: string;

  @doc("The LATA of the number. Only available for numbers in US and Canada.")
  @example("888")
  lata?: string;

  @doc("The latitude of the number. Only available for numbers in US and Canada.")
  @example("47.3")
  latitude?: string;

  @doc("The longitude of the number. Only available for numbers in US and Canada.")
  @example("-122.2")
  longitude?: string;

  @doc("The number in E.164 format.")
  @example("+12532186751")
  phone_number?: string;

  @doc("The postal/zip code of the number. Only available for numbers in US and Canada.")
  @example("98002")
  postal_code?: string;

  @doc("The rate center of the number. Only available for numbers in US and Canada.")
  @example("AUBURN")
  rate_center?: string;

  @doc("The state or province abbreviation of the number. Only available for numbers in US and Canada.")
  @example("WA")
  region?: string;
}

@doc("Country subresource URIs.")
model CountrySubresourceUris {
  @doc("The URI for local numbers.")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/AvailablePhoneNumbers/US/Local.json")
  local?: string;

  @doc("The URI for toll-free numbers.")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/AvailablePhoneNumbers/US/TollFree.json")
  toll_free?: string;
}

@doc("Country resource for available phone numbers.")
model CountryResource {
  @doc("New numbers on SignalWire are marked as `beta`.")
  @example(false)
  beta?: boolean;

  @doc("The country the number is from.")
  @example("United States")
  country?: string;

  @doc("The ISO country code of the number.")
  @example("US")
  country_code?: string;

  @doc("URIs for subresources.")
  subresource_uris?: CountrySubresourceUris;

  @doc("The URI for the API call.")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/AvailablePhoneNumbers/US.json")
  uri?: string;
}
