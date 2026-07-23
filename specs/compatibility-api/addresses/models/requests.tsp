using TypeSpec.Http;

@doc("Request body for creating or updating an Address.")
model AddressRequestBody {
  @doc("The name to register at this Address. Used for the emergency (E911) record.")
  @maxLength(64)
  @example("Acme Inc")
  CustomerName: string;

  @doc("The number and street of the Address.")
  @example("500 W Madison St")
  Street: string;

  @doc("The city of the Address.")
  @example("Chicago")
  City: string;

  @doc("The state or region of the Address.")
  @example("IL")
  Region: string;

  @doc("The postal (ZIP) code of the Address.")
  @example("60661")
  PostalCode: string;

  @doc("An optional friendly name for the Address. When omitted, `CustomerName` is used.")
  @maxLength(64)
  @example("Chicago HQ")
  FriendlyName?: string;

  @doc("The secondary address component, such as a suite, unit, or floor.")
  @example("Suite 300")
  StreetSecondary?: string;

  @doc("The ISO 3166-1 alpha-2 country code of the Address.")
  @example("US")
  IsoCountry?: string = "US";

  @doc("""
    Whether to submit this Address for emergency (E911) use. When `true` and `IsoCountry` is `US`,
    the Address is validated against the carrier before it is stored.
    """)
  @example(true)
  EmergencyEnabled?: boolean = false;

  @doc("""
    Whether to automatically apply a carrier-suggested correction when the submitted Address is
    correctable. When `false`, a correctable Address is rejected with error `21629` and the suggested
    correction is returned in the error message. Only applies when `EmergencyEnabled=true`.
    """)
  @example(true)
  AutoCorrectAddress?: boolean = true;
}

@doc("Request body for creating an Address.")
model CreateAddressRequest {
  ...AddressRequestBody;
}

@doc("Request body for updating an Address.")
model UpdateAddressRequest {
  ...AddressRequestBody;
}
