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

@route("/resources/cxml_webhooks")
namespace SignalWireAPI.Fabric.CXMLWebhooks {
  @tag(CXML_WEBHOOK_TAG)
  @friendlyName("cXML Webhooks")
  interface CXMLWebhooks {
    @operationId("list_cxml_webhooks")
    @summary("List cXML webhooks")
    @doc("""
      Returns the project's cXML Webhook resources, whose configured servers return cXML for each request. Use it to discover server-backed cXML handlers before retrieving or changing one. Use [cXML Scripts](/docs/apis/rest/cxml-scripts/list-cxml-scripts) when the cXML should be stored in SignalWire instead.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    list():
      | CXMLWebhookListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("get_cxml_webhook")
    @summary("Get cXML webhook")
    @doc("""
      Retrieves one cXML Webhook by resource ID so you can inspect the server-backed handler. Use [List cXML webhooks](/docs/apis/rest/cxml-webhook/list-cxml-webhooks) to discover IDs, or a [cXML Script](/docs/apis/rest/cxml-scripts/create-cxml-script) for cXML stored in SignalWire.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    read(...CXMLWebhookID):
      | {
          @statusCode statusCode: 200;
          @body cxml_webhook: CXMLWebhookResponse;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("create_cxml_webhook")
    @summary("Create cXML webhook")
    @doc("""
      Creates a resource that requests cXML from your server when the handler runs. Use it when call or message instructions depend on current application state; use [Create cXML Script](/docs/apis/rest/cxml-scripts/create-cxml-script) when the cXML can be stored in SignalWire, or [Create SWML webhook](/docs/apis/rest/swml-webhook/create-swml-webhook) when the server returns SWML.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @post
    create(...CXMLWebhookCreateRequest):
      | {
          @statusCode statusCode: 201;
          @body cxml_webhook: CXMLWebhookResponse;
        }
      | StatusCode401
      | StatusCode404
      | CXMLWebhookCreateStatusCode422
      | StatusCode500;

    @operationId("update_cxml_webhook")
    @summary("Update cXML webhook")
    @doc("""
      Changes where and how a cXML Webhook requests instructions from your server. Use it when the server-backed handler's routing changes; use [Update cXML Script](/docs/apis/rest/cxml-scripts/update-cxml-script) for cXML stored in SignalWire.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @patch(#{ implicitOptionality: true })
    update(...CXMLWebhookID, ...CXMLWebhookUpdateRequest):
      | {
          @statusCode statusCode: 200;
          @body cxml_webhook: CXMLWebhookResponse;
        }
      | StatusCode401
      | StatusCode404
      | CXMLWebhookUpdateStatusCode422
      | StatusCode500;

    @operationId("delete_cxml_webhook")
    @summary("Delete cXML webhook")
    @doc("""
      Deletes a cXML Webhook resource by ID. Use it when SignalWire should stop requesting cXML from that server configuration; deleting a stored [cXML Script](/docs/apis/rest/cxml-scripts/delete-cxml-script) requires the script endpoint instead.
      
      ${tokenPermissions<"_Voice_, _Messaging_, _Fax_, or _Video_">}
      """)
    @delete
    delete(...CXMLWebhookID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;
  }
}
