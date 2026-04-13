model SubscriberGuestTokenCreateRequest {
  @doc("List of up to 10 UUIDs representing the allowed Fabric addresses.")
  @maxItems(10)
  allowed_addresses: uuid[];

  @doc("A unixtime (the number of seconds since 1970-01-01 00:00:00) at which the token should no longer be valid. Defaults to 'two hours from now'")
  @example(1725513600)
  expire_at?: integer;

  @doc("A routing override that controls which regional cluster the SDK connects to.")
  @example("us-central")
  region?: "us-central";

  @doc("A direct routing override specifying the regional cluster endpoint, set as the `ch` claim in the SAT JWE header.")
  @example("us-central")
  ch?: "us-central";
}
