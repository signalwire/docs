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
      Returns a list of your Verified Caller IDs. The caller IDs are returned sorted by creation date, with the most recent caller IDs appearing first. The list is filterable by sending in any of the following parameters.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    list(
      @query @doc("String representing the name assigned to the caller ID. Will return all Verified Caller IDs containing this value as a substring.") filter_name?: string,
      @query @doc("String representing the number assigned to the caller ID. Will return all Verified Caller IDs containing this value as a substring.") filter_number?: string
    ): VerifiedCallerIdListResponse | StatusCode401 | StatusCode500;

    @operationId("create_verified_caller_id")
    @summary("Create a new Verified Caller ID")
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

    @operationId("retrieve_verified_caller_id")
    @summary("Retrieve a Verified Caller ID")
    @doc("""
      Retrieves the details of a verified caller ID.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    read(...VerifiedCallerIdPathID): VerifiedCallerIdResponse | StatusCode401 | StatusCode404 | StatusCode500;

    @operationId("update_verified_caller_id")
    @summary("Update a Verified Caller ID")
    @doc("""
      Updates a verified caller ID.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @put
    update(...VerifiedCallerIdPathID, @body body: UpdateVerifiedCallerIdRequest): VerifiedCallerIdResponse | StatusCode401 | StatusCode404 | ValidationError | StatusCode500;

    @operationId("redial_verification_call")
    @summary("Redial Verification Call")
    @doc("""
      Redials the verification call for a verified caller ID.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @route("/{id}/verification")
    @post
    redialVerification(...VerifiedCallerIdPathID): VerifiedCallerIdResponse | StatusCode401 | StatusCode404 | StatusCode500;

    @operationId("validate_verification_code")
    @summary("Validate the Verification Code")
    @doc("""
      Validates the verification code for a verified caller ID.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @route("/{id}/verification")
    @put
    validateVerification(...VerifiedCallerIdPathID, @body body: VerifyCallerIdRequest): VerifiedCallerIdResponse | StatusCode401 | StatusCode404 | ValidationError | StatusCode500;

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
