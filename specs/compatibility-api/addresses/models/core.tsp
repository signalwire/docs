using TypeSpec.Http;

model AddressesAccountSidPath {
  @doc("The Account ID that owns the Address.")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  @path
  AccountSid: uuid;
}

model AddressPathSid {
  @doc("The unique identifier of the Address.")
  @example("b3877c40-da60-4998-90ad-b792e98472ad")
  @path
  Sid: uuid;
}

@doc("Address model representing a registered emergency (E911) address.")
model Address {
  @doc("The unique identifier of the Address.")
  @example("b3877c40-da60-4998-90ad-b792e98472ad")
  sid: uuid;

  @doc("The unique identifier of the Account that owns this Address.")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  account_sid: uuid;

  @doc("The name registered at this Address. Mirrors `customer_name`.")
  @example("Acme Inc")
  friendly_name: string | null;

  @doc("The name registered at this Address, used for emergency (E911) records.")
  @example("Acme Inc")
  customer_name: string | null;

  @doc("The number and street of the Address.")
  @example("500 W Madison St")
  street: string | null;

  @doc("The secondary address component, such as a suite, unit, or floor.")
  @example("Suite 300")
  street_secondary: string | null;

  @doc("The city of the Address.")
  @example("Chicago")
  city: string | null;

  @doc("The state or region of the Address.")
  @example("IL")
  region: string | null;

  @doc("The postal (ZIP) code of the Address.")
  @example("60661")
  postal_code: string | null;

  @doc("The ISO 3166-1 alpha-2 country code of the Address.")
  @example("US")
  iso_country: string | null;

  @doc("Whether this Address was submitted for emergency (E911) use. Set by the `EmergencyEnabled` parameter.")
  @example(true)
  emergency_enabled: boolean;

  @doc("Whether the carrier successfully validated this Address. Only US addresses submitted with `EmergencyEnabled=true` are validated.")
  @example(true)
  validated: boolean;

  @doc("Whether this Address has been verified for emergency (E911) use by the carrier.")
  @example(true)
  verified: boolean;

  @doc("The date, in RFC 2822 GMT format, this Address was created.")
  @example("Sat, 15 Sept 2018 10:00:00 +0000")
  date_created: string;

  @doc("The date, in RFC 2822 GMT format, this Address was last updated.")
  @example("Sat, 16 Sept 2018 10:00:00 +0000")
  date_updated: string;

  @doc("The version of the SignalWire API.")
  @example("2010-04-01")
  api_version: string;

  @doc("The URI for this Address.")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/Addresses/b3877c40-da60-4998-90ad-b792e98472ad.json")
  uri: string;
}
