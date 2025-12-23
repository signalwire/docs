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

@route("/resources/swml_webhooks")
namespace FabricAPI.SWMLWebhooks {
  @tag(SWML_WEBHOOK_TAG)
  @friendlyName("SWML Webhooks")
  interface SWMLWebhooks {
    @summary("List SWML Webhooks")
    @doc("""
      A list of SWML Webhooks

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    list():
      | SWMLWebhookListResponse
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @summary("Get SWML Webhook")
    @doc("""
      Returns an SWML Webhook by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
      """)
    read(...SWMLWebhookID):
      | {
          @statusCode statusCode: 200;
          @body swml_webhook: SWMLWebhookResponse;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @summary("Create SWML Webhook")
    @doc("""
      Creates an SWML Webhook

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
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

    @summary("Update SWML Webhook")
    @doc("""
      Updates an SWML Webhook by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
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

    @summary("Delete SWML Webhook")
    @doc("""
      Deletes an SWML Webhook by ID

      #### Permissions

      The API token used to authenticate must have one of the following scopes enabled to make a successful request: _Voice_, _Messaging_, _Fax_, or _Video_.

      [Learn more about API scopes](/platform/dashboard/getting-started/your-signalwire-api-space#api-token-scopes).
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
