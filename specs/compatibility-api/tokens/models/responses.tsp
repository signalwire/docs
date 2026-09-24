import "./core.tsp";

using TypeSpec.Http;

@doc("Response containing a single token.")
model TokenResponse {
  ...Token;
}

@doc("Response returned when a token is created. This is the only response that includes the token secret.")
model CreateTokenResponse {
  ...CreatedToken;
}
