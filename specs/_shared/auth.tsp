import "@typespec/http";
import "@typespec/openapi";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

@doc("""
  SignalWire Basic Authentication using Project ID and API Token.
  
  The client sends HTTP requests with the Authorization header containing
  the word Basic followed by a space and a base64-encoded string of project_id:token.
  The project ID will be used as the username and the API token as the password.
  
  Example:
  ```
  Authorization: Basic base64(project_id:token)
  ```
  """)
@extension(
  "x-fern-basic",
  #{
    username: #{ name: "project_id", env: "SIGNALWIRE_PROJECT_ID" },
    password: #{ name: "api_token", env: "SIGNALWIRE_API_TOKEN" },
  }
)
model SignalWireBasicAuth is BasicAuth;

@doc("""
  SignalWire Bearer Token Authentication for subscriber endpoints.
  The client sends HTTP requests with the Authorization header containing
  the word Bearer followed by a space and the subscriber token.
  
  Example:
  ```
  Authorization: Bearer <subscriber_token>
  ```
  """)
model SignalWireBearerAuth is BearerAuth;

@doc("""
  Personal access token authentication for space-wide administration.
  
  Send HTTP Basic auth with an empty username and the Personal access token as
  the password. A Personal access token carries your own authority rather than a
  project's: it is created from your user menu in the Dashboard, is prefixed
  `pat_`, and has no scopes. The holder must be an owner or admin of the space
  named by the subdomain, and the token acts only on that space.
  
  Example:
  ```
  Authorization: Basic base64(:pat_...)
  ```
  """)
@extension(
  "x-fern-basic",
  #{
    username: #{ name: "username" },
    password: #{
      name: "personal_access_token",
      env: "SIGNALWIRE_PERSONAL_ACCESS_TOKEN",
    },
  }
)
model SignalWirePersonalAccessTokenAuth is BasicAuth;
