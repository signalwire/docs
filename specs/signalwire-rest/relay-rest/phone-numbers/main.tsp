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

@route("/phone_numbers")
namespace SignalWireAPI.RelayRest.PhoneNumbers {
  @tag(PHONE_NUMBERS_TAG)
  @friendlyName("Phone Numbers")
  interface PhoneNumbers {
    @operationId("list_phone_numbers")
    @summary("List phone numbers")
    @doc("""
      Lists the phone numbers owned by your SignalWire project. These numbers can send or receive communications according to their capabilities and assigned handlers. Use [Search phone numbers](/docs/apis/rest/phone-numbers/search-available-phone-numbers) for numbers available to purchase, or Compatibility [Incoming Phone Numbers](/docs/compatibility-api/rest/incoming-phone-numbers/list-incoming-phone-numbers) for SID-based routes. Results are sorted by creation date, most recent first.
      
      ${tokenPermissions<"_Numbers_">}
      """)
    list(...ListPhoneNumbersQuery):
      | PhoneNumberListResponse
      | StatusCode400
      | StatusCode401
      | StatusCode500;

    @operationId("purchase_phone_number")
    @summary("Purchase phone number")
    @doc("""
      Purchases one available phone number and adds it to the project. Search first with [Search phone numbers](/docs/apis/rest/phone-numbers/search-available-phone-numbers), then pass the selected E.164 number here. Use [Import phone number](/docs/apis/rest/phone-numbers/create-imported-phone-number) when the number remains hosted elsewhere, or Compatibility [Incoming Phone Numbers](/docs/compatibility-api/rest/incoming-phone-numbers/create-incoming-phone-number) for form-encoded requests.
      
      ${tokenPermissions<"_Numbers_">}
      """)
    @post
    create(@body body: PurchasePhoneNumberRequest):
      | {
          @statusCode statusCode: 200;
          @body phone_number: PhoneNumberResponse;
        }
      | StatusCode400
      | StatusCode401
      | ValidationError
      | StatusCode500;

    @operationId("retrieve_phone_number")
    @summary("Get phone number")
    @doc("""
      Retrieves one phone number owned by your SignalWire project. Use [List phone numbers](/docs/apis/rest/phone-numbers/list-phone-numbers) to find owned numbers, or [Search phone numbers](/docs/apis/rest/phone-numbers/search-available-phone-numbers) to find numbers that have not yet been purchased.
      
      ${tokenPermissions<"_Numbers_">}
      """)
    read(...PhoneNumberPathID):
      | PhoneNumberResponse
      | StatusCode401
      | StatusCode404
      | ValidationError
      | StatusCode500;

    @operationId("update_phone_number")
    @summary("Update phone number")
    @doc("""
      Changes how a project-owned phone number is identified or routes inbound calls and messages. Use [Assign Resource to phone route](/docs/apis/rest/phone-numbers/assign-resource-phone-route) when assigning an existing Fabric resource as the handler.
      
      ${tokenPermissions<"_Numbers_">}
      """)
    @put
    update(...PhoneNumberPathID, @body body: UpdatePhoneNumberRequest):
      | {
          @statusCode statusCode: 200;
          @body phone_number: PhoneNumberResponse;
        }
      | StatusCode401
      | StatusCode404
      | ValidationError
      | StatusCode500;

