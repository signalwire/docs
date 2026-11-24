/**
 * Reusable token permissions description template for an operation that checks
 * one scope. Use this alias in @doc decorators to maintain consistent permission
 * documentation.
 *
 * @example
 * ```typespec
 * import "../../_shared/alias/token-permissions.tsp";
 *
 * @doc("""
 * Operation description here.
 *
 * ${tokenPermissions<"_Voice_">}
 * """)
 * ```
 */
alias tokenPermissions<Scope extends string> = """
  #### Permissions

  The API token used to authenticate must have the following scope enabled to make a successful request: ${Scope}.

  [Learn more about API scopes](/docs/platform/your-signalwire-api-space).
  """;

/**
 * Permissions block for an operation that accepts any one of several scopes.
 * The backend authorizes a request when the token holds at least one of the
 * operation's scopes, never all of them, so list them with "or".
 *
 * @example
 * ```typespec
 * ${anyTokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
 * ```
 */
alias anyTokenPermissions<Scopes extends string> = """
  #### Permissions

  The API token used to authenticate must have at least one of the following scopes enabled to make a successful request: ${Scopes}.

  [Learn more about API scopes](/docs/platform/your-signalwire-api-space).
  """;

/**
 * Permissions block for operations that accept either a project API token or a
 * Personal access token. Use it instead of `tokenPermissions` on the Projects and
 * Project Tokens operations, which take both credentials on the same path.
 */
alias tokenOrPatPermissions<Scope extends string> = """
  #### Permissions

  With a project API token, the token must have the following scope enabled to make a successful request: ${Scope}.
  
  With a [Personal access token](/docs/apis/authorization#personal-access-tokens) there are no scopes. The token holder must be an owner or admin of the space, and the request reaches only the projects the holder is enabled for, plus their subprojects.
  
  [Learn more about API scopes](/docs/platform/your-signalwire-api-space).
  """;

/**
 * Permissions block for the Space Administration API, which accepts only a
 * Personal access token and has no scopes.
 */
alias patPermissions = """
  #### Permissions
  
  Authenticate with a [Personal access token](/docs/apis/authorization#personal-access-tokens) whose holder is an owner or admin of the space. A project API token is not accepted on this endpoint, and a Personal access token has no scopes: the holder's role in the space is the whole authorization decision.
  """;

/**
 * Permissions block for operations a subscriber client calls with a Subscriber
 * Access Token. These endpoints do not accept a project API token, so API token
 * scopes do not apply.
 */
alias satPermissions = """
  #### Permissions

  Authenticate with a Subscriber Access Token (SAT), sent as a [Bearer token](/docs/apis/authorization#bearer-authentication). A project API token is not accepted on this endpoint, so API token scopes don't apply.
  """;
