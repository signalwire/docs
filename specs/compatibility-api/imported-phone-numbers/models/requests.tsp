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
  @doc("The phone number to import in E.164 format. Number must be between 5 and 30 characters with no special characters besides a leading `+`.")
  @example("+49152234333323")
  @minLength(5)
  @maxLength(30)
  number: string;

    @doc("The type of phone number being imported.")
    number_type: NumberType;

    @doc("The capabilities to enable for this phone number. Can include any combination of SMS, Voice, Fax, and MMS. If not provided, defaults to all capabilities (SMS, Voice, Fax, and MMS). Cannot be an empty array.")
    capabilities?: PhoneNumberCapability[];
}
