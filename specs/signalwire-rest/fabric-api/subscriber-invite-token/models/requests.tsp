model SubscriberInviteTokenCreateRequest {
  @doc("Unique ID of a Subscriber Address")
  address_id: uuid;

  @doc("A unixtime (the number of seconds since 1970-01-01 00:00:00) at which the token should no longer be valid. Defaults to 'two hours from now'")
  @example(1725513600)
  expires_at?: integer;
}
