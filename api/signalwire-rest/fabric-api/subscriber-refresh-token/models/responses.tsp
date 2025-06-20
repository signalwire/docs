model SubscriberRefreshTokenResponse {
  @doc("A newly generated subscriber access token, valid for 2 hours.")
  @example("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...")
  token: string;

  @doc("A new refresh token, valid for 2 hours and 5 minutes.")
  @example("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...")
  refresh_token: string;
}
