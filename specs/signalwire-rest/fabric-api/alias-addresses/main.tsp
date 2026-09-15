import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../types";
import "../tags.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/alias_addresses")
namespace SignalWireAPI.Fabric.AliasAddresses {
  @tag(ALIAS_ADDRESSES_TAG)
  @friendlyName("Alias Addresses")
  @doc("""
    Alias Addresses API category. An alias is a named [resource address](/docs/platform/addresses): a
    `name` inside the `public` or `private` context that forwards calls and messages to the resource
    you point it at, reachable at `/<context>/<name>`. Use this API to list, create, rename, and
    delete aliases without the dashboard.

    This API only sees alias addresses that belong to your project. An ID from another project, or an
    ID that belongs to a different kind of address (for example, a SIP address), returns a 404.

    <Note>
    This is the project-scoped management API for aliases. It's separate from
    [List Resource Addresses from a Client](/docs/apis/rest/addresses/list-resource-addresses-client),
    which a client application calls with a subscriber token to discover the addresses it can reach.
    </Note>
    """)
  interface AliasAddresses {
    @operationId("list_alias_addresses")
    @summary("List alias addresses")
    @doc("""
      Lists the alias addresses in your SignalWire project. An alias is a named route in the `public` or `private` context that forwards calls and messages to the resource it points at. [SIP addresses](/docs/apis/rest/sip-addresses/list-sip-addresses) and [phone numbers](/docs/apis/rest/phone-numbers/list-phone-numbers) are managed through their own operations.

      ${tokenPermissions<"_Calling_, _Fax_, _Messaging_, or _Video_">}
      """)
    list(...AliasAddressListQuery):
      | AliasAddressListResponse
      | StatusCode401
      | AliasAddressListStatusCode422
      | StatusCode500;

    @operationId("get_alias_address")
    @summary("Get alias address")
    @doc("""
      Retrieves one alias address from your SignalWire project by ID. Use [List alias addresses](/docs/apis/rest/alias-addresses/list-alias-addresses) to find IDs. An ID that belongs to a different kind of address, such as a SIP address, returns a 404.

      ${tokenPermissions<"_Calling_, _Fax_, _Messaging_, or _Video_">}
      """)
    read(...AliasAddressPathID):
      | {
          @statusCode statusCode: 200;
          @body alias_address: AliasAddress;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("create_alias_address")
    @summary("Create alias address")
    @doc("""
      Creates an alias address that forwards to an existing resource in your project. `name` and `resource_id` are required; `display_name` defaults to `name`, `channels` to all three, `codecs` to none, and `context` to `public`. The handler resource can't be changed later: to point an alias at a different resource, delete it and create a new one.

      ${tokenPermissions<"_Calling_, _Fax_, _Messaging_, or _Video_">}
      """)
    @post
    create(@body request: AliasAddressCreateRequest):
      | {
          @statusCode statusCode: 201;
          @body alias_address: AliasAddress;
        }
      | StatusCode400
      | StatusCode401
      | AliasAddressCreateStatusCode422
      | StatusCode500;

    @operationId("update_alias_address")
    @summary("Update alias address")
    @doc("""
      Partially updates an alias address by ID; omitted fields keep their current values. Use it to rename the alias, change its display name, channels, or codecs, or move it between the `public` and `private` contexts. `resource_id` isn't accepted: to point an alias at a different resource, delete it and create a new one. An ID that belongs to a different kind of address, such as a SIP address, returns a 404.

      ${tokenPermissions<"_Calling_, _Fax_, _Messaging_, or _Video_">}
      """)
    @patch
    update(...AliasAddressPathID, @body request: AliasAddressUpdateRequest):
      | {
          @statusCode statusCode: 200;
          @body alias_address: AliasAddress;
        }
      | StatusCode400
      | StatusCode401
      | StatusCode404
      | AliasAddressUpdateStatusCode422
      | StatusCode500;

    @operationId("delete_alias_address")
    @summary("Delete alias address")
    @doc("""
      Deletes an alias address by ID, so `/<context>/<name>` no longer resolves. The handler resource it forwarded to isn't deleted. An ID that belongs to a different kind of address, such as a SIP address, returns a 404.

      ${tokenPermissions<"_Calling_, _Fax_, _Messaging_, or _Video_">}
      """)
    @delete
    delete(...AliasAddressPathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
