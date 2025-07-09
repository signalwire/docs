model SubscriberRefreshTokenRequest {
  @doc("The refresh token previously issued alongside a subscriber access token. This token is used to request a new access token.")
  @example("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...")
  @format("uuid")
  refresh_token: uuid;
}
