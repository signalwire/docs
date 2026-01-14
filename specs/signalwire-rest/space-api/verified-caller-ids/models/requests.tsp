import "./core.tsp";

using TypeSpec.Http;

@doc("Request body for creating a verified caller ID.")
model CreateVerifiedCallerIdRequest {
  @doc("String representing the phone number for the caller ID. This must be a valid, routeable phone number in E.164 format that is able to receive a voice phone call for verification.")
  @example("+15551234567")
  number: string;

  @doc("String representing the name portion of the caller ID. If not provided, the default will be the formatted number that has been provided.")
  @example("C-3P0")
  name?: string;

  @doc("String representing the extension of the phone number for the caller ID. This is only used when placing the verification call.")
  @example("1234")
  extension?: string;
}

@doc("Request body for verifying a caller ID.")
model VerifyCallerIdRequest {
  @doc("The verification code received via call or SMS.")
  @example("123456")
  verification_code: string;
}
