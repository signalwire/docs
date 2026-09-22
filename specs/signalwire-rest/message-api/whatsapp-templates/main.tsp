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
      Lists the project's reusable WhatsApp message templates. Use it to find an approved template before sending business-initiated messages; a template must have `template_status` of `approved` before use. Use [Get a message template](/docs/apis/rest/whatsapp/retrieve-whatsapp-template) when you already have its SignalWire or Meta ID.

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
      Retrieves one WhatsApp message template by SignalWire ID or Meta template ID. Use it to inspect content and approval status for a known template; use [List message templates](/docs/apis/rest/whatsapp/list-whatsapp-templates) to discover or filter templates, or [Send a message](/docs/apis/rest/messages/create-message) after the template is approved.

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
      Creates a WhatsApp message template under a connected Business Account and submits it to Meta for review. Use it when outbound content must be sent outside the 24-hour customer service window. Approval typically takes from a few minutes to a few hours; poll the template until `template_status` becomes `approved`, then send it through [Send a message](/docs/apis/rest/messages/create-message).

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
      Changes a WhatsApp template's category, components, or both. Use it while the template is still awaiting approval; an approved template cannot be updated and must be deleted and recreated. This operation edits reusable template content and does not send a message.

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
      Deletes one WhatsApp message template by SignalWire ID or Meta template ID. Use it when the reusable template should no longer be available for outbound messages; this does not delete the WhatsApp Business Account or connected number.

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
