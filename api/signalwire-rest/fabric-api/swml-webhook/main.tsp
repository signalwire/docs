import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "./models/errors.tsp";
import "../../types";

using TypeSpec.Http;
using Types.StatusCodes;

@route("/resources/swml_webhooks")
namespace FabricAPI.SWMLWebhooks {
  @tag("SWML Webhook")
  @friendlyName("SWML Webhooks")
  interface SWMLWebhooks {
    @summary("List SWML Webhooks")
    @doc("A list of SWML Webhooks")
    list():
      SWMLWebhookListResponse |
      StatusCode401 |
      StatusCode404;

    @summary("Get SWML Webhook")
    @doc("Returns an SWML Webhook by ID")
    read(...SWMLWebhookID): {
        @statusCode statusCode: 200;
        @body swml_webhook: SWMLWebhookResponse;
      } |
      StatusCode401 |
      StatusCode404;

    @summary("Create SWML Webhook")
    @doc("Creates an SWML Webhook")
    @post create(...SWMLWebhookCreateRequest):
      { @statusCode statusCode: 201; @body swml_webhook: SWMLWebhookResponse; } |
      StatusCode401 |
      StatusCode404 |
      SwmlWebhookCreateStatusCode422;
    @summary("Update SWML Webhook")
    @doc("Updates an SWML Webhook by ID")
    @patch(#{ implicitOptionality: true })  update(...SWMLWebhookID, ...SWMLWebhookUpdateRequest): {
      @statusCode statusCode: 200; @body swml_webhook: SWMLWebhookResponse;
    } |
      StatusCode401 |
      StatusCode404 |
      SwmlWebhookUpdateStatusCode422;

    @summary("Delete SWML Webhook")
    @doc("Deletes an SWML Webhook by ID")
    @delete delete(...SWMLWebhookID):
      { @statusCode statusCode: 204; } |
      StatusCode401 |
      StatusCode404;
    }
}

