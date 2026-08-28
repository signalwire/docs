import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../_shared/errors.tsp";
import "../tags.tsp";
import "../../_shared/alias/token-permissions.tsp";

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
      Lists the Incoming Phone Number resources owned by the account. These numbers can route calls, messages, and faxes through the project. Use [Available Phone Numbers](/docs/compatibility-api/rest/available-phone-numbers/list-available-phone-number-resources) to search inventory, or SignalWire REST [List phone numbers](/docs/apis/rest/phone-numbers/list-phone-numbers) for JSON requests.
      
      ${tokenPermissions<"_Numbers_">}
      """)
    list(
      ...IncomingPhoneNumbersAccountSidPath,

      @query
      @doc("The page index to retrieve. Zero-indexed.")
      @minValue(0)
      @example(0)
      Page?: int32 = 0,

      @query
      @doc("The number of results per page. Default is 50, maximum is 1000.")
      @minValue(1)
      @maxValue(1000)
      @example(50)
      PageSize?: int32 = 50,

      @query
      @doc("Token for cursor-based pagination. Required when Page > 0.")
      @example("PAb3877c40da604998")
      PageToken?: string,

      @query
      @doc("Only show numbers that match this pattern.")
      @example("+1310")
      PhoneNumber?: string,

      @query
      @doc("Only show numbers with this friendly name.")
      @example("My Phone")
      FriendlyName?: string,
    ):
      | IncomingPhoneNumberListResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode422;

    @operationId("create_incoming_phone_number")
    @summary("Create an Incoming Phone Number")
    @doc("""
      Purchases an available number and provisions it as an Incoming Phone Number in the account. Search first with [Available Phone Numbers](/docs/compatibility-api/rest/available-phone-numbers/list-available-phone-number-resources), or use SignalWire REST [Purchase phone number](/docs/apis/rest/phone-numbers/purchase-phone-number) for a JSON request. To register a number you already own instead of purchasing inventory, use Imported Phone Numbers.
      
      ${tokenPermissions<"_Numbers_">}
      """)
    @post
    create(
      ...IncomingPhoneNumbersAccountSidPath,
      @header contentType: "application/x-www-form-urlencoded",
      @body body: CreateIncomingPhoneNumberRequest,
    ):
      | IncomingPhoneNumberCreatedResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode422;

    @operationId("retrieve_incoming_phone_number")
    @summary("Retrieve an incoming phone number")
    @doc("""
      Retrieves one account-owned phone number by Incoming Phone Number SID so you can inspect how it is used in the project. Use [List all Incoming Phone Numbers](/docs/compatibility-api/rest/incoming-phone-numbers/list-incoming-phone-numbers) to discover SIDs, or native [Get phone number](/docs/apis/rest/phone-numbers/retrieve-phone-number) when working with SignalWire resource IDs.
      
      ${tokenPermissions<"_Numbers_">}
      """)
    @route("/{Sid}")
    read(...IncomingPhoneNumbersAccountSidPath, ...IncomingPhoneNumberSidPath):
      | IncomingPhoneNumberResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404;

    @operationId("update_incoming_phone_number")
    @summary("Update an incoming phone number")
    @doc("""
      Changes how an account-owned phone number is identified or routes inbound calls, messages, and faxes. Use this operation for form-encoded configuration; use SignalWire REST [Update phone number](/docs/apis/rest/phone-numbers/update-phone-number) for JSON configuration.
      
      ${tokenPermissions<"_Numbers_">}
      """)
    @post
    @route("/{Sid}")
    update(
      ...IncomingPhoneNumbersAccountSidPath,
      ...IncomingPhoneNumberSidPath,
      @header contentType: "application/x-www-form-urlencoded",
      @body body: UpdateIncomingPhoneNumberRequest,
    ):
      | IncomingPhoneNumberResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404
      | CompatibilityStatusCode422;

    @operationId("delete_incoming_phone_number")
    @summary("Delete an incoming phone number")
    @doc("""
      Releases an Incoming Phone Number and removes it from the account. This is for numbers the account should no longer own; changing or deleting a handler does not release the number. Native phone-number resources use [Release phone number](/docs/apis/rest/phone-numbers/release-phone-number).
      
      Note: Numbers cannot be released within a cooldown period after purchase.
      
      ${tokenPermissions<"_Numbers_">}
      """)
    @delete
    @route("/{Sid}")
    delete(
      ...IncomingPhoneNumbersAccountSidPath,
      ...IncomingPhoneNumberSidPath,
    ):
      | CompatibilityStatusCode204
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404
      | CompatibilityStatusCode409
      | CompatibilityStatusCode422;
  }
}
