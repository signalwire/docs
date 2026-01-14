import "./core.tsp";

using TypeSpec.Http;

@doc("Request body for creating a verified caller ID.")
model CreateVerifiedCallerIdRequest {
  @doc("The phone number to verify in E.164 format.")
  @example("+15551234567")
  phone_number: string;

  @doc("The friendly name for the verified caller ID.")
  @example("John's Mobile")
  friendly_name?: string;
}

@doc("Request body for verifying a caller ID.")
model VerifyCallerIdRequest {
  @doc("The verification code received via call or SMS.")
  @example("123456")
  verification_code: string;
}
