using TypeSpec.Http;

model ImportedPhoneNumbersAccountSidPath {
  @doc("The unique identifier for the account that is associated with this phone number.")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  @format("uuid")
  @path
  AccountSid: string;
}

@doc("The type of phone number being imported.")
enum NumberType {
  Longcode: "longcode",
  Tollfree: "tollfree",
}

@doc("Phone number capabilities.")
enum PhoneNumberCapability {
  SMS: "sms",
  Voice: "voice",
  Fax: "fax",
  MMS: "mms",
}

@doc("Request body for importing a phone number.")
model ImportPhoneNumberRequest {
  @doc("The phone number to import. Must start with `+` followed by 5-30 digits.")
  @pattern("^\\+\\d{5,30}$")
  @minLength(6)
  @maxLength(31)
  @example("+49152234333323")
  number: string;

  @doc("The type of phone number being imported.")
  @example(NumberType.Longcode)
  number_type: NumberType;

  @doc("The capabilities to enable for this phone number. Must include at least one capability. Can include any combination of: `sms`, `voice`, `fax`, `mms`.")
  @minItems(1)
  @example(#[PhoneNumberCapability.SMS, PhoneNumberCapability.Voice])
  capabilities: PhoneNumberCapability[];
}
