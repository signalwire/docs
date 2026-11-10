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

@route("/addresses")
namespace SignalWireAPI.RelayRest.Addresses {
  @tag(ADDRESSES_TAG)
  @friendlyName("Addresses")
  interface Addresses {
    @operationId("list_addresses")
    @summary("List E911 addresses")
    @doc("""
      Lists the physical E911 service addresses stored in your SignalWire project. An E911 address represents the real-world location emergency services should receive for a phone number; create and validate one before assigning it to that number. Resource addresses and SIP Addresses are callable routing handles, not emergency locations. Results are sorted by creation date, most recent first.
      
      ${tokenPermissions<"_Numbers_">}
      """)
    list(...ListAddressesQuery):
      | AddressListResponse
      | StatusCode401
      | ValidationError
      | StatusCode500;

    @operationId("create_address")
    @summary("Create E911 address")
    @doc("""
      Creates a physical E911 service address that can be assigned to an owned phone number for emergency calling. Use it before [Assign an E911 address to a phone number](/docs/apis/rest/e-911-addresses/assign-e-911-address) when emergency services need the caller's registered street location. Do not use this endpoint for a resource address or SIP URI.

      When `emergency_enabled=true` and the address is in the US (`country` = `US`), the address is validated against the carrier. A valid or auto-corrected address is stored (`validated: true`). An address the carrier cannot validate — or a correctable address when `auto_correct_address=false` — is rejected with a `422` whose body includes an `errors` array and a `candidates` array of suggested addresses (each with `street_number`, `street_name`, `city`, `state`, `postal_code`). Carrier validation applies to US addresses only: a non-US address is stored normally, with `emergency_enabled` returned as `false`. Requests without `emergency_enabled` are stored without carrier validation.

      ${tokenPermissions<"_Numbers_">}
      """)
    @post
    create(@body body: CreateAddressRequest):
      | AddressResponse
      | StatusCode401
      | AddressValidationError
      | StatusCode500;

    @operationId("get_address")
    @summary("Get E911 address")
    @doc("""
      Retrieves one physical E911 service address from your SignalWire project. Use [List E911 addresses](/docs/apis/rest/e-911-addresses/list-addresses) to find address IDs, or [Get phone number](/docs/apis/rest/phone-numbers/retrieve-phone-number) to inspect the address currently assigned to a number.

      ${tokenPermissions<"_Numbers_">}
      """)
    read(...AddressPathID):
      | AddressResponse
      | StatusCode401
      | StatusCode404
      | ValidationError
      | StatusCode500;

    @operationId("update_address")
    @summary("Update E911 address")
    @doc("""
      Changes a physical E911 service location and performs carrier validation when requested. Assigning the updated location to a phone number remains a separate [phone-number operation](/docs/apis/rest/e-911-addresses/assign-e-911-address).

      When `emergency_enabled=true` and the address is in the US (`country` = `US`), the address is validated against the carrier. A valid or auto-corrected address is stored (`validated: true`). An address the carrier cannot validate — or a correctable address when `auto_correct_address=false` — is rejected with a `422` whose body includes an `errors` array and a `candidates` array of suggested addresses (each with `street_number`, `street_name`, `city`, `state`, `postal_code`). Carrier validation applies to US addresses only: a non-US address is stored normally, with `emergency_enabled` returned as `false`. Requests without `emergency_enabled` are stored without carrier validation.

      ${tokenPermissions<"_Numbers_">}
      """)
    @put
    update(...AddressPathID, @body body: UpdateAddressRequest):
      | AddressResponse
      | StatusCode401
      | StatusCode404
      | AddressValidationError
      | StatusCode500;

    @operationId("delete_address")
    @summary("Delete E911 address")
    @doc("""
      Permanently deletes a physical E911 service address by ID. Use it when the emergency location record is no longer needed; use [Remove the E911 address from a phone number](/docs/apis/rest/e-911-addresses/remove-e-911-address) when only the number's assignment should be removed. Resource addresses and SIP Addresses have separate delete operations.
      
      ${tokenPermissions<"_Numbers_">}
      """)
    @delete
    delete(...AddressPathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode400
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
