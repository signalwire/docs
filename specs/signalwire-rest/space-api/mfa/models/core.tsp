import "../../../types";

using TypeSpec.Http;
using Types;

@doc("MFA request model.")
model MfaRequest {
  @doc("The phone number to send the MFA code to.")
  @example("+15551234567")
  to: string;

  @doc("The phone number to send the MFA code from.")
  @example("+15559876543")
  from?: string;

  @doc("The message template for the MFA code. Use {{code}} as placeholder.")
  @example("Your verification code is {{code}}")
  message?: string;

  @doc("The length of the verification code.")
  @example(6)
  token_length?: int32 = 6;

  @doc("The number of seconds the code is valid.")
  @example(300)
  valid_for?: int32 = 300;

  @doc("The maximum number of verification attempts allowed.")
  @example(3)
  max_attempts?: int32 = 3;

  @doc("Whether to allow alphanumeric codes.")
  allow_alpha?: boolean = false;
}

@doc("MFA response model.")
model MfaResponse {
  @doc("The unique identifier of the MFA request.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  id: uuid;

  @doc("The phone number the MFA code was sent to.")
  @example("+15551234567")
  to: string;

  @doc("Whether the MFA request was successful.")
  success: boolean;
}

@doc("MFA verification request model.")
model MfaVerifyRequest {
  @doc("The unique identifier of the MFA request to verify.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  id: uuid;

  @doc("The verification code to verify.")
  @example("123456")
  token: string;
}

@doc("MFA verification response model.")
model MfaVerifyResponse {
  @doc("The unique identifier of the MFA request.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  id: uuid;

  @doc("Whether the verification was successful.")
  success: boolean;
}
