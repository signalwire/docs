/**
 * Reusable token permissions description template.
 * Use this alias in @doc decorators to maintain consistent permission documentation.
 *
 * @example Single scope
 * ```typespec
 * import "../../_shared/alias/token-permissions.tsp";
 *
 * @doc("""
 * Operation description here.
 *
 * ${tokenPermissions<"_Voice_">}
 * """)
 * ```
 *
 * @example Multiple scopes
 * ```typespec
 * ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
 * ```
 */
alias tokenPermissions<Scopes extends string> = """
  #### Permissions
  
  The API token used to authenticate must have the following scope(s) enabled to make a successful request: ${Scopes}.
  
  [Learn more about API scopes](/docs/platform/your-signalwire-api-space).
  """;

/**
 * Permissions block for operations that accept either a project API token or a
 * Personal access token. Use it instead of `tokenPermissions` on the Projects and
 * Project Tokens operations, which take both credentials on the same path.
 */
alias tokenOrPatPermissions<Scopes extends string> = """
  #### Permissions
  
  With a project API token, the token must have the following scope(s) enabled to make a successful request: ${Scopes}.
  
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
