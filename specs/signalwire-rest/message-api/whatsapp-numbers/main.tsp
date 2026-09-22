import "@typespec/http";
import "@typespec/openapi";
import "../../types/status-codes/main.tsp";
import "../tags.tsp";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/whatsapp/numbers")
namespace SignalWireAPI.Message.WhatsappNumbers {
  @tag(WHATSAPP_NUMBERS_TAG)
  @friendlyName("WhatsApp Numbers")
  interface WhatsAppNumbers {
    @operationId("list_whatsapp_numbers")
    @summary("List WhatsApp numbers")
    @doc("""
      Lists the WhatsApp numbers connected to the project. These numbers act as WhatsApp senders and can route inbound communication to SignalWire resources. Prefix a number with `whatsapp:` when [sending messages](/docs/platform/messaging/whatsapp/send-messages). Standard SMS and MMS long codes use the [Phone Numbers API](/docs/apis/rest/phone-numbers/list-phone-numbers).

      ${tokenPermissions<"_Numbers_">}
      """)
    list():
      | WhatsAppNumberListResponse
      | StatusCode401
      | StatusCode500;

    @operationId("retrieve_whatsapp_number")
    @summary("Get a WhatsApp number")
    @doc("""
      Retrieves one connected WhatsApp number by SignalWire ID so you can inspect how it is used for outbound and inbound communication. Use [List WhatsApp numbers](/docs/apis/rest/whatsapp/list-whatsapp-numbers) to discover IDs. Standard SMS and MMS phone numbers use [Get phone number](/docs/apis/rest/phone-numbers/retrieve-phone-number).

      ${tokenPermissions<"_Numbers_">}
      """)
    read(...WhatsAppNumberPathID):
      | WhatsAppNumberResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
