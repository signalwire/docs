import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../types";
import "../tags.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/verified_caller_ids")
namespace SignalWireAPI.RelayRest.VerifiedCallerID {
  @tag(VERIFIED_CALLER_IDS_TAG)
  @friendlyName("Verified Caller IDs")
  interface VerifiedCallerID {
    @operationId("list_verified_caller_ids")
    @summary("List verified caller IDs")
    @doc("""
      Lists external phone numbers your SignalWire project has submitted for outbound caller-ID verification. Verified Caller IDs let calls present a number the project does not own; project-owned numbers are managed through [Phone Numbers](/docs/apis/rest/phone-numbers/list-phone-numbers) and do not need this verification flow.
      
      ${tokenPermissions<"_Voice_">}
      """)
    list(
      @query
      @doc("String representing the name assigned to the caller ID. Will return all Verified Caller IDs containing this value as a substring.")
      filter_name?: string,
      @query
      @doc("String representing the number assigned to the caller ID. Will return all Verified Caller IDs containing this value as a substring.")
      filter_number?: string,
    ): VerifiedCallerIDListResponse | StatusCode401 | StatusCode500;

    @operationId("create_verified_caller_id")
    @summary("Create verified caller ID")
    @doc("""
      Starts verification of an external phone number for use as an outbound caller ID and sends a verification code to that number. Use it when presenting a number the project does not own; use a purchased or imported project number directly instead. Complete the flow with [Validate verification code](/docs/apis/rest/verified-caller-id/validate-verification-code).
      
      ${tokenPermissions<"_Voice_">}
      """)
    @post
    create(@body body: CreateVerifiedCallerIDRequest):
      | {
          @statusCode statusCode: 201;
          @body verified_caller_id: VerifiedCallerIDResponse;
        }
      | StatusCode401
      | ValidationError
      | StatusCode500;

    @operationId("retrieve_verified_caller_id")
    @summary("Get verified caller ID")
    @doc("""
      Retrieves one external caller-ID verification record from your SignalWire project. Use it to check or display an existing verification; use [Get phone number](/docs/apis/rest/phone-numbers/retrieve-phone-number) for a project-owned number instead.
      
      ${tokenPermissions<"_Voice_">}
      """)
    read(...VerifiedCallerIDPathID):
      | VerifiedCallerIDResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("update_verified_caller_id")
    @summary("Update verified caller ID")
    @doc("""
      Changes the configurable label of an external verified caller-ID record by ID. Use it to maintain the record after verification; updating a project-owned phone number uses [Update phone number](/docs/apis/rest/phone-numbers/update-phone-number) instead.
      
      ${tokenPermissions<"_Voice_">}
      """)
    @put
    update(
      ...VerifiedCallerIDPathID,
      @body body: UpdateVerifiedCallerIDRequest,
    ):
      | VerifiedCallerIDResponse
      | StatusCode401
      | StatusCode404
      | ValidationError
      | StatusCode500;

    @operationId("redial_verification_call")
    @summary("Redial verification call")
    @doc("""
      Places another verification call for a pending external caller-ID record. Use it when the original verification call or code was missed, then submit the new code through [Validate verification code](/docs/apis/rest/verified-caller-id/validate-verification-code).
      
      ${tokenPermissions<"_Voice_">}
      """)
    @route("/{id}/verification")
    @post
    redialVerification(...VerifiedCallerIDPathID):
      | VerifiedCallerIDResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("validate_verification_code")
    @summary("Validate verification code")
    @doc("""
      Submits the code received by an external phone number and marks the caller-ID record verified when it matches. Use it to finish the flow started by [Create verified caller ID](/docs/apis/rest/verified-caller-id/create-verified-caller-id); purchased project numbers do not use this flow.
      
      ${tokenPermissions<"_Voice_">}
      """)
    @route("/{id}/verification")
    @put
    validateVerification(
      ...VerifiedCallerIDPathID,
      @body body: VerifyCallerIDRequest,
    ):
      | VerifiedCallerIDResponse
      | StatusCode401
      | StatusCode404
      | ValidationError
      | StatusCode500;

    @operationId("delete_verified_caller_id")
    @summary("Delete verified caller ID")
    @doc("""
      Deletes an external verified caller-ID record by ID so it is no longer available for outbound caller ID. This does not release or delete a project-owned [Phone Number](/docs/apis/rest/phone-numbers/release-phone-number).
      
      ${tokenPermissions<"_Voice_">}
      """)
    @delete
    delete(...VerifiedCallerIDPathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
