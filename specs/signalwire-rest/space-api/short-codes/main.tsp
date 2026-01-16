import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../types";
import "../tags.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/short_codes")
namespace SpaceAPI.ShortCodes {
  @tag(SHORT_CODES_TAG)
  @friendlyName("Short Codes")
  interface ShortCodes {
    @operationId("list_short_codes")
    @summary("List all Short Codes")
    @doc("""
      Returns a list of your short codes. The short codes are returned sorted
      by creation date, with the most recent appearing first.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    list(...ListShortCodesQuery): ShortCodeListResponse | StatusCode400 | StatusCode401 | StatusCode500;

    @operationId("retrieve_short_code")
    @summary("Retrieve a Short Code")
    @doc("""
      Retrieves the details of a short code.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    read(...ShortCodePathID): ShortCodeResponse | StatusCode401 | StatusCode404 | ValidationError | StatusCode500;

    @operationId("update_short_code")
    @summary("Update a Short Code")
    @doc("""
      Updates a short code's configuration.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    @put
    update(...ShortCodePathID, @body body: UpdateShortCodeRequest):
      | ShortCodeResponse
      | StatusCode401
      | StatusCode404
      | ValidationError
      | StatusCode500;
  }
}
