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

@route("/whatsapp/businesses")
namespace SignalWireAPI.Message.WhatsappBusinesses {
  @tag(WHATSAPP_BUSINESSES_TAG)
  @friendlyName("WhatsApp Businesses")
  interface WhatsAppBusinesses {
    @operationId("list_whatsapp_businesses")
    @summary("List WhatsApp Business Accounts")
    @doc("""
      Returns the WhatsApp Business Accounts (WABAs) connected to your SignalWire Space. Each account can have its own set of phone numbers and message templates. Use a `whatsapp_business_id` from this list when creating or filtering [message templates](/docs/platform/messaging/whatsapp/message-templates).

      ${tokenPermissions<"_Numbers_">}
      """)
    list():
      | WhatsAppBusinessListResponse
      | StatusCode401
      | StatusCode500;
  }
}
