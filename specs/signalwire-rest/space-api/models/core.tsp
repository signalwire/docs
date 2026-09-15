import "../../types";

namespace SignalWireAPI.Space;

@summary("Space")
@doc("The space named by the request subdomain.")
model Space {
  @doc("The object type. Always `space`.")
  @example("space")
  type: "space";

  @doc("The unique identifier of the space.")
  @example("1f2e3d4c-5b6a-4789-9012-3456789abcde")
  id: uuid;

  @doc("The name of the space.")
  @example("Acme Space")
  name: string;

  @doc("The subdomain of the space, which is the first label of its URL.")
  @example("acme")
  subdomain: string;

  @doc("Whether the space has completed verification. An unverified space cannot use this API.")
  @example(true)
  verified: boolean;

  @doc("Whether the space is on a trial.")
  @example(false)
  trial: boolean;

  @doc("The date and time when the space was created.")
  @example(utcDateTime.fromISO("2026-01-15T00:00:00Z"))
  created_at: utcDateTime;

  @doc("The date and time when the space was last updated.")
  @example(utcDateTime.fromISO("2026-08-20T14:19:00Z"))
  updated_at: utcDateTime;
}

@summary("Geographic permission")
@doc("The countries the space has selected for international traffic, and the countries it may select.")
model GeographicPermission {
  @doc("The object type. Always `geographic_permission`.")
  @example("geographic_permission")
  type: "geographic_permission";

  @doc("The selected ISO 3166-1 alpha-2 country codes.")
  @example(#["US", "CA"])
  countries: string[];

  @doc("The ISO 3166-1 alpha-2 country codes that may be selected.")
  @example(#["US", "CA", "GB"])
  supported_countries: string[];
}
