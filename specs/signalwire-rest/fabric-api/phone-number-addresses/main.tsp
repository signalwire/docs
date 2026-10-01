import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../types";
import "../tags.tsp";
import "../_shared/enums.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/phone_number_addresses")
namespace SignalWireAPI.Fabric.PhoneNumberAddresses {
  @tag(PHONE_NUMBER_ADDRESSES_TAG)
  @friendlyName("Phone Number Addresses")
  @doc("""
    Phone Number Addresses API category. A phone number address routes one channel of a phone number
    you own — its `calling` channel or its `messaging` channel — to the resource that handles it. Every
    owned number has an address for each channel whether or not a resource is assigned, so this API
    manages the resource on each address: list and retrieve a number's addresses, link a resource to an
    unassigned channel, re-point or rename an address, and remove the resource, without the dashboard.
    This API is in beta and may change.

    This API is assign-only. It never purchases or releases a number; use the
    [Phone Numbers API](/docs/apis/rest/phone-numbers/list-phone-numbers) for that. It's also separate
    from [Assign Resource to phone route](/docs/apis/rest/phone-routes/assign-resource-phone-route),
    which assigns a number's handler from the resource's side.

    This API only sees phone number addresses that belong to your project. An ID from another project,
    an ID that belongs to a different kind of resource address (for example, a SIP address or a video
    room), or an address whose number has since been released returns a 404.
    """)
  interface PhoneNumberAddresses {
    @operationId("list_phone_number_addresses")
    @summary("List phone number addresses")
    @doc("""
      Lists the phone number addresses in your SignalWire project, newest first. Each address represents one channel (`calling` or `messaging`) of a phone number you own, together with the resource that handles it, if any. Addresses whose number has been released are not included. Use it to find the address ID for a number's channel before you link, re-point, or remove its resource.

      Only the pagination parameters are supported; there are no filters. A `page_token` that is malformed or no longer resolves returns a `422` with the code `page_token_is_invalid`.

      <Warning title="Beta">This API is in beta and may change.</Warning>

      ${tokenPermissions<"_Calling_, _Fax_, _Messaging_, or _Video_">}
      """)
    list(...PhoneNumberAddressListQuery):
      | PhoneNumberAddressListResponse
      | StatusCode401
      | PhoneNumberAddressListStatusCode422
      | StatusCode500;

    @operationId("get_phone_number_address")
    @summary("Get phone number address")
    @doc("""
      Retrieves one phone number address from your SignalWire project by ID. Use [List phone number addresses](/docs/apis/rest/phone-number-addresses/list-phone-number-addresses) to find the ID. The ID must belong to a phone number address in your project whose number you still own; an ID from another project, a different kind of resource address (for example, a SIP address), or a released number returns a 404.

      <Warning title="Beta">This API is in beta and may change.</Warning>

      ${tokenPermissions<"_Calling_, _Fax_, _Messaging_, or _Video_">}
      """)
    read(...PhoneNumberAddressPathID):
      | {
          @statusCode statusCode: 200;
          @body phone_number_address: PhoneNumberAddress;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("create_phone_number_address")
    @summary("Link a resource to a phone number")
    @doc("""
      Links a resource to an unassigned channel of a phone number you own, so inbound calls or messages to that number reach the resource. Reference the number by `phone_number_id` or by its E.164 `number`, and pick the channel with `handler_type`. The address for that channel already exists, so this operation sets its resource rather than creating a new address, and it never purchases a number. [Assign Resource to phone route](/docs/apis/rest/phone-routes/assign-resource-phone-route) does the same from the resource's side.

      A `422` response names the problem in its `code`:

      - `missing_required_parameter`: `resource_id` or `handler_type` is blank, or neither `phone_number_id` nor `number` was provided.
      - `invalid_parameter`: `handler_type` is not `calling` or `messaging`.
      - `provided_id_is_unrecognized`: the number is not owned by your project, or `resource_id` is not a resource in it.
      - `invalid_resource_type`: the resource can't handle the chosen channel.
      - `already_assigned`: the channel already has a resource. Use [Update the resource for a phone number](/docs/apis/rest/phone-number-addresses/update-phone-number-address) to re-point it instead.

      <Warning title="Beta">This API is in beta and may change.</Warning>

      ${tokenPermissions<"_Calling_, _Fax_, _Messaging_, or _Video_">}
      """)
    @opExample(
      #{
        parameters: #{
          request: #{
            phone_number_id: "1f2e3d4c-5b6a-7980-a1b2-c3d4e5f60718",
            resource_id: "8a7b6c5d-4e3f-2a1b-0c9d-8e7f6a5b4c3d",
            handler_type: UsedForType.Calling,
          },
        },
      },
      #{
        title: "By phone number ID",
        description: "Link a calling handler to a number referenced by its ID",
      }
    )
    @opExample(
      #{
        parameters: #{
          request: #{
            number: "+13105550100",
            resource_id: "8a7b6c5d-4e3f-2a1b-0c9d-8e7f6a5b4c3d",
            handler_type: UsedForType.Messaging,
          },
        },
      },
      #{
        title: "By number",
        description: "Link a messaging handler to a number referenced by its E.164 number",
      }
    )
    @post
    create(@body request: PhoneNumberAddressCreateRequest):
      | {
          @statusCode statusCode: 201;
          @body phone_number_address: PhoneNumberAddress;
        }
      | StatusCode400
      | StatusCode401
      | PhoneNumberAddressCreateStatusCode422
      | StatusCode500;

    @operationId("update_phone_number_address")
    @summary("Update the resource for a phone number")
    @doc("""
      Renames a phone number address, re-points its channel to a different resource, or both; omitted fields keep their current values. The channel itself is fixed: `handler_type` can't be changed, so to hand a number's other channel to a resource, update that channel's own address. Renaming the address also renames the phone number.

      A `422` response names the problem in its `code`:

      - `invalid_parameter`: `name` is not URL-safe or is longer than 256 characters.
      - `provided_id_is_unrecognized`: `resource_id` is not a resource in your project.
      - `invalid_resource_type`: the resource can't handle this address's channel.

      <Warning title="Beta">This API is in beta and may change.</Warning>

      ${tokenPermissions<"_Calling_, _Fax_, _Messaging_, or _Video_">}
      """)
    @patch
    update(...PhoneNumberAddressPathID, @body request: PhoneNumberAddressUpdateRequest):
      | {
          @statusCode statusCode: 200;
          @body phone_number_address: PhoneNumberAddress;
        }
      | StatusCode400
      | StatusCode401
      | StatusCode404
      | PhoneNumberAddressUpdateStatusCode422
      | StatusCode500;

    @operationId("delete_phone_number_address")
    @summary("Remove the resource from a phone number")
    @doc("""
      Removes the resource from a phone number's channel, so inbound calls or messages on that channel no longer reach it. The number stays in your project, the resource is not deleted, and the address remains with `resource_id` set to `null`, so it still appears in [List phone number addresses](/docs/apis/rest/phone-number-addresses/list-phone-number-addresses). To give up the number itself, use [Release phone number](/docs/apis/rest/phone-numbers/release-phone-number).

      <Warning title="Beta">This API is in beta and may change.</Warning>

      ${tokenPermissions<"_Calling_, _Fax_, _Messaging_, or _Video_">}
      """)
    @delete
    delete(...PhoneNumberAddressPathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
