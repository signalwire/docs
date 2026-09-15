import "./core.tsp";

namespace SignalWireAPI.Space;

@doc("Request body for renaming the space.")
model UpdateSpaceRequest {
  @doc("The new name of the space. Must not be blank.")
  @minLength(1)
  @example("Acme Production")
  name: string;
}

@doc("Request body for replacing the selected countries.")
model UpdateGeographicPermissionsRequest {
  @doc("""
    The ISO 3166-1 alpha-2 country codes to select. The array replaces the current
    selection. Codes outside `supported_countries` are dropped, and if nothing supported
    remains the request is rejected with `no_supported_countries`.
    """)
  @example(#["US"])
  countries: string[];
}
