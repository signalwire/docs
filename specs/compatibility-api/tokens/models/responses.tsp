import "./core.tsp";

using TypeSpec.Http;

@doc("Response containing a single token.")
model TokenResponse {
  ...Token;
}

@doc("Response returned when a token is created, including the token secret. No other Compatibility API response returns the secret; to issue a new one for the same token, use [Regenerate API token](/docs/apis/rest/project-tokens/regenerate-token).")
model CreateTokenResponse {
  ...CreatedToken;
}
