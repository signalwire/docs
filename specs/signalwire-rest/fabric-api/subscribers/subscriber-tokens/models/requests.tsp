import "../../../../types";

model SubscriberTokenRequest {
  @doc("A string that uniquely identifies the subscriber. Often it's an email, but can be any other string.")
  @example("john.doe@example.com")
  reference: string;

  @doc("A unixtime (the number of seconds since 1970-01-01 00:00:00) at which the token should no longer be valid. Defaults to 'two hours from now'")
  @example(1693823284)
  expire_at?: integer;

  @doc("The ID of the application that the token is associated with.")
  @example("123e4567-e89b-12d3-a456-426614174000")
  application_id?: uuid;

  @doc("Set or update the subscriber's password. Omit this field or pass an empty string if you don't want to update the password.")
  @example("password123")
  password?: string;

  @doc("""
    Binds the token to a specific device or browser session, letting the
    holder refresh it without going through your backend. The [Browser SDK](/docs/browser-sdk/v4)
    generates this value automatically when starting a session — forward it
    to your backend when requesting a token, so tie the token to that client.

    Without `fingerprint`, your backend can still refresh the token using
    the companion [`refresh_token`](/docs/apis/rest/subscribers/tokens/refresh-subscriber-token)
    returned in this response.
    """)
  @minLength(43)
  @maxLength(43)
  @pattern("^[A-Za-z0-9_-]+$")
  @example("Vg1h7IDV3AR6kTpCkZPHOVs32B81DX1naHiHbYoKXgY")
  fingerprint?: string;

  @doc("""
    Grants the token's holder permission to refresh it directly from the
    Browser SDK client. Pair with `fingerprint` to bind the token to a
    device.

    Without this scope, your backend can still refresh the token using the
    companion [`refresh_token`](/docs/apis/rest/subscribers/tokens/refresh-subscriber-token).
    If `sat:refresh` is set without `fingerprint`, the token's lifetime is
    limited to 60 seconds.
    """)
  @example("sat:refresh")
  scope?: "sat:refresh";

  @doc("Set or update the first name of the subscriber.")
  @example("John")
  first_name?: string;

  @doc("Set or update the last name of the subscriber.")
  @example("Doe")
  last_name?: string;

  @doc("Set or update the display name of the subscriber.")
  @example("John Doe")
  display_name?: string;

  @doc("Set or update the job title of the subscriber.")
  @example("Software Engineer")
  job_title?: string;

  @doc("Set or update the time zone of the subscriber.")
  @example("America/New_York")
  time_zone?: string;

  @doc("Set or update the country of the subscriber.")
  @example("US")
  country?: string;

  @doc("A routing override that controls which regional cluster the SDK connects to.")
  @example("us-central")
  region?: "us-central";

  @doc("Set or update the company name of the subscriber.")
  @example("SignalWire")
  company_name?: string;
}
