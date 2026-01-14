import "../../../types";

using TypeSpec.Http;
using Types;

model VerifiedCallerIdPathID {
  @doc("Unique ID of the verified caller ID.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  @path
  id: uuid;
}

@doc("Verified caller ID model.")
model VerifiedCallerId {
  @doc("The unique identifier of the verified caller ID.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  id: uuid;

  @doc("The phone number in E.164 format.")
  @example("+15551234567")
  phone_number: string;

  @doc("The friendly name for the verified caller ID.")
  @example("John's Mobile")
  friendly_name?: string;

  @doc("Whether the phone number has been verified.")
  verified: boolean;

  @doc("Timestamp when the verified caller ID was created.")
  created_at?: utcDateTime;

  @doc("Timestamp when the verified caller ID was last updated.")
  updated_at?: utcDateTime;
}

@doc("Verification request model.")
model VerificationRequest {
  @doc("The verification code.")
  @example("123456")
  verification_code: string;
}
