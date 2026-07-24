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
      Returns a list of your Addresses. The addresses are returned sorted by creation date, with the most recent appearing first.
      
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
      To create a new Address, make a POST request to the Address resource.

      When `emergency_enabled=true` and the address is in the US (`country` = `US`), the address is validated against the carrier. A valid or auto-corrected address is stored (`validated: true`). An address the carrier cannot validate — or a correctable address when `auto_correct_address=false` — is rejected with a `422` whose body includes an `errors` array and a `candidates` array of suggested addresses (each with `street_number`, `street_name`, `city`, `state`, `postal_code`). Non-US addresses and requests without `emergency_enabled` are stored without carrier validation.

      ${tokenPermissions<"_Numbers_">}
      """)
    @post
    create(@body body: CreateAddressRequest):
      | {
          @statusCode statusCode: 201;
          @body address: AddressResponse;
        }
      | StatusCode401
      | ValidationError
      | StatusCode500;

    @operationId("get_address")
    @summary("Get E911 address")
    @doc("""
      Retrieves the details of an Address that has been previously created.
      Use the unique ID that was returned from your previous request to identify the specific instance.

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
      Updates an Address that has been previously created.

      When `emergency_enabled=true` and the address is in the US (`country` = `US`), the address is validated against the carrier. A valid or auto-corrected address is stored (`validated: true`). An address the carrier cannot validate — or a correctable address when `auto_correct_address=false` — is rejected with a `422` whose body includes an `errors` array and a `candidates` array of suggested addresses (each with `street_number`, `street_name`, `city`, `state`, `postal_code`). Non-US addresses and requests without `emergency_enabled` are stored without carrier validation.

      ${tokenPermissions<"_Numbers_">}
      """)
    @put
    update(...AddressPathID, @body body: UpdateAddressRequest):
      | AddressResponse
      | StatusCode401
      | StatusCode404
      | ValidationError
      | StatusCode500;

    @operationId("delete_address")
    @summary("Delete E911 address")
    @doc("""
      Permanently deletes an Address. It cannot be undone.
      
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
