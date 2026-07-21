import "@typespec/http";
import "@typespec/openapi";
import "../../types/status-codes/main.tsp";
import "../tags.tsp";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/whatsapp/templates")
namespace SignalWireAPI.Message.WhatsappTemplates {
  @tag(WHATSAPP_TEMPLATES_TAG)
  @friendlyName("WhatsApp Templates")
  interface WhatsAppTemplates {
    @operationId("list_whatsapp_templates")
    @summary("List message templates")
    @doc("""
      Returns the message templates for your Space, optionally filtered by WhatsApp Business Account or approval status. A template must have `template_status` of `approved` before it can be used to send messages.

      ${tokenPermissions<"_Numbers_">}
      """)
    list(...ListWhatsAppTemplatesQuery):
      | WhatsAppTemplateListResponse
      | StatusCode400
      | StatusCode401
      | StatusCode500;

    @operationId("retrieve_whatsapp_template")
    @summary("Get a message template")
    @doc("""
      Retrieves a single message template by SignalWire ID or Meta template ID.

      ${tokenPermissions<"_Numbers_">}
      """)
    read(...WhatsAppTemplatePathID):
      | WhatsAppTemplateResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("create_whatsapp_template")
    @summary("Create a message template")
    @doc("""
      Creates a message template and submits it to Meta for review. Approval typically takes from a few minutes to a few hours; poll the template's `template_status` until it becomes `approved`.

      ${tokenPermissions<"_Numbers_">}
      """)
    @post
    create(@body body: CreateWhatsAppTemplateRequest):
      | WhatsAppTemplateCreatedResponse
      | StatusCode400
      | StatusCode401
      | StatusCode422
      | StatusCode500;

    @operationId("update_whatsapp_template")
    @summary("Update a message template")
    @doc("""
      Updates a template's `category` or `components`. A template can only be updated while it is **not yet approved** — once approved, delete and recreate it to make changes.

      ${tokenPermissions<"_Numbers_">}
      """)
    @patch(#{ implicitOptionality: false })
    update(...WhatsAppTemplatePathID, @body body: UpdateWhatsAppTemplateRequest):
      | WhatsAppTemplateResponse
      | StatusCode400
      | StatusCode401
      | StatusCode404
      | StatusCode422
      | StatusCode500;

    @operationId("delete_whatsapp_template")
    @summary("Delete a message template")
    @doc("""
      Deletes a message template.

      ${tokenPermissions<"_Numbers_">}
      """)
    @delete
    delete(...WhatsAppTemplatePathID):
      | WhatsAppTemplateDeleteResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
