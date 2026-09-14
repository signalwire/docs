import "@typespec/http";
import "@typespec/openapi";
import "../types";
import "../_globally_shared/const.tsp";
import "../../_shared/auth.tsp";
import "../../_shared/alias/token-permissions.tsp";
import "./tags.tsp";
import "./models/shared.tsp";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/errors.tsp";
import "./members";
import "./balance";
import "./billing";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/api/space")
@useAuth(SignalWirePersonalAccessTokenAuth)
namespace SignalWireAPI.Space {
  @tag(SPACE_TAG)
  @friendlyName("Space")
  interface SpaceOperations {
    @operationId("get_space")
    @summary("Retrieve the space")
    @doc("""
      Returns the space named by the request subdomain: its name, subdomain, verification and
      trial state, and timestamps.

      Everything under `/api/space` is space-wide, so no project appears in the path. A
      Personal Access Token acts only on the space whose subdomain was called; the same token
      sent to another subdomain resolves no membership and is rejected with `401`.

      ${patPermissions}
      """)
    @get
    read(): Space | SpaceUnauthorizedError | SpaceUnverifiedError | StatusCode500;

    @operationId("update_space")
    @summary("Update the space")
    @doc("""
      Renames the space. The subdomain cannot be changed through the API.

      ${patPermissions}
      """)
    @put
    update(@body body: UpdateSpaceRequest):
      | Space
      | SpaceInvalidJsonError
      | SpaceUnauthorizedError
      | SpaceUnverifiedError
      | UpdateSpaceStatusCode422
      | StatusCode500;

    @operationId("get_geographic_permissions")
    @summary("Retrieve geographic permissions")
    @doc("""
      Returns the countries the space has selected for international traffic, together with
      the countries it may select. The selection is read from the billing service, so the
      response is `502` when that service is unavailable.

      ${patPermissions}
      """)
    @route("/geographic_permissions")
    @get
    readGeographicPermissions():
      | GeographicPermission
      | SpaceUnauthorizedError
      | SpaceUnverifiedError
      | SpaceUpstreamUnavailableError
      | StatusCode500;

    @operationId("update_geographic_permissions")
    @summary("Update geographic permissions")
    @doc("""
      Replaces the selected countries with the array in the request. Codes outside
      `supported_countries` are dropped; if nothing supported remains, the request is
      rejected with `no_supported_countries`.

      Updating the selection additionally requires that the space is allowed to edit
      international settings. A space that is not receives `401` even when the token holder
      is an owner or admin.

      ${patPermissions}
      """)
    @route("/geographic_permissions")
    @put
    updateGeographicPermissions(@body body: UpdateGeographicPermissionsRequest):
      | GeographicPermission
      | SpaceInvalidJsonError
      | SpaceUnauthorizedError
      | SpaceUnverifiedError
      | UpdateGeographicPermissionsStatusCode422
      | SpaceUpstreamUnavailableError
      | StatusCode500;
  }
}
