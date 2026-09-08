import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "./addresses";
import "../../types";
import "../tags.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/resources/swml_webhooks")
namespace SignalWireAPI.Fabric.SWMLWebhooks {
  @tag(SWML_WEBHOOK_TAG)
  @friendlyName("SWML Webhooks")
  interface SWMLWebhooks {
    @operationId("list_swml_webhooks")
    @summary("List SWML webhooks")
    @doc("""
      Returns the project's SWML Webhook resources, whose configured servers return calling or messaging SWML for each request. Use it to discover dynamic SWML handlers before retrieving or changing one. Use [SWML Scripts](/docs/apis/rest/swml-scripts/list-swml-scripts) when the SWML should be stored in SignalWire instead.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    list():
      | SWMLWebhookListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("get_swml_webhook")
    @summary("Get SWML webhook")
    @doc("""
      Retrieves one SWML Webhook by resource ID so you can inspect the server-backed handler. Use [List SWML webhooks](/docs/apis/rest/swml-webhook/list-swml-webhooks) to discover IDs, or a [SWML Script](/docs/apis/rest/swml-scripts/create-swml-script) for SWML stored in SignalWire.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    read(...SWMLWebhookID):
      | {
          @statusCode statusCode: 200;
          @body swml_webhook: SWMLWebhookResponse;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("create_swml_webhook")
    @summary("Create SWML webhook")
    @doc("""
      Creates a resource that requests calling or messaging SWML from your server when the handler runs. Use it when instructions must be generated from current application state; use [Create SWML Script](/docs/apis/rest/swml-scripts/create-swml-script) when the SWML can be stored in SignalWire, or [Create cXML webhook](/docs/apis/rest/cxml-webhook/create-cxml-webhook) when the server returns cXML.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @post
    create(...SWMLWebhookCreateRequest):
      | {
          @statusCode statusCode: 201;
          @body swml_webhook: SWMLWebhookResponse;
        }
      | StatusCode401
      | StatusCode404
      | SwmlWebhookCreateStatusCode422
      | StatusCode500;

    @operationId("update_swml_webhook")
    @summary("Update SWML webhook")
    @doc("""
      Changes where and how a SWML Webhook requests instructions from your server. Use it when the server-backed handler's routing changes; use [Update SWML Script](/docs/apis/rest/swml-scripts/update-swml-script) for SWML stored in SignalWire.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @patch(#{ implicitOptionality: true })
    update(...SWMLWebhookID, ...SWMLWebhookUpdateRequest):
      | {
          @statusCode statusCode: 200;
          @body swml_webhook: SWMLWebhookResponse;
        }
      | StatusCode401
      | StatusCode404
      | SwmlWebhookUpdateStatusCode422
      | StatusCode500;

    @operationId("delete_swml_webhook")
    @summary("Delete SWML webhook")
    @doc("""
      Deletes a SWML Webhook resource by ID. Use it when SignalWire should stop requesting SWML from that server configuration; deleting a stored [SWML Script](/docs/apis/rest/swml-scripts/delete-swml-script) requires the script endpoint instead.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @delete
    delete(...SWMLWebhookID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
