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

@route("/verified_caller_ids")
namespace SpaceAPI.VerifiedCallerIds {
  @tag(VERIFIED_CALLER_IDS_TAG)
  @friendlyName("Verified Caller IDs")
  interface VerifiedCallerIds {
    @operationId("list_verified_caller_ids")
    @summary("List all Verified Caller IDs")
    @doc("""
      Returns a list of your verified caller IDs.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    list(): VerifiedCallerIdListResponse | StatusCode401 | StatusCode500;

    @operationId("create_verified_caller_id")
    @summary("Create a Verified Caller ID")
    @doc("""
      Creates a new verified caller ID. A verification code will be sent to the phone number.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @post
    create(@body body: CreateVerifiedCallerIdRequest):
      | {
          @statusCode statusCode: 201;
          @body verified_caller_id: VerifiedCallerIdResponse;
        }
      | StatusCode401
      | ValidationError
      | StatusCode500;

    @operationId("get_verified_caller_id")
    @summary("Retrieve a Verified Caller ID")
    @doc("""
      Retrieves the details of a verified caller ID.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    read(...VerifiedCallerIdPathID): VerifiedCallerIdResponse | StatusCode401 | StatusCode404 | StatusCode500;

    @operationId("verify_caller_id")
    @summary("Verify a Caller ID")
    @doc("""
      Verifies a caller ID using the verification code.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @route("/{id}/verify")
    @post
    verify(...VerifiedCallerIdPathID, @body body: VerifyCallerIdRequest):
      | {
          @statusCode statusCode: 200;
          @body verified_caller_id: VerifiedCallerIdResponse;
        }
      | StatusCode401
      | StatusCode404
      | ValidationError
      | StatusCode500;

    @operationId("delete_verified_caller_id")
    @summary("Delete a Verified Caller ID")
    @doc("""
      Deletes a verified caller ID.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @delete
    delete(...VerifiedCallerIdPathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
