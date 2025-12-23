import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "./addresses";
import "../../types";
import "../tags.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/cxml_webhooks")
namespace FabricAPI.CXMLWebhooks {
  @tag(CXML_WEBHOOK_TAG)
  @friendlyName("cXML Webhooks")
  interface CXMLWebhooks {
    @summary("List cXML Webhooks")
    @doc("""
      A list of cXML Webhooks

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    list():
      | CXMLWebhookListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @summary("Get cXML Webhook")
    @doc("""
      Returns an cXML Webhook by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    read(...CXMLWebhookID):
      | {
          @statusCode statusCode: 200;
          @body cxml_webhook: CXMLWebhookResponse;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @summary("Create cXML Webhook")
    @doc("""
      Creates an cXML Webhook

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
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

    @summary("Update cXML Webhook")
    @doc("""
      Updates an cXML Webhook by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
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

    @summary("Delete cXML Webhook")
    @doc("""
      Deletes an cXML Webhook by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
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
