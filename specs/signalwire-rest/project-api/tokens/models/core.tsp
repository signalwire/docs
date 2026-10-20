import "../../../_globally_shared/const.tsp";

namespace SignalWireAPI.Project;

@doc("Valid permission types for API tokens.")
enum TokenPermission {
  calling,
  chat,
  datasphere,
  fax,
  management,
  messaging,
  numbers,
  pubsub,
  storage,
  tasking,
  video,
}

@summary("API Token Response")
model TokenResponse {
  @doc("The ID of the API Token.")
  @example("ea14556a-984f-11ee-b9d1-0242ac120002")
  id: uuid;

  @doc("The name of the API Token. `null` when the token has no name.")
  @example("John Doe's Token")
  name: string | null;

  @doc("The permissions enabled for this token.")
  @example(#[
    TokenPermission.calling,
    TokenPermission.fax,
    TokenPermission.messaging
  ])
  permissions: TokenPermission[];

  @doc("The date and time the token last authenticated a request. `null` if it never has.")
  @example(UTC_TIME_EXAMPLE)
  last_used_at: utcDateTime | null;

  @doc("The date and time the token's value was revoked. `null` if it has not been revoked. [Regenerate API token](/docs/apis/rest/project-tokens/regenerate-token) clears it.")
  @example(null)
  revoked_at: utcDateTime | null;
}

@summary("Created API Token Response")
model CreateTokenResponse {
  ...TokenResponse;

  @doc("The API token that can be used along with the project ID for basic authentication. It is returned only when the token is created or regenerated and cannot be retrieved again; store it securely.")
  @example("swapi_0123456789ab0123456789ab0123456789ab")
  token: string;
}

@doc("Pagination links for a list of API tokens.")
model TokenPaginationLinks {
  @doc("The link to the current page.")
  @example("https://example-space.signalwire.com/api/project/tokens?page_number=0&page_size=50")
  self: url;

  @doc("The link to the first page.")
  @example("https://example-space.signalwire.com/api/project/tokens?page_size=50")
  first: url;

  @doc("The link to the next page. Only present when more results exist.")
  @example("https://example-space.signalwire.com/api/project/tokens?page_number=1&page_size=50&page_token=PAea14556a-984f-11ee-b9d1-0242ac120002")
  next?: url;

  @doc("The link to the previous page. Only present when a previous page exists.")
  @example("https://example-space.signalwire.com/api/project/tokens?page_number=0&page_size=50&page_token=PBea14556a-984f-11ee-b9d1-0242ac120002")
  prev?: url;
}
