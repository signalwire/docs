import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../_shared/errors.tsp";
import "../tags.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

@route("/Accounts/{AccountSid}/IncomingPhoneNumbers")
namespace CompatibilityAPI.IncomingPhoneNumbers {
  @tag(INCOMING_PHONE_NUMBERS_TAG)
  @friendlyName("Incoming Phone Numbers")
  interface IncomingPhoneNumbers {
    @operationId("list_incoming_phone_numbers")
    @summary("List all Incoming Phone Numbers")
    @doc("""
      List all incoming phone numbers.

      #### Permissions
      The API token must include the following scopes: _Numbers_.
      """)
    list(
      ...IncomingPhoneNumbersAccountSidPath,
      @query @doc("Only show numbers that match this pattern.") PhoneNumber?: string,
      @query @doc("Only show numbers with this friendly name.") FriendlyName?: string,
      @query @doc("Only show numbers that are marked as beta.") Beta?: boolean,
      @query @doc("Only show numbers that match this origin.") Origin?: string,
    ): IncomingPhoneNumberListResponse | StatusCode401;

    @operationId("create_incoming_phone_number")
    @summary("Create an Incoming Phone Number")
    @doc("""
      Create an Incoming Phone Number.

      #### Permissions
      The API token must include the following scopes: _Numbers_.
      """)
    @post
    create(
      ...IncomingPhoneNumbersAccountSidPath,
      @header contentType: "application/x-www-form-urlencoded",
      @body body?: CreateIncomingPhoneNumberRequest,
    ): IncomingPhoneNumberResponse | StatusCode401 | StatusCode400;

    @operationId("retrieve_incoming_phone_number")
    @summary("Retrieve an incoming phone number")
    @doc("""
      Retrieve an incoming phone number.

      #### Permissions
      The API token must include the following scopes: _Numbers_.
      """)
    @route("/{Sid}")
    read(...IncomingPhoneNumbersAccountSidPath, ...IncomingPhoneNumberSidPath): IncomingPhoneNumberResponse | StatusCode401 | StatusCode404;

    @operationId("update_incoming_phone_number")
    @summary("Update an incoming phone number")
    @doc("""
      Update an incoming phone number.

      #### Permissions
      The API token must include the following scopes: _Numbers_.
      """)
    @post
    @route("/{Sid}")
    update(
      ...IncomingPhoneNumbersAccountSidPath,
      ...IncomingPhoneNumberSidPath,
      @header contentType: "application/x-www-form-urlencoded",
      @body body: UpdateIncomingPhoneNumberRequest,
    ): IncomingPhoneNumberResponse | StatusCode401 | StatusCode404;

    @operationId("delete_incoming_phone_number")
    @summary("Delete an incoming phone number")
    @doc("""
      Delete an incoming phone number.

      #### Permissions
      The API token must include the following scopes: _Numbers_.
      """)
    @delete
    @route("/{Sid}")
    delete(...IncomingPhoneNumbersAccountSidPath, ...IncomingPhoneNumberSidPath): StatusCode204 | StatusCode401 | StatusCode404;
  }
}
