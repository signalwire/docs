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

@route("/Accounts/{AccountSid}/Addresses")
namespace CompatibilityAPI.Addresses {
  @tag(ADDRESSES_TAG)
  @friendlyName("Addresses")
  interface Addresses {
    @operationId("list_addresses")
    @summary("List Addresses")
    @doc("""
      List the Addresses associated with your Account, returned as a list of Addresses.

      ${tokenPermissions<"_Numbers_">}
      """)
    list(
      ...AddressesAccountSidPath,

      @query
      @doc("Filter by the friendly name of the Address.")
      @example("Chicago HQ")
      FriendlyName?: string,

      @query
      @doc("The page number to retrieve. Page numbers are zero-indexed, so the first page is 0.")
      @minValue(0)
      @example(0)
      Page?: int32 = 0,

      @query
      @doc("The number of results to return per page. The default is 50, and the maximum is 1000.")
      @minValue(1)
      @maxValue(1000)
      @example(50)
      PageSize?: int32 = 50,

      @query
      @doc("A token used to retrieve a specific page of results.")
      @example("PA01234567890abcdef01234567890abcdef")
      PageToken?: string,
    ):
      | AddressListResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401;

    @operationId("create_address")
    @summary("Create an Address")
    @doc("""
      Create an Address.

      When `EmergencyEnabled=true` and `IsoCountry=US`, the Address is validated against the carrier before it is stored:

      - A valid Address is stored as-is.
      - A correctable Address is stored with the carrier's correction applied, unless `AutoCorrectAddress=false`, in which case the request is rejected with error `21629` and the suggested correction is included in the error message.
      - An Address the carrier cannot validate is rejected with error `21628`.

      Addresses submitted without `EmergencyEnabled` (or for a non-US country) are stored without carrier validation.

      ${tokenPermissions<"_Numbers_">}
      """)
    @post
    create(
      ...AddressesAccountSidPath,
      @header contentType: "application/x-www-form-urlencoded",
      @body body: CreateAddressRequest,
    ):
      | AddressCreatedResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401;

    @operationId("get_address")
    @summary("Find an Address by ID")
    @doc("""
      Find an Address by ID.

      ${tokenPermissions<"_Numbers_">}
      """)
    @route("/{Sid}")
    read(...AddressesAccountSidPath, ...AddressPathSid):
      | AddressResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404;

    @operationId("update_address")
    @summary("Update an Address")
    @doc("""
      Update an Address. The same carrier validation rules as `Create an Address` apply when `EmergencyEnabled=true`.

      ${tokenPermissions<"_Numbers_">}
      """)
    @post
    @route("/{Sid}")
    update(
      ...AddressesAccountSidPath,
      ...AddressPathSid,
      @header contentType: "application/x-www-form-urlencoded",
      @body body: UpdateAddressRequest,
    ):
      | AddressResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404;

    @operationId("delete_address")
    @summary("Delete an Address")
    @doc("""
      Delete an Address. An Address that is still assigned to one or more phone numbers cannot be deleted;
      the request is rejected until those phone numbers reference a different Address. Use
      `List Dependent Phone Numbers` to find the phone numbers that depend on an Address.

      ${tokenPermissions<"_Numbers_">}
      """)
    @delete
    @route("/{Sid}")
    delete(...AddressesAccountSidPath, ...AddressPathSid):
      | CompatibilityStatusCode204
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404
      | CompatibilityStatusCode422;
  }

  @tag(DEPENDENT_PHONE_NUMBERS_TAG)
  @friendlyName("DependentPhoneNumbers")
  @route("/{Sid}/DependentPhoneNumbers")
  interface DependentPhoneNumbers {
    @operationId("list_dependent_phone_numbers")
    @summary("List Dependent Phone Numbers")
    @doc("""
      List the phone numbers that use this Address as their emergency (E911) address.

      ${tokenPermissions<"_Numbers_">}
      """)
    list(
      ...AddressesAccountSidPath,
      ...AddressPathSid,

      @query
      @doc("The page number to retrieve. Page numbers are zero-indexed, so the first page is 0.")
      @minValue(0)
      @example(0)
      Page?: int32 = 0,

      @query
      @doc("The number of results to return per page. The default is 50, and the maximum is 1000.")
      @minValue(1)
      @maxValue(1000)
      @example(50)
      PageSize?: int32 = 50,

      @query
      @doc("A token used to retrieve a specific page of results.")
      @example("PA01234567890abcdef01234567890abcdef")
      PageToken?: string,
    ):
      | DependentPhoneNumberListResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode404;
  }
}
