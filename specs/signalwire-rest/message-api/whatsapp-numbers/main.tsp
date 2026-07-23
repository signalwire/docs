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
      Returns the WhatsApp numbers connected to your Space. Each record includes its association with a WhatsApp Business Account, voice-capability flags, and the resource IDs used for routing calls or messages. Use `phone_number` (prefixed with `whatsapp:`) as the `from` address when [sending messages](/docs/platform/messaging/whatsapp/send-messages).

      ${tokenPermissions<"_Numbers_">}
      """)
    list():
      | WhatsAppNumberListResponse
      | StatusCode401
      | StatusCode500;

    @operationId("retrieve_whatsapp_number")
    @summary("Get a WhatsApp number")
    @doc("""
      Retrieves the details of a single WhatsApp number.

      ${tokenPermissions<"_Numbers_">}
      """)
    read(...WhatsAppNumberPathID):
      | WhatsAppNumberResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