    @operationId("release_phone_number")
    @summary("Release phone number")
    @doc("""
      Releases a project-owned phone number by ID, removing it from the project. Use it only when the number should no longer be owned; deleting a handler resource or removing its E911 assignment does not release the number. Compatibility Incoming Phone Numbers use their own delete operation.
      
      ${tokenPermissions<"_Numbers_">}
      """)
    @delete
    delete(...PhoneNumberPathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | ValidationError
      | StatusCode500;

    @operationId("assign_e911_address")
    @summary("Assign an E911 address to a phone number")
    @doc("""
      Assigns a validated E911 address to the phone number and begins provisioning at the carrier. The number's `e911_status` becomes `pending`; it moves to `active` asynchronously once the carrier confirms. The address is re-validated at the carrier and must be valid.

      Use this operation after [Create E911 address](/docs/apis/rest/e-911-addresses/create-address) when emergency calls from the number must present that physical service location. Resource addresses and SIP Addresses are routing handles and cannot be assigned for E911.

      The address `label` is sent to the carrier as the caller name presented to the dispatcher. The emergency network limits that field to 32 characters, so a longer label is truncated to the first 32 characters. Truncation never affects the street address used to route the call, and does not cause the assignment to fail.

      ${tokenPermissions<"_Numbers_">}
      """)
    @route("/{id}/e911_address")
    @post
    assignE911Address(...PhoneNumberPathID, @body body: AssignE911AddressRequest):
      | PhoneNumberResponse
      | StatusCode401
      | StatusCode404
      | ValidationError
      | StatusCode500;

    @operationId("remove_e911_address")
    @summary("Remove the E911 address from a phone number")
    @doc("""
      Removes the E911 address from the phone number and begins deprovisioning at the carrier. Only allowed while the number is `active`. The `e911_status` becomes `pending_removal`; the address remains associated until the carrier confirms removal.

      Use this operation to stop emergency-service provisioning for the number without deleting the reusable E911 address or releasing the phone number.

      ${tokenPermissions<"_Numbers_">}
      """)
    @route("/{id}/e911_address")
    @delete
    removeE911Address(...PhoneNumberPathID):
      | PhoneNumberResponse
      | StatusCode401
      | StatusCode404
      | ValidationError
      | StatusCode500;

    @operationId("retrieve_caller_id_name")
    @summary("Get the caller ID name for a phone number")
    @doc("""
      Retrieves the most recent caller ID name request for a phone number in your project, including its current review status. After [Request a caller ID name](/docs/apis/rest/phone-numbers/request-caller-id-name), poll this operation until `status` is `approved`, `rejected`, or `failed`.

      The response's `name` is the requested name. It can differ from the name call recipients currently see while the request is `pending` or `in_review`, or after it is `rejected` or `failed`. To retrieve the caller ID name currently applied at the carrier, read `cnam` on the phone number with [Get phone number](/docs/apis/rest/phone-numbers/retrieve-phone-number).

      Returns `404` when the phone number is not in your project or has never had a caller ID name requested.

      ${tokenPermissions<"_Numbers_">}
      """)
    @route("/{id}/cnam")
    @get
    readCnam(...PhoneNumberPathID):
      | PhoneNumberCnamResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("request_caller_id_name")
    @summary("Request a caller ID name for a phone number")
    @doc("""
      Requests the caller ID name displayed alongside a project-owned phone number on outbound calls. Caller ID name is available only for numbers whose carrier offers it. This operation sets the outbound name for your own number; to retrieve the name published for another number, use [Look up phone number](/docs/apis/rest/phone-numbers/lookup-phone-number) with `include=cnam`.

      A `201` means SignalWire accepted the request, not necessarily that call recipients see the name yet. A new name, or one previously `rejected` or `failed`, returns with `status` set to `pending` and is queued for compliance review. Poll [Get the caller ID name](/docs/apis/rest/phone-numbers/retrieve-caller-id-name) until `status` is `approved`, `rejected`, or `failed`.

      Re-requesting a name already `approved` for this phone number returns the existing request with `201` and `status` still `approved`. SignalWire re-applies that name at the carrier without another compliance review.

      A phone number can have only one request awaiting a decision. Submitting a different name supersedes any earlier request with a `pending` or `in_review` status.

      SignalWire normalizes `name` before validating it, so apply the length and character rules to the normalized form described on that field. A `422` means the phone number's carrier does not offer caller ID name, `name` was blank, or the normalized name did not meet those rules.

      Returns `404` when the phone number is not in your project.

      ${tokenPermissions<"_Numbers_">}
      """)
    @route("/{id}/cnam")
    @post
    requestCnam(...PhoneNumberPathID, @body body: CreatePhoneNumberCnamRequest):
      | {
          @statusCode statusCode: 201;
          @body cnam: PhoneNumberCnamResponse;
        }
      | StatusCode401
      | StatusCode404
      | ValidationError
      | StatusCode500;

    @operationId("clear_caller_id_name")
    @summary("Clear the caller ID name on a phone number")
    @doc("""
      Queues removal of the caller ID name from a phone number in your project. A `204` means SignalWire accepted the request; the applied name remains available as `cnam` on the phone number until the carrier confirms the removal. After confirmation, `cnam` becomes `null` and SignalWire cancels any request still `pending` or `in_review`.

      SignalWire first checks whether the phone number's carrier offers caller ID name. If it does not, the operation returns `422`. For a supported phone number, there must be an applied name or a request awaiting a decision; otherwise the operation returns `422` because there is nothing to clear.

      Returns `404` when the phone number is not in your project.

      ${tokenPermissions<"_Numbers_">}
      """)
    @route("/{id}/cnam")
    @delete
    clearCnam(...PhoneNumberPathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | ValidationError
      | StatusCode500;

    @operationId("search_available_phone_numbers")
    @summary("Search phone numbers")
    @doc("""
      Searches SignalWire's available inventory for local or toll-free phone numbers. Search results are candidates, not numbers your project owns; pass a selected result to [Purchase phone number](/docs/apis/rest/phone-numbers/purchase-phone-number). Use [List phone numbers](/docs/apis/rest/phone-numbers/list-phone-numbers) for owned numbers, or Compatibility [Available Phone Numbers](/docs/compatibility-api/rest/available-phone-numbers/search-local-available-phone-numbers) for form-encoded requests.
      
      ${tokenPermissions<"_Numbers_">}
      """)
    @route("/search")
    @get
    search(
      @query
      @doc("An areacode to search within.")
      areacode?: string,

      @query
      @doc("Search for either local or toll-free numbers. Defaults to local.")
      number_type?: string,

      @query
      @doc("A string of 3 to 7 digits that should be used as the start of a number. Cannot be used in combination with contains or ends_with.")
      starts_with?: string,

      @query
      @doc("A string of 3 to 7 digits that should appear somewhere in the number. Cannot be used in combination with starts_with or ends_with.")
      contains?: string,

      @query
      @doc("A string of 3 to 7 digits that should be used as the end of a number. Cannot be used in combination with starts_with or contains.")
      ends_with?: string,

      @query
      @doc("The maximum number of matches to return. Upper limit of 100. Defaults to 50.")
      max_results?: int32,

      @query
      @doc("A region or state to search within. Must be an ISO 3166-2 alpha-2 code, i.e. TX for Texas. Only supported for local searches; not supported when `number_type` is toll-free.")
      region?: string,

      @query
      @doc("A specific City to search within. Must be used in combination with region. Only supported for local searches; not supported when `number_type` is toll-free.")
      city?: string,
    ): AvailablePhoneNumbersResponse | StatusCode401 | StatusCode500;
  }
}

@route("/imported_phone_numbers")
namespace SignalWireAPI.RelayRest.ImportedPhoneNumbers {
  @tag(IMPORTED_PHONE_NUMBERS_TAG)
  @friendlyName("Imported Phone Numbers")
  interface ImportedPhoneNumbers {
    @operationId("create_imported_phone_number")
    @summary("Import phone number")
    @doc("""
      Imports a phone number that remains hosted with another provider into the SignalWire project and enables the requested capabilities. Use this Partner API when bringing externally hosted inventory; use [Purchase phone number](/docs/apis/rest/phone-numbers/purchase-phone-number) for SignalWire inventory, or Compatibility [Import phone number](/docs/compatibility-api/rest/imported-phone-numbers/create-imported-phone-number) for a form-encoded request.
      
      **Note:** This is a **Partner API**. To enable it on your SignalWire Space, contact [Sales](https://signalwire.com/company/contact?utm_campaign=devex_sent_em).
      
      ${tokenPermissions<"_Numbers_">}
      """)
    @post
    create(@body body: ImportPhoneNumberRequest):
      | {
          @statusCode statusCode: 201;
          @body phone_number: PhoneNumberResponse;
        }
      | StatusCode401
      | ValidationError
      | StatusCode500;
  }
}

@route("/lookup/phone_number")
namespace SignalWireAPI.RelayRest.PhoneNumberLookup {
  @tag(PHONE_NUMBER_LOOKUP_TAG)
  @friendlyName("Phone Number Lookup")
  interface PhoneNumberLookup {
    @operationId("lookup_phone_number")
    @summary("Look up phone number")
    @doc("""
      Returns validity and formatting information for any supplied E.164 phone number, with optional carrier and caller-name data. Use it to normalize or enrich a number before other workflows; it neither searches purchasable inventory nor returns numbers owned by the project. Use [Search phone numbers](/docs/apis/rest/phone-numbers/search-available-phone-numbers) or [List phone numbers](/docs/apis/rest/phone-numbers/list-phone-numbers) for those jobs.
      
      #### Permissions
      
      No API token scope is required to make a successful request to this endpoint.
      
      [Learn more about API scopes](/docs/platform/your-signalwire-api-space).
      """)
    @route("/{e164_number}")
    @get
    lookup(
      ...E164NumberPath,

      @query
      @doc("Further number information to include in the response, some of which are billable. You can specify: carrier (Lookup full carrier information for the number), cnam (Lookup Caller ID information for the number). Separate multiple values with a comma: include=carrier,cnam.")
      include?: string,
    ):
      | PhoneNumberLookupResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
